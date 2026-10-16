import 'package:flutter/material.dart';
import '../models/drawing_model.dart';
import '../models/stroke_model.dart';

abstract class ColoringAction {
  void undo(ColoringDrawing drawing);
  void redo(ColoringDrawing drawing);
}

class StrokeAction extends ColoringAction {
  final String regionId;
  final BrushStroke stroke;

  StrokeAction({required this.regionId, required this.stroke});

  @override
  void undo(ColoringDrawing drawing) {
    final region = drawing.regions.firstWhere(
      (r) => r.id == regionId,
      orElse: () => throw Exception('Region not found'),
    );
    if (region.strokes.isNotEmpty) {
      region.strokes.removeLast();
      region.updateCoverage();
    }
  }

  @override
  void redo(ColoringDrawing drawing) {
    final region = drawing.regions.firstWhere(
      (r) => r.id == regionId,
      orElse: () => throw Exception('Region not found'),
    );
    region.strokes.add(stroke);
    region.updateCoverage();
  }
}

class FillAction extends ColoringAction {
  final String regionId;
  final Color? previousColor;
  final Color newColor;

  FillAction({
    required this.regionId,
    required this.previousColor,
    required this.newColor,
  });

  @override
  void undo(ColoringDrawing drawing) {
    final region = drawing.regions.firstWhere((r) => r.id == regionId);
    region.fillColor = previousColor;
    region.updateCoverage();
  }

  @override
  void redo(ColoringDrawing drawing) {
    final region = drawing.regions.firstWhere((r) => r.id == regionId);
    region.fillColor = newColor;
    region.updateCoverage();
  }
}

class ClearRegionAction extends ColoringAction {
  final String regionId;
  final Color? previousFillColor;
  final List<BrushStroke> previousStrokes;

  ClearRegionAction({
    required this.regionId,
    required this.previousFillColor,
    required List<BrushStroke> previousStrokes,
  }) : previousStrokes = List.from(previousStrokes);

  @override
  void undo(ColoringDrawing drawing) {
    final region = drawing.regions.firstWhere((r) => r.id == regionId);
    region.fillColor = previousFillColor;
    region.strokes.addAll(previousStrokes);
    region.updateCoverage();
  }

  @override
  void redo(ColoringDrawing drawing) {
    final region = drawing.regions.firstWhere((r) => r.id == regionId);
    region.clear();
  }
}

class ResetPictureAction extends ColoringAction {
  final Map<String, ({Color? fillColor, List<BrushStroke> strokes})> snapshots;

  ResetPictureAction(this.snapshots);

  @override
  void undo(ColoringDrawing drawing) {
    for (final region in drawing.regions) {
      final snap = snapshots[region.id];
      if (snap != null) {
        region.fillColor = snap.fillColor;
        region.strokes.clear();
        region.strokes.addAll(snap.strokes);
        region.updateCoverage();
      }
    }
  }

  @override
  void redo(ColoringDrawing drawing) {
    drawing.reset();
  }
}

class UndoRedoManager extends ChangeNotifier {
  final List<ColoringAction> _undoStack = [];
  final List<ColoringAction> _redoStack = [];

  bool get canUndo => _undoStack.isNotEmpty;
  bool get canRedo => _redoStack.isNotEmpty;

  void recordAction(ColoringAction action) {
    _undoStack.add(action);
    _redoStack.clear();
    notifyListeners();
  }

  bool undo(ColoringDrawing drawing) {
    if (_undoStack.isEmpty) return false;
    final action = _undoStack.removeLast();
    action.undo(drawing);
    _redoStack.add(action);
    notifyListeners();
    return true;
  }

  bool redo(ColoringDrawing drawing) {
    if (_redoStack.isEmpty) return false;
    final action = _redoStack.removeLast();
    action.redo(drawing);
    _undoStack.add(action);
    notifyListeners();
    return true;
  }

  void clear() {
    _undoStack.clear();
    _redoStack.clear();
    notifyListeners();
  }
}
