import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class DrawingBuilderHelpers {
  /// Draw standard crisp black outline for a path
  static void drawOutline(Canvas canvas, Path path, {double width = 5.5, Color color = AppColors.outlineBlack}) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = width
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..isAntiAlias = true;
    canvas.drawPath(path, paint);
  }

  /// Draw circular outline
  static void drawCircleOutline(Canvas canvas, Offset center, double radius, {double width = 5.5, Color color = AppColors.outlineBlack}) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = width
      ..strokeCap = StrokeCap.round
      ..isAntiAlias = true;
    canvas.drawCircle(center, radius, paint);
  }

  /// Draw line outline
  static void drawLine(Canvas canvas, Offset p1, Offset p2, {double width = 5.0, Color color = AppColors.outlineBlack}) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = width
      ..strokeCap = StrokeCap.round
      ..isAntiAlias = true;
    canvas.drawLine(p1, p2, paint);
  }

  /// Draw cute kawaii eyes, smile, and pink blushing cheeks
  static void drawKawaiiFace(
    Canvas canvas, {
    required Offset leftEye,
    required Offset rightEye,
    required Offset mouthCenter,
    double eyeRadius = 9.0,
    double mouthRadius = 14.0,
    bool drawBlush = true,
  }) {
    final blackPaint = Paint()
      ..color = AppColors.detailBlack
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    final whiteGlint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    // 1. Left Eye
    canvas.drawCircle(leftEye, eyeRadius, blackPaint);
    canvas.drawCircle(
      Offset(leftEye.dx - eyeRadius * 0.3, leftEye.dy - eyeRadius * 0.3),
      eyeRadius * 0.35,
      whiteGlint,
    );
    canvas.drawCircle(
      Offset(leftEye.dx + eyeRadius * 0.35, leftEye.dy + eyeRadius * 0.3),
      eyeRadius * 0.18,
      whiteGlint,
    );

    // 2. Right Eye
    canvas.drawCircle(rightEye, eyeRadius, blackPaint);
    canvas.drawCircle(
      Offset(rightEye.dx - eyeRadius * 0.3, rightEye.dy - eyeRadius * 0.3),
      eyeRadius * 0.35,
      whiteGlint,
    );
    canvas.drawCircle(
      Offset(rightEye.dx + eyeRadius * 0.35, rightEye.dy + eyeRadius * 0.3),
      eyeRadius * 0.18,
      whiteGlint,
    );

    // 3. Smiling Mouth
    final mouthPath = Path()
      ..moveTo(mouthCenter.dx - mouthRadius, mouthCenter.dy)
      ..quadraticBezierTo(mouthCenter.dx, mouthCenter.dy + mouthRadius * 1.1, mouthCenter.dx + mouthRadius, mouthCenter.dy);
    final mouthPaint = Paint()
      ..color = AppColors.detailBlack
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4.5
      ..strokeCap = StrokeCap.round
      ..isAntiAlias = true;
    canvas.drawPath(mouthPath, mouthPaint);

    // 4. Rosy Cheeks
    if (drawBlush) {
      final blushPaint = Paint()
        ..color = const Color(0xFFFF85A1).withValues(alpha: 0.6)
        ..style = PaintingStyle.fill
        ..isAntiAlias = true;

      canvas.drawOval(
        Rect.fromCenter(
          center: Offset(leftEye.dx - 12, leftEye.dy + 12),
          width: 14,
          height: 9,
        ),
        blushPaint,
      );
      canvas.drawOval(
        Rect.fromCenter(
          center: Offset(rightEye.dx + 12, rightEye.dy + 12),
          width: 14,
          height: 9,
        ),
        blushPaint,
      );
    }
  }

  /// Create an oval path
  static Path makeOvalPath(Rect rect) {
    return Path()..addOval(rect);
  }

  /// Create rounded rect path
  static Path makeRRectPath(Rect rect, double radius) {
    return Path()..addRRect(RRect.fromRectAndRadius(rect, Radius.circular(radius)));
  }

  /// Create leaf path
  static Path makeLeafPath(Offset start, Offset end, double bulge) {
    final midX = (start.dx + end.dx) / 2;
    final midY = (start.dy + end.dy) / 2;
    final angle = math.atan2(end.dy - start.dy, end.dx - start.dx);
    final normalAngle = angle + math.pi / 2;

    final cp1 = Offset(
      midX + math.cos(normalAngle) * bulge,
      midY + math.sin(normalAngle) * bulge,
    );
    final cp2 = Offset(
      midX - math.cos(normalAngle) * bulge,
      midY - math.sin(normalAngle) * bulge,
    );

    final path = Path()
      ..moveTo(start.dx, start.dy)
      ..quadraticBezierTo(cp1.dx, cp1.dy, end.dx, end.dy)
      ..quadraticBezierTo(cp2.dx, cp2.dy, start.dx, start.dy)
      ..close();
    return path;
  }

  /// Create regular star path
  static Path makeStarPath(Offset center, double outerRadius, double innerRadius, int points) {
    final path = Path();
    final double step = math.pi / points;
    double currentAngle = -math.pi / 2;

    for (int i = 0; i < points * 2; i++) {
      final r = (i % 2 == 0) ? outerRadius : innerRadius;
      final x = center.dx + math.cos(currentAngle) * r;
      final y = center.dy + math.sin(currentAngle) * r;
      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
      currentAngle += step;
    }
    path.close();
    return path;
  }
}
