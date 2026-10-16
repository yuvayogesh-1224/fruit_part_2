import 'package:flutter/material.dart';
import '../models/drawing_model.dart';
import '../models/region_model.dart';

class RegionMaskManager {
  ColoringDrawing? _currentDrawing;
  ColoringRegion? _activeRegion;

  void setDrawing(ColoringDrawing drawing) {
    _currentDrawing = drawing;
    _activeRegion = null;
  }

  ColoringRegion? get activeRegion => _activeRegion;

  /// Find which region contains the given point in canonical 500x500 coordinates.
  /// Ignores protected regions (eyes, mouth, detail lines).
  ColoringRegion? findRegionAt(Offset canonicalPoint) {
    if (_currentDrawing == null) return null;

    // Search in reverse order (topmost layer region first)
    for (final region in _currentDrawing!.regions.reversed) {
      if (!region.isProtected && region.path.contains(canonicalPoint)) {
        return region;
      }
    }
    return null;
  }

  /// Lock onto a region when finger touch begins
  ColoringRegion? startStrokeAt(Offset canonicalPoint) {
    _activeRegion = findRegionAt(canonicalPoint);
    return _activeRegion;
  }

  /// Release region lock when finger lifts
  void endStroke() {
    _activeRegion = null;
  }
}
