import 'package:flutter/material.dart';
import '../models/drawing_model.dart';
import 'region_mask_manager.dart';
import 'undo_redo_manager.dart';

class FillTool {
  final RegionMaskManager regionMaskManager;
  final UndoRedoManager undoRedoManager;

  FillTool({
    required this.regionMaskManager,
    required this.undoRedoManager,
  });

  /// Executes paint-bucket fill at given canonical coordinate
  bool applyFill({
    required Offset canonicalPoint,
    required Color color,
    required ColoringDrawing drawing,
  }) {
    final region = regionMaskManager.findRegionAt(canonicalPoint);
    if (region == null || region.isProtected) return false;

    // Do nothing if already filled with same color and has no strokes to override
    if (region.fillColor == color && region.strokes.isEmpty) return false;

    undoRedoManager.recordAction(
      FillAction(
        regionId: region.id,
        previousColor: region.fillColor,
        newColor: color,
      ),
    );

    region.fill(color);
    return true;
  }
}
