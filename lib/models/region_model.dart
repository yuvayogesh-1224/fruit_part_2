import 'package:flutter/material.dart';
import 'stroke_model.dart';

class ColoringRegion {
  final String id;
  final String name;
  final Path path;
  final Color? defaultColor;
  final bool isProtected;
  final bool requiredForCompletion;

  Color? fillColor;
  final List<BrushStroke> strokes;
  double coverage;

  ColoringRegion({
    required this.id,
    required this.name,
    required this.path,
    this.defaultColor,
    this.isProtected = false,
    this.requiredForCompletion = true,
    this.fillColor,
    List<BrushStroke>? strokes,
    this.coverage = 0.0,
  }) : strokes = strokes ?? [];

  bool get isColored => fillColor != null || strokes.isNotEmpty || coverage >= 0.35;

  void addStroke(BrushStroke stroke) {
    strokes.add(stroke);
    updateCoverage();
  }

  void fill(Color color) {
    fillColor = color;
    coverage = 1.0;
  }

  void clear() {
    fillColor = null;
    strokes.clear();
    coverage = 0.0;
  }

  void updateCoverage() {
    if (fillColor != null) {
      coverage = 1.0;
      return;
    }
    if (strokes.isEmpty) {
      coverage = 0.0;
      return;
    }
    // Calculate coverage based on stroke length, stroke size and region area
    final bounds = path.getBounds();
    final area = (bounds.width * bounds.height).clamp(100.0, 250000.0);
    double coloredArea = 0;
    for (final s in strokes) {
      if (s.isEraser) continue;
      // Approximate stroke ribbon area: total length * stroke width
      double length = 0;
      for (int i = 0; i < s.points.length - 1; i++) {
        length += (s.points[i + 1] - s.points[i]).distance;
      }
      coloredArea += (length.clamp(10.0, 5000.0) * s.size * 0.85);
    }
    // Damping factor so realistic finger coloring achieves completion naturally
    coverage = (coloredArea / (area * 0.75)).clamp(0.0, 1.0);
  }

  ColoringRegion clone() {
    return ColoringRegion(
      id: id,
      name: name,
      path: path,
      defaultColor: defaultColor,
      isProtected: isProtected,
      requiredForCompletion: requiredForCompletion,
      fillColor: fillColor,
      strokes: List<BrushStroke>.from(strokes),
      coverage: coverage,
    );
  }
}
