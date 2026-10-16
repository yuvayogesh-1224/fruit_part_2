import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../models/region_model.dart';
import '../models/stroke_model.dart';

class BrushPainter {
  /// Render all strokes and fills for a single region, strictly clipped to its path
  static void paintRegion(Canvas canvas, ColoringRegion region) {
    if (region.fillColor == null && region.strokes.isEmpty) {
      return;
    }

    final bounds = region.path.getBounds();
    // Expand bounds slightly to prevent clipping edge artifacts
    final layerBounds = bounds.inflate(10);

    canvas.save();
    // 1. HARDWARE CLIP TO REGION PATH — ABSOLUTE BARRIER
    canvas.clipPath(region.path);

    final hasEraser = region.strokes.any((s) => s.isEraser);

    if (hasEraser) {
      canvas.saveLayer(layerBounds, Paint());
    }

    // 2. Draw Solid / Bucket Fill if present
    if (region.fillColor != null) {
      final fillPaint = Paint()
        ..color = region.fillColor!
        ..style = PaintingStyle.fill
        ..isAntiAlias = true;
      canvas.drawPath(region.path, fillPaint);
    }

    // 3. Draw All User Strokes
    for (final stroke in region.strokes) {
      if (stroke.points.isEmpty) continue;

      if (stroke.isEraser) {
        _paintEraser(canvas, stroke);
      } else {
        switch (stroke.style) {
          case BrushStyle.soft:
            _paintSoftBrush(canvas, stroke);
            break;
          case BrushStyle.crayon:
            _paintCrayonBrush(canvas, stroke);
            break;
          case BrushStyle.pencil:
            _paintPencilBrush(canvas, stroke);
            break;
          case BrushStyle.texture:
            _paintTextureBrush(canvas, stroke);
            break;
          case BrushStyle.spray:
            _paintSprayBrush(canvas, stroke);
            break;
          case BrushStyle.glitter:
            _paintGlitterBrush(canvas, stroke);
            break;
        }
      }
    }

    if (hasEraser) {
      canvas.restore();
    }

    canvas.restore();
  }

  static void _paintEraser(Canvas canvas, BrushStroke stroke) {
    if (stroke.points.length == 1) {
      canvas.drawCircle(
        stroke.points.first,
        stroke.size / 2,
        Paint()
          ..blendMode = BlendMode.clear
          ..isAntiAlias = true,
      );
      return;
    }

    final path = Path()..moveTo(stroke.points.first.dx, stroke.points.first.dy);
    for (int i = 1; i < stroke.points.length; i++) {
      path.lineTo(stroke.points[i].dx, stroke.points[i].dy);
    }

    final paint = Paint()
      ..blendMode = BlendMode.clear
      ..style = PaintingStyle.stroke
      ..strokeWidth = stroke.size * 1.2
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..isAntiAlias = true;

    canvas.drawPath(path, paint);
  }

  static void _paintSoftBrush(Canvas canvas, BrushStroke stroke) {
    if (stroke.points.length == 1) {
      final p = stroke.points.first;
      canvas.drawCircle(
        p,
        stroke.size / 2,
        Paint()
          ..color = stroke.color.withValues(alpha: 0.85)
          ..style = PaintingStyle.fill
          ..isAntiAlias = true,
      );
      return;
    }

    final path = Path()..moveTo(stroke.points.first.dx, stroke.points.first.dy);
    for (int i = 1; i < stroke.points.length; i++) {
      final p0 = stroke.points[i - 1];
      final p1 = stroke.points[i];
      final mid = Offset((p0.dx + p1.dx) / 2, (p0.dy + p1.dy) / 2);
      path.quadraticBezierTo(p0.dx, p0.dy, mid.dx, mid.dy);
    }
    path.lineTo(stroke.points.last.dx, stroke.points.last.dy);

    final paint = Paint()
      ..color = stroke.color.withValues(alpha: 0.90)
      ..style = PaintingStyle.stroke
      ..strokeWidth = stroke.size
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..isAntiAlias = true;

    canvas.drawPath(path, paint);
  }

  static void _paintCrayonBrush(Canvas canvas, BrushStroke stroke) {
    // 1. Base textured stroke
    final mainPaint = Paint()
      ..color = stroke.color.withValues(alpha: 0.82)
      ..style = PaintingStyle.stroke
      ..strokeWidth = stroke.size
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..isAntiAlias = true;

    if (stroke.points.length == 1) {
      canvas.drawCircle(stroke.points.first, stroke.size / 2, Paint()..color = stroke.color);
      return;
    }

    final path = Path()..moveTo(stroke.points.first.dx, stroke.points.first.dy);
    for (int i = 1; i < stroke.points.length; i++) {
      path.lineTo(stroke.points[i].dx, stroke.points[i].dy);
    }
    canvas.drawPath(path, mainPaint);

    // 2. Grainy wax texture stipples along stroke
    final grainPaint = Paint()
      ..color = stroke.color.withValues(alpha: 0.45)
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    final dotCount = stroke.points.length;
    for (int i = 0; i < dotCount; i++) {
      final pt = stroke.points[i];
      // Deterministic pseudo-random offsets based on index
      final angle = (i * 137.5) * (math.pi / 180.0);
      final r1 = (math.sin(i * 3.7).abs() * stroke.size * 0.45);
      final r2 = (math.cos(i * 5.1).abs() * stroke.size * 0.4);

      final p1 = Offset(pt.dx + math.cos(angle) * r1, pt.dy + math.sin(angle) * r1);
      final p2 = Offset(pt.dx - math.sin(angle) * r2, pt.dy + math.cos(angle) * r2);

      canvas.drawCircle(p1, 1.8, grainPaint);
      canvas.drawCircle(p2, 1.4, grainPaint);
    }
  }

  static void _paintPencilBrush(Canvas canvas, BrushStroke stroke) {
    final pencilPaint = Paint()
      ..color = stroke.color.withValues(alpha: 0.85)
      ..style = PaintingStyle.stroke
      ..strokeWidth = math.max(3.0, stroke.size * 0.4)
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..isAntiAlias = true;

    if (stroke.points.length == 1) {
      canvas.drawCircle(stroke.points.first, stroke.size * 0.25, Paint()..color = stroke.color);
      return;
    }

    final path = Path()..moveTo(stroke.points.first.dx, stroke.points.first.dy);
    for (int i = 1; i < stroke.points.length; i++) {
      path.lineTo(stroke.points[i].dx, stroke.points[i].dy);
    }
    canvas.drawPath(path, pencilPaint);

    // Secondary parallel graphite sketch line for authentic pencil feel
    final sketchPaint = Paint()
      ..color = stroke.color.withValues(alpha: 0.5)
      ..style = PaintingStyle.stroke
      ..strokeWidth = math.max(1.5, stroke.size * 0.25)
      ..strokeCap = StrokeCap.round
      ..isAntiAlias = true;

    final offsetPath = Path();
    for (int i = 0; i < stroke.points.length; i++) {
      final off = Offset(stroke.points[i].dx + 1.2, stroke.points[i].dy + 1.2);
      if (i == 0) {
        offsetPath.moveTo(off.dx, off.dy);
      } else {
        offsetPath.lineTo(off.dx, off.dy);
      }
    }
    canvas.drawPath(offsetPath, sketchPaint);
  }

  static void _paintTextureBrush(Canvas canvas, BrushStroke stroke) {
    // Rich Marker / Highlighter chisel style
    final markerPaint = Paint()
      ..color = stroke.color.withValues(alpha: 0.70)
      ..style = PaintingStyle.stroke
      ..strokeWidth = stroke.size * 1.15
      ..strokeCap = StrokeCap.square
      ..strokeJoin = StrokeJoin.bevel
      ..isAntiAlias = true;

    if (stroke.points.length == 1) {
      canvas.drawRect(
        Rect.fromCenter(center: stroke.points.first, width: stroke.size, height: stroke.size),
        Paint()..color = stroke.color.withValues(alpha: 0.7),
      );
      return;
    }

    final path = Path()..moveTo(stroke.points.first.dx, stroke.points.first.dy);
    for (int i = 1; i < stroke.points.length; i++) {
      path.lineTo(stroke.points[i].dx, stroke.points[i].dy);
    }
    canvas.drawPath(path, markerPaint);
  }

  static void _paintSprayBrush(Canvas canvas, BrushStroke stroke) {
    final dropletPaint = Paint()..style = PaintingStyle.fill;
    final radius = stroke.size * 0.85;

    for (int i = 0; i < stroke.points.length; i += 2) {
      final pt = stroke.points[i];
      // Generate spray mist cluster around this point
      for (int k = 0; k < 7; k++) {
        final seed = (i * 17 + k * 31);
        final angle = (seed % 360) * (math.pi / 180.0);
        final dist = ((seed * 7) % 100) / 100.0 * radius;
        final dropX = pt.dx + math.cos(angle) * dist;
        final dropY = pt.dy + math.sin(angle) * dist;
        final dropSize = 1.0 + ((seed % 20) / 10.0);
        final dropAlpha = 0.25 + (((seed * 3) % 45) / 100.0);

        dropletPaint.color = stroke.color.withValues(alpha: dropAlpha);
        canvas.drawCircle(Offset(dropX, dropY), dropSize, dropletPaint);
      }
    }
  }

  static void _paintGlitterBrush(Canvas canvas, BrushStroke stroke) {
    // 1. Soft glowing underlying stroke
    final glowPaint = Paint()
      ..color = stroke.color.withValues(alpha: 0.65)
      ..style = PaintingStyle.stroke
      ..strokeWidth = stroke.size * 0.8
      ..strokeCap = StrokeCap.round
      ..isAntiAlias = true;

    if (stroke.points.length > 1) {
      final path = Path()..moveTo(stroke.points.first.dx, stroke.points.first.dy);
      for (int i = 1; i < stroke.points.length; i++) {
        path.lineTo(stroke.points[i].dx, stroke.points[i].dy);
      }
      canvas.drawPath(path, glowPaint);
    }

    // 2. Sparkling 4-point stars and diamond sparkles
    final starPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    final goldPaint = Paint()
      ..color = const Color(0xFFFFD700)
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    for (int i = 0; i < stroke.points.length; i += 3) {
      final pt = stroke.points[i];
      final seed = (i * 29 + 13);
      final angle = (seed % 360) * (math.pi / 180.0);
      final dist = (seed % 60) / 60.0 * (stroke.size * 0.5);
      final sparkX = pt.dx + math.cos(angle) * dist;
      final sparkY = pt.dy + math.sin(angle) * dist;

      final sparkCenter = Offset(sparkX, sparkY);
      final sparkSize = 4.0 + (seed % 6);

      // Draw diamond or 4-point star
      if (seed % 2 == 0) {
        _drawFourPointStar(canvas, sparkCenter, sparkSize, starPaint);
      } else {
        _drawFourPointStar(canvas, sparkCenter, sparkSize * 0.85, goldPaint);
      }
    }
  }

  static void _drawFourPointStar(Canvas canvas, Offset center, double size, Paint paint) {
    final path = Path()
      ..moveTo(center.dx, center.dy - size)
      ..quadraticBezierTo(center.dx, center.dy, center.dx + size, center.dy)
      ..quadraticBezierTo(center.dx, center.dy, center.dx, center.dy + size)
      ..quadraticBezierTo(center.dx, center.dy, center.dx - size, center.dy)
      ..quadraticBezierTo(center.dx, center.dy, center.dx, center.dy - size)
      ..close();
    canvas.drawPath(path, paint);
  }
}
