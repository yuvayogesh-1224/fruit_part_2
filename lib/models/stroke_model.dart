import 'package:flutter/material.dart';

enum BrushStyle {
  soft,
  crayon,
  pencil,
  texture,
  spray,
  glitter,
}

extension BrushStyleExtension on BrushStyle {
  String get displayName {
    switch (this) {
      case BrushStyle.soft:
        return 'Soft Brush';
      case BrushStyle.crayon:
        return 'Crayon';
      case BrushStyle.pencil:
        return 'Pencil';
      case BrushStyle.texture:
        return 'Marker';
      case BrushStyle.spray:
        return 'Spray';
      case BrushStyle.glitter:
        return 'Glitter';
    }
  }

  IconData get icon {
    switch (this) {
      case BrushStyle.soft:
        return Icons.brush_rounded;
      case BrushStyle.crayon:
        return Icons.draw_rounded;
      case BrushStyle.pencil:
        return Icons.edit_rounded;
      case BrushStyle.texture:
        return Icons.format_paint_rounded;
      case BrushStyle.spray:
        return Icons.grain_rounded;
      case BrushStyle.glitter:
        return Icons.auto_awesome_rounded;
    }
  }
}

class BrushStroke {
  final List<Offset> points;
  final Color color;
  final double size;
  final BrushStyle style;
  final bool isEraser;

  BrushStroke({
    required List<Offset> points,
    required this.color,
    required this.size,
    required this.style,
    this.isEraser = false,
  }) : points = List.unmodifiable(points);

  BrushStroke copyWithNewPoints(List<Offset> newPoints) {
    return BrushStroke(
      points: newPoints,
      color: color,
      size: size,
      style: style,
      isEraser: isEraser,
    );
  }
}
