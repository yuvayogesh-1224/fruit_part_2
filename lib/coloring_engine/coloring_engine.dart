import 'package:flutter/material.dart';
import '../models/drawing_model.dart';
import '../models/region_model.dart';
import '../models/stroke_model.dart';
import 'brush_controller.dart';
import 'fill_tool.dart';
import 'region_mask_manager.dart';
import 'undo_redo_manager.dart';

class ColoringEngine extends ChangeNotifier {
  ColoringDrawing _drawing;
  final RegionMaskManager regionMaskManager = RegionMaskManager();
  final UndoRedoManager undoRedoManager = UndoRedoManager();
  final BrushController brushController = BrushController();
  late final FillTool fillTool;

  BrushStroke? _activeStroke;
  ColoringRegion? _activeStrokeRegion;

  ColoringEngine({required ColoringDrawing initialDrawing}) : _drawing = initialDrawing {
    regionMaskManager.setDrawing(_drawing);
    fillTool = FillTool(
      regionMaskManager: regionMaskManager,
      undoRedoManager: undoRedoManager,
    );
    brushController.addListener(notifyListeners);
    undoRedoManager.addListener(notifyListeners);
  }

  ColoringDrawing get drawing => _drawing;
  ColoringRegion? get activeRegion => regionMaskManager.activeRegion;
  BrushStroke? get activeStroke => _activeStroke;
  bool get isCompleted => _drawing.isCompleted;
  double get totalCoverage => _drawing.totalCoverage;

  void loadDrawing(ColoringDrawing newDrawing) {
    _drawing = newDrawing;
    regionMaskManager.setDrawing(_drawing);
    undoRedoManager.clear();
    _activeStroke = null;
    _activeStrokeRegion = null;
    notifyListeners();
  }

  /// Called when user touches down on the canvas (screen coordinates converted to canonical 500x500)
  void onTouchDown(Offset point) {
    if (brushController.isFillTool) {
      final filled = fillTool.applyFill(
        canonicalPoint: point,
        color: brushController.color,
        drawing: _drawing,
      );
      if (filled) {
        notifyListeners();
      }
      return;
    }

    final region = regionMaskManager.startStrokeAt(point);
    if (region != null) {
      _activeStrokeRegion = region;
      _activeStroke = brushController.createStroke(point);
      region.strokes.add(_activeStroke!);
      notifyListeners();
    }
  }

  /// Called when user drags finger across canvas
  void onTouchMove(Offset point) {
    if (_activeStroke != null && _activeStrokeRegion != null) {
      // Add point to stroke
      final updatedPoints = List<Offset>.from(_activeStroke!.points)..add(point);
      final newStroke = _activeStroke!.copyWithNewPoints(updatedPoints);

      // Replace current stroke in region
      final idx = _activeStrokeRegion!.strokes.indexOf(_activeStroke!);
      if (idx != -1) {
        _activeStrokeRegion!.strokes[idx] = newStroke;
      }
      _activeStroke = newStroke;
      notifyListeners();
    }
  }

  /// Called when user lifts finger from canvas
  void onTouchUp() {
    if (_activeStroke != null && _activeStrokeRegion != null) {
      _activeStrokeRegion!.updateCoverage();
      // Record in undo manager
      undoRedoManager.recordAction(
        StrokeAction(
          regionId: _activeStrokeRegion!.id,
          stroke: _activeStroke!,
        ),
      );
    }
    _activeStroke = null;
    _activeStrokeRegion = null;
    regionMaskManager.endStroke();
    notifyListeners();
  }

  /// Undo last stroke or fill
  void undo() {
    if (undoRedoManager.undo(_drawing)) {
      notifyListeners();
    }
  }

  /// Redo previously undone stroke or fill
  void redo() {
    if (undoRedoManager.redo(_drawing)) {
      notifyListeners();
    }
  }

  /// Reset the entire drawing
  void resetDrawing() {
    final Map<String, ({Color? fillColor, List<BrushStroke> strokes})> snapshots = {};
    for (final r in _drawing.regions) {
      snapshots[r.id] = (
        fillColor: r.fillColor,
        strokes: List<BrushStroke>.from(r.strokes),
      );
    }
    undoRedoManager.recordAction(ResetPictureAction(snapshots));
    _drawing.reset();
    notifyListeners();
  }

  /// Clear only the current region
  void clearCurrentRegion(String regionId) {
    try {
      final region = _drawing.regions.firstWhere((r) => r.id == regionId);
      undoRedoManager.recordAction(
        ClearRegionAction(
          regionId: region.id,
          previousFillColor: region.fillColor,
          previousStrokes: region.strokes,
        ),
      );
      region.clear();
      notifyListeners();
    } catch (_) {}
  }

  @override
  void dispose() {
    brushController.removeListener(notifyListeners);
    undoRedoManager.removeListener(notifyListeners);
    brushController.dispose();
    undoRedoManager.dispose();
    super.dispose();
  }
}
