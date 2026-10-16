import 'package:flutter/material.dart';
import '../models/category_model.dart';
import '../models/drawing_model.dart';
import '../models/region_model.dart';
import 'drawing_builder_helpers.dart';

List<ColoringDrawing> getFruitDrawings() {
  return [
    // Level 1: Apple
    ColoringDrawing(
      id: 'fruit_apple',
      title: 'Sweet Apple',
      category: DrawingCategory.fruits,
      levelNumber: 1,
      funFact: 'Apples float in water because they are 25% air!',
      regions: [
        ColoringRegion(
          id: 'apple_body',
          name: 'Apple Body',
          defaultColor: const Color(0xFFFF3B30),
          path: Path()
            ..moveTo(250, 160)
            ..cubicTo(200, 120, 120, 150, 110, 240)
            ..cubicTo(100, 330, 160, 420, 220, 430)
            ..cubicTo(240, 435, 250, 420, 250, 420)
            ..cubicTo(250, 420, 260, 435, 280, 430)
            ..cubicTo(340, 420, 400, 330, 390, 240)
            ..cubicTo(380, 150, 300, 120, 250, 160)
            ..close(),
        ),
        ColoringRegion(
          id: 'apple_stem',
          name: 'Stem',
          defaultColor: const Color(0xFF8B5A2B),
          path: Path()
            ..moveTo(246, 160)
            ..quadraticBezierTo(244, 110, 265, 80)
            ..lineTo(275, 83)
            ..quadraticBezierTo(256, 110, 254, 160)
            ..close(),
        ),
        ColoringRegion(
          id: 'apple_leaf',
          name: 'Green Leaf',
          defaultColor: const Color(0xFF34C759),
          path: DrawingBuilderHelpers.makeLeafPath(const Offset(260, 120), const Offset(330, 95), 24),
        ),
      ],
      detailsPainter: (canvas, size) {
        DrawingBuilderHelpers.drawKawaiiFace(
          canvas,
          leftEye: const Offset(205, 250),
          rightEye: const Offset(295, 250),
          mouthCenter: const Offset(250, 275),
          eyeRadius: 9,
        );
      },
      outlinesPainter: (canvas, size) {
        final bodyPath = Path()
          ..moveTo(250, 160)
          ..cubicTo(200, 120, 120, 150, 110, 240)
          ..cubicTo(100, 330, 160, 420, 220, 430)
          ..cubicTo(240, 435, 250, 420, 250, 420)
          ..cubicTo(250, 420, 260, 435, 280, 430)
          ..cubicTo(340, 420, 400, 330, 390, 240)
          ..cubicTo(380, 150, 300, 120, 250, 160)
          ..close();
        DrawingBuilderHelpers.drawOutline(canvas, bodyPath, width: 6.0);

        final stemPath = Path()
          ..moveTo(246, 160)
          ..quadraticBezierTo(244, 110, 265, 80)
          ..lineTo(275, 83)
          ..quadraticBezierTo(256, 110, 254, 160)
          ..close();
        DrawingBuilderHelpers.drawOutline(canvas, stemPath, width: 5.0);

        final leafPath = DrawingBuilderHelpers.makeLeafPath(const Offset(260, 120), const Offset(330, 95), 24);
        DrawingBuilderHelpers.drawOutline(canvas, leafPath, width: 5.0);
      },
    ),

    // Level 2: Banana
    ColoringDrawing(
      id: 'fruit_banana',
      title: 'Happy Banana',
      category: DrawingCategory.fruits,
      levelNumber: 2,
      funFact: 'Bananas are naturally slightly radioactive because of potassium!',
      regions: [
        ColoringRegion(
          id: 'banana_body',
          name: 'Banana Body',
          defaultColor: const Color(0xFFFFCC00),
          path: Path()
            ..moveTo(140, 110)
            ..cubicTo(210, 140, 380, 220, 360, 380)
            ..cubicTo(330, 410, 280, 410, 250, 390)
            ..cubicTo(160, 310, 110, 190, 140, 110)
            ..close(),
        ),
        ColoringRegion(
          id: 'banana_stem',
          name: 'Stem Tip',
          defaultColor: const Color(0xFF705335),
          path: Path()
            ..moveTo(140, 110)
            ..lineTo(125, 90)
            ..lineTo(145, 80)
            ..lineTo(155, 105)
            ..close(),
        ),
      ],
      detailsPainter: (canvas, size) {
        DrawingBuilderHelpers.drawKawaiiFace(
          canvas,
          leftEye: const Offset(240, 255),
          rightEye: const Offset(295, 290),
          mouthCenter: const Offset(270, 295),
          eyeRadius: 8,
        );
      },
      outlinesPainter: (canvas, size) {
        final body = Path()
          ..moveTo(140, 110)
          ..cubicTo(210, 140, 380, 220, 360, 380)
          ..cubicTo(330, 410, 280, 410, 250, 390)
          ..cubicTo(160, 310, 110, 190, 140, 110)
          ..close();
        DrawingBuilderHelpers.drawOutline(canvas, body, width: 6.0);

        final stem = Path()
          ..moveTo(140, 110)
          ..lineTo(125, 90)
          ..lineTo(145, 80)
          ..lineTo(155, 105)
          ..close();
        DrawingBuilderHelpers.drawOutline(canvas, stem, width: 5.0);
      },
    ),

    // Level 3: Strawberry
    ColoringDrawing(
      id: 'fruit_strawberry',
      title: 'Juicy Strawberry',
      category: DrawingCategory.fruits,
      levelNumber: 3,
      funFact: 'Strawberries are the only fruit that wear their seeds on the outside!',
      regions: [
        ColoringRegion(
          id: 'straw_body',
          name: 'Berry Body',
          defaultColor: const Color(0xFFFF2D55),
          path: Path()
            ..moveTo(150, 180)
            ..cubicTo(140, 150, 360, 150, 350, 180)
            ..cubicTo(360, 280, 310, 390, 250, 430)
            ..cubicTo(190, 390, 140, 280, 150, 180)
            ..close(),
        ),
        ColoringRegion(
          id: 'straw_cap',
          name: 'Green Cap',
          defaultColor: const Color(0xFF34C759),
          path: Path()
            ..moveTo(250, 150)
            ..lineTo(190, 130)
            ..lineTo(210, 165)
            ..lineTo(140, 175)
            ..lineTo(200, 190)
            ..lineTo(250, 170)
            ..lineTo(300, 190)
            ..lineTo(360, 175)
            ..lineTo(290, 165)
            ..lineTo(310, 130)
            ..close(),
        ),
      ],
      detailsPainter: (canvas, size) {
        DrawingBuilderHelpers.drawKawaiiFace(
          canvas,
          leftEye: const Offset(210, 260),
          rightEye: const Offset(290, 260),
          mouthCenter: const Offset(250, 290),
          eyeRadius: 9,
        );
        // Seeds
        final seedPaint = Paint()
          ..color = const Color(0xFFFFD166)
          ..style = PaintingStyle.fill;
        const seeds = [
          Offset(180, 220),
          Offset(320, 220),
          Offset(190, 330),
          Offset(310, 330),
          Offset(230, 370),
          Offset(270, 370),
        ];
        for (final s in seeds) {
          canvas.drawOval(Rect.fromCenter(center: s, width: 6, height: 10), seedPaint);
        }
      },
      outlinesPainter: (canvas, size) {
        final body = Path()
          ..moveTo(150, 180)
          ..cubicTo(140, 150, 360, 150, 350, 180)
          ..cubicTo(360, 280, 310, 390, 250, 430)
          ..cubicTo(190, 390, 140, 280, 150, 180)
          ..close();
        DrawingBuilderHelpers.drawOutline(canvas, body, width: 6.0);

        final cap = Path()
          ..moveTo(250, 150)
          ..lineTo(190, 130)
          ..lineTo(210, 165)
          ..lineTo(140, 175)
          ..lineTo(200, 190)
          ..lineTo(250, 170)
          ..lineTo(300, 190)
          ..lineTo(360, 175)
          ..lineTo(290, 165)
          ..lineTo(310, 130)
          ..close();
        DrawingBuilderHelpers.drawOutline(canvas, cap, width: 5.5);
      },
    ),

    // Level 4: Orange
    ColoringDrawing(
      id: 'fruit_orange',
      title: 'Sunny Orange',
      category: DrawingCategory.fruits,
      levelNumber: 4,
      funFact: 'Orange trees were first cultivated in ancient Asia over 4,000 years ago!',
      regions: [
        ColoringRegion(
          id: 'orange_body',
          name: 'Orange',
          defaultColor: const Color(0xFFFF9500),
          path: Path()..addOval(Rect.fromCircle(center: const Offset(250, 260), radius: 140)),
        ),
        ColoringRegion(
          id: 'orange_leaf',
          name: 'Leaf',
          defaultColor: const Color(0xFF34C759),
          path: DrawingBuilderHelpers.makeLeafPath(const Offset(250, 120), const Offset(315, 85), 20),
        ),
      ],
      detailsPainter: (canvas, size) {
        DrawingBuilderHelpers.drawKawaiiFace(
          canvas,
          leftEye: const Offset(200, 245),
          rightEye: const Offset(300, 245),
          mouthCenter: const Offset(250, 275),
          eyeRadius: 9,
        );
      },
      outlinesPainter: (canvas, size) {
        DrawingBuilderHelpers.drawCircleOutline(canvas, const Offset(250, 260), 140, width: 6.0);
        final leaf = DrawingBuilderHelpers.makeLeafPath(const Offset(250, 120), const Offset(315, 85), 20);
        DrawingBuilderHelpers.drawOutline(canvas, leaf, width: 5.0);
      },
    ),

    // Level 5: Watermelon
    ColoringDrawing(
      id: 'fruit_watermelon',
      title: 'Watermelon Slice',
      category: DrawingCategory.fruits,
      levelNumber: 5,
      funFact: 'Watermelon is 92% water and very hydrating on hot sunny days!',
      regions: [
        ColoringRegion(
          id: 'wm_flesh',
          name: 'Red Flesh',
          defaultColor: const Color(0xFFFF2D55),
          path: Path()
            ..moveTo(100, 210)
            ..quadraticBezierTo(250, 420, 400, 210)
            ..close(),
        ),
        ColoringRegion(
          id: 'wm_rind',
          name: 'Green Rind',
          defaultColor: const Color(0xFF34C759),
          path: Path()
            ..moveTo(80, 205)
            ..quadraticBezierTo(250, 455, 420, 205)
            ..lineTo(400, 210)
            ..quadraticBezierTo(250, 420, 100, 210)
            ..close(),
        ),
      ],
      detailsPainter: (canvas, size) {
        DrawingBuilderHelpers.drawKawaiiFace(
          canvas,
          leftEye: const Offset(205, 260),
          rightEye: const Offset(295, 260),
          mouthCenter: const Offset(250, 290),
          eyeRadius: 8,
        );
        // Seeds
        final seedPaint = Paint()..color = const Color(0xFF1C1C1E);
        for (final s in [const Offset(180, 230), const Offset(320, 230), const Offset(230, 330), const Offset(270, 330)]) {
          canvas.drawOval(Rect.fromCenter(center: s, width: 7, height: 11), seedPaint);
        }
      },
      outlinesPainter: (canvas, size) {
        final flesh = Path()
          ..moveTo(100, 210)
          ..quadraticBezierTo(250, 420, 400, 210)
          ..close();
        DrawingBuilderHelpers.drawOutline(canvas, flesh, width: 5.5);

        final rind = Path()
          ..moveTo(80, 205)
          ..quadraticBezierTo(250, 455, 420, 205)
          ..lineTo(400, 210)
          ..quadraticBezierTo(250, 420, 100, 210)
          ..close();
        DrawingBuilderHelpers.drawOutline(canvas, rind, width: 5.5);
      },
    ),

    // Level 6: Grapes
    ColoringDrawing(
      id: 'fruit_grapes',
      title: 'Purple Grapes',
      category: DrawingCategory.fruits,
      levelNumber: 6,
      funFact: 'Grapes can come in purple, red, green, and even blue hues!',
      regions: [
        ColoringRegion(
          id: 'grapes_bunch',
          name: 'Grape Bunch',
          defaultColor: const Color(0xFFAF52DE),
          path: Path()
            ..addOval(Rect.fromCircle(center: const Offset(210, 210), radius: 40))
            ..addOval(Rect.fromCircle(center: const Offset(290, 210), radius: 40))
            ..addOval(Rect.fromCircle(center: const Offset(250, 270), radius: 40))
            ..addOval(Rect.fromCircle(center: const Offset(190, 310), radius: 36))
            ..addOval(Rect.fromCircle(center: const Offset(310, 310), radius: 36))
            ..addOval(Rect.fromCircle(center: const Offset(250, 370), radius: 34)),
        ),
        ColoringRegion(
          id: 'grapes_leaf',
          name: 'Grape Leaf',
          defaultColor: const Color(0xFF34C759),
          path: DrawingBuilderHelpers.makeLeafPath(const Offset(250, 160), const Offset(340, 120), 28),
        ),
      ],
      detailsPainter: (canvas, size) {
        DrawingBuilderHelpers.drawKawaiiFace(
          canvas,
          leftEye: const Offset(230, 260),
          rightEye: const Offset(270, 260),
          mouthCenter: const Offset(250, 275),
          eyeRadius: 7,
        );
      },
      outlinesPainter: (canvas, size) {
        DrawingBuilderHelpers.drawCircleOutline(canvas, const Offset(210, 210), 40);
        DrawingBuilderHelpers.drawCircleOutline(canvas, const Offset(290, 210), 40);
        DrawingBuilderHelpers.drawCircleOutline(canvas, const Offset(250, 270), 40);
        DrawingBuilderHelpers.drawCircleOutline(canvas, const Offset(190, 310), 36);
        DrawingBuilderHelpers.drawCircleOutline(canvas, const Offset(310, 310), 36);
        DrawingBuilderHelpers.drawCircleOutline(canvas, const Offset(250, 370), 34);

        final leaf = DrawingBuilderHelpers.makeLeafPath(const Offset(250, 160), const Offset(340, 120), 28);
        DrawingBuilderHelpers.drawOutline(canvas, leaf, width: 5.0);
      },
    ),

    // Level 7: Pineapple
    ColoringDrawing(
      id: 'fruit_pineapple',
      title: 'Crown Pineapple',
      category: DrawingCategory.fruits,
      levelNumber: 7,
      funFact: 'It can take nearly two years for a single pineapple to grow!',
      regions: [
        ColoringRegion(
          id: 'pine_body',
          name: 'Pineapple Body',
          defaultColor: const Color(0xFFFFCC00),
          path: Path()..addOval(Rect.fromCenter(center: const Offset(250, 300), width: 180, height: 230)),
        ),
        ColoringRegion(
          id: 'pine_crown',
          name: 'Spiky Crown',
          defaultColor: const Color(0xFF34C759),
          path: Path()
            ..moveTo(210, 200)
            ..lineTo(180, 110)
            ..lineTo(220, 150)
            ..lineTo(250, 80)
            ..lineTo(280, 150)
            ..lineTo(320, 110)
            ..lineTo(290, 200)
            ..close(),
        ),
      ],
      detailsPainter: (canvas, size) {
        DrawingBuilderHelpers.drawKawaiiFace(
          canvas,
          leftEye: const Offset(205, 290),
          rightEye: const Offset(295, 290),
          mouthCenter: const Offset(250, 325),
          eyeRadius: 9,
        );
      },
      outlinesPainter: (canvas, size) {
        final body = Path()..addOval(Rect.fromCenter(center: const Offset(250, 300), width: 180, height: 230));
        DrawingBuilderHelpers.drawOutline(canvas, body, width: 6.0);

        final crown = Path()
          ..moveTo(210, 200)
          ..lineTo(180, 110)
          ..lineTo(220, 150)
          ..lineTo(250, 80)
          ..lineTo(280, 150)
          ..lineTo(320, 110)
          ..lineTo(290, 200)
          ..close();
        DrawingBuilderHelpers.drawOutline(canvas, crown, width: 5.5);
      },
    ),
  ];
}
