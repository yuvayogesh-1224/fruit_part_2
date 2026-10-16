import 'dart:convert';
import 'dart:io';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import '../coloring_engine/brush_painter.dart';
import '../coloring_engine/coloring_canvas.dart';
import '../models/drawing_model.dart';

class SavedArtworkInfo {
  final String id;
  final String drawingId;
  final String title;
  final int levelNumber;
  final String filePath;
  final DateTime savedAt;

  SavedArtworkInfo({
    required this.id,
    required this.drawingId,
    required this.title,
    required this.levelNumber,
    required this.filePath,
    required this.savedAt,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'drawingId': drawingId,
        'title': title,
        'levelNumber': levelNumber,
        'filePath': filePath,
        'savedAt': savedAt.toIso8601String(),
      };

  factory SavedArtworkInfo.fromJson(Map<String, dynamic> json) => SavedArtworkInfo(
        id: json['id'] as String,
        drawingId: json['drawingId'] as String,
        title: json['title'] as String,
        levelNumber: json['levelNumber'] as int,
        filePath: json['filePath'] as String,
        savedAt: DateTime.parse(json['savedAt'] as String),
      );
}

class ArtworkStorageService extends ChangeNotifier {
  static const String _metadataFileName = 'saved_artworks.json';
  final List<SavedArtworkInfo> _artworks = [];

  List<SavedArtworkInfo> get artworks => List.unmodifiable(_artworks);

  Future<void> init() async {
    try {
      final dir = await getApplicationDocumentsDirectory();
      final metaFile = File('${dir.path}/$_metadataFileName');
      if (await metaFile.exists()) {
        final content = await metaFile.readAsString();
        final List<dynamic> list = jsonDecode(content) as List<dynamic>;
        _artworks.clear();
        for (final item in list) {
          _artworks.add(SavedArtworkInfo.fromJson(item as Map<String, dynamic>));
        }
      }
    } catch (_) {}
    notifyListeners();
  }

  Future<SavedArtworkInfo?> saveDrawing(ColoringDrawing drawing) async {
    try {
      final dir = await getApplicationDocumentsDirectory();
      final artworksDir = Directory('${dir.path}/artworks');
      if (!await artworksDir.exists()) {
        await artworksDir.create(recursive: true);
      }

      // Render drawing onto offline image
      final recorder = ui.PictureRecorder();
      final canvas = Canvas(recorder);
      const size = Size(ColoringCanvas.canonicalWidth, ColoringCanvas.canonicalHeight);

      // White paper canvas
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          const Rect.fromLTWH(0, 0, 500, 500),
          const Radius.circular(24),
        ),
        Paint()..color = Colors.white,
      );

      // Draw regions
      for (final r in drawing.regions) {
        BrushPainter.paintRegion(canvas, r);
      }

      // Details & Outlines
      drawing.detailsPainter?.call(canvas, size);
      drawing.outlinesPainter(canvas, size);

      final picture = recorder.endRecording();
      final image = await picture.toImage(500, 500);
      final byteData = await image.toByteData(format: ui.ImageByteFormat.png);

      if (byteData == null) return null;

      final artworkId = 'art_${DateTime.now().millisecondsSinceEpoch}';
      final file = File('${artworksDir.path}/$artworkId.png');
      await file.writeAsBytes(byteData.buffer.asUint8List());

      final info = SavedArtworkInfo(
        id: artworkId,
        drawingId: drawing.id,
        title: drawing.title,
        levelNumber: drawing.levelNumber,
        filePath: file.path,
        savedAt: DateTime.now(),
      );

      _artworks.insert(0, info);
      await _persistMetadata();
      notifyListeners();
      return info;
    } catch (_) {
      return null;
    }
  }

  Future<void> _persistMetadata() async {
    try {
      final dir = await getApplicationDocumentsDirectory();
      final metaFile = File('${dir.path}/$_metadataFileName');
      final jsonList = _artworks.map((a) => a.toJson()).toList();
      await metaFile.writeAsString(jsonEncode(jsonList));
    } catch (_) {}
  }

  Future<void> deleteArtwork(String id) async {
    final idx = _artworks.indexWhere((a) => a.id == id);
    if (idx != -1) {
      final item = _artworks.removeAt(idx);
      try {
        final f = File(item.filePath);
        if (await f.exists()) await f.delete();
      } catch (_) {}
      await _persistMetadata();
      notifyListeners();
    }
  }
}
