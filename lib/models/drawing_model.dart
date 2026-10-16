import 'package:flutter/material.dart';
import 'category_model.dart';
import 'region_model.dart';

typedef CanvasPainterFn = void Function(Canvas canvas, Size size);

class ColoringDrawing {
  final String id;
  final String title;
  final DrawingCategory category;
  final int levelNumber;
  final List<ColoringRegion> regions;
  final CanvasPainterFn? detailsPainter;
  final CanvasPainterFn outlinesPainter;
  final String? funFact;

  ColoringDrawing({
    required this.id,
    required this.title,
    required this.category,
    required this.levelNumber,
    required this.regions,
    this.detailsPainter,
    required this.outlinesPainter,
    this.funFact,
  });

  /// Check completion: all required regions must have sufficient coverage or be filled
  bool get isCompleted {
    final requiredRegions = regions.where((r) => r.requiredForCompletion && !r.isProtected);
    if (requiredRegions.isEmpty) return false;

    for (final region in requiredRegions) {
      if (!region.isColored && region.coverage < 0.65) {
        return false;
      }
    }
    return true;
  }

  /// Overall completion percentage (0.0 to 1.0)
  double get totalCoverage {
    final requiredRegions = regions.where((r) => r.requiredForCompletion && !r.isProtected).toList();
    if (requiredRegions.isEmpty) return 0.0;
    double sum = 0.0;
    for (final r in requiredRegions) {
      sum += r.coverage;
    }
    return (sum / requiredRegions.length).clamp(0.0, 1.0);
  }

  /// Resets all region fills and brush strokes
  void reset() {
    for (final r in regions) {
      r.clear();
    }
  }

  /// Create a fresh copy of this drawing with clean or cloned regions
  ColoringDrawing clone() {
    return ColoringDrawing(
      id: id,
      title: title,
      category: category,
      levelNumber: levelNumber,
      regions: regions.map((r) => r.clone()).toList(),
      detailsPainter: detailsPainter,
      outlinesPainter: outlinesPainter,
      funFact: funFact,
    );
  }
}
