import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../models/drawing_model.dart';
import '../theme/app_colors.dart';
import 'brush_painter.dart';
import 'coloring_engine.dart';

class ColoringCanvas extends StatelessWidget {
  final ColoringEngine engine;

  const ColoringCanvas({
    super.key,
    required this.engine,
  });

  static const double canonicalWidth = 500.0;
  static const double canonicalHeight = 500.0;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double widgetWidth = constraints.maxWidth;
        final double widgetHeight = constraints.maxHeight;

        final double scale = math.min(
          widgetWidth / canonicalWidth,
          widgetHeight / canonicalHeight,
        );

        final double contentWidth = canonicalWidth * scale;
        final double contentHeight = canonicalHeight * scale;

        final double offsetX = (widgetWidth - contentWidth) / 2.0;
        final double offsetY = (widgetHeight - contentHeight) / 2.0;

        Offset toCanonical(Offset localPos) {
          final double cx = (localPos.dx - offsetX) / scale;
          final double cy = (localPos.dy - offsetY) / scale;
          return Offset(cx.clamp(0.0, canonicalWidth), cy.clamp(0.0, canonicalHeight));
        }

        return Container(
          width: widgetWidth,
          height: widgetHeight,
          alignment: Alignment.center,
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onPanStart: (details) {
              engine.onTouchDown(toCanonical(details.localPosition));
            },
            onPanUpdate: (details) {
              engine.onTouchMove(toCanonical(details.localPosition));
            },
            onPanEnd: (_) {
              engine.onTouchUp();
            },
            onPanCancel: () {
              engine.onTouchUp();
            },
            onTapDown: (details) {
              engine.onTouchDown(toCanonical(details.localPosition));
            },
            onTapUp: (_) {
              engine.onTouchUp();
            },
            child: AnimatedBuilder(
              animation: engine,
              builder: (context, _) {
                return CustomPaint(
                  size: Size(widgetWidth, widgetHeight),
                  painter: _ColoringCanvasPainter(
                    drawing: engine.drawing,
                    scale: scale,
                    offsetX: offsetX,
                    offsetY: offsetY,
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}

class _ColoringCanvasPainter extends CustomPainter {
  final ColoringDrawing drawing;
  final double scale;
  final double offsetX;
  final double offsetY;

  _ColoringCanvasPainter({
    required this.drawing,
    required this.scale,
    required this.offsetX,
    required this.offsetY,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // 1. Draw rounded paper canvas background
    final canvasRect = Rect.fromLTWH(
      offsetX,
      offsetY,
      ColoringCanvas.canonicalWidth * scale,
      ColoringCanvas.canonicalHeight * scale,
    );
    final rrect = RRect.fromRectAndRadius(canvasRect, const Radius.circular(28.0));

    // Canvas drop shadow
    canvas.drawRRect(
      rrect.shift(const Offset(0, 8)),
      Paint()
        ..color = const Color(0x182D3142)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 12),
    );

    // Canvas paper fill
    canvas.drawRRect(
      rrect,
      Paint()
        ..color = AppColors.canvasBackground
        ..style = PaintingStyle.fill,
    );

    // Subtle paper border
    canvas.drawRRect(
      rrect,
      Paint()
        ..color = const Color(0xFFE8E8E8)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2.0,
    );

    // 2. Transform coordinate system into canonical 500x500 space
    canvas.save();
    // Clip whole canvas to rounded paper bounds
    canvas.clipRRect(rrect);
    canvas.translate(offsetX, offsetY);
    canvas.scale(scale, scale);

    const canonicalSize = Size(ColoringCanvas.canonicalWidth, ColoringCanvas.canonicalHeight);

    // 3. COLOR LAYER: Paint each region strictly clipped to its own Path!
    for (final region in drawing.regions) {
      BrushPainter.paintRegion(canvas, region);
    }

    // 4. PROTECTED DETAILS LAYER: Eyes, pupils, mouth, sparkle highlights
    drawing.detailsPainter?.call(canvas, canonicalSize);

    // 5. CRISP OUTLINES LAYER: Thick, clean, rounded black line art rendered strictly on top!
    drawing.outlinesPainter(canvas, canonicalSize);

    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant _ColoringCanvasPainter oldDelegate) {
    return true;
  }
}
