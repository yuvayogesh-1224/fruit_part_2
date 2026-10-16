import 'package:flutter/material.dart';
import '../models/category_model.dart';
import '../models/drawing_model.dart';
import '../models/region_model.dart';
import '../theme/app_colors.dart';
import 'drawing_builder_helpers.dart';

List<ColoringDrawing> getVegetableDrawings() {
  return [
    // Level 8: Carrot (Featured in prompt!)
    ColoringDrawing(
      id: 'veg_carrot',
      title: 'Crunchy Carrot',
      category: DrawingCategory.vegetables,
      levelNumber: 8,
      funFact: 'Carrots were originally purple and yellow before orange ones were grown!',
      regions: [
        ColoringRegion(
          id: 'carrot_body',
          name: 'Carrot Body',
          defaultColor: const Color(0xFFFF9500),
          path: Path()
            ..moveTo(180, 190)
            ..cubicTo(200, 175, 300, 175, 320, 190)
            ..cubicTo(320, 270, 270, 410, 250, 440)
            ..cubicTo(230, 410, 180, 270, 180, 190)
            ..close(),
        ),
        ColoringRegion(
          id: 'carrot_leaves',
          name: 'Green Leaves',
          defaultColor: const Color(0xFF34C759),
          path: Path()
            ..moveTo(230, 180)
            ..cubicTo(190, 120, 170, 80, 190, 60)
            ..cubicTo(220, 70, 235, 110, 245, 175)
            ..cubicTo(240, 110, 240, 60, 250, 50)
            ..cubicTo(260, 60, 260, 110, 255, 175)
            ..cubicTo(265, 110, 280, 70, 310, 60)
            ..cubicTo(330, 80, 310, 120, 270, 180)
            ..close(),
        ),
      ],
      detailsPainter: (canvas, size) {
        DrawingBuilderHelpers.drawKawaiiFace(
          canvas,
          leftEye: const Offset(220, 260),
          rightEye: const Offset(280, 260),
          mouthCenter: const Offset(250, 285),
          eyeRadius: 8,
        );
        // Horizontal carrot texture ridges
        final ridgePaint = Paint()
          ..color = AppColors.detailBlack
          ..style = PaintingStyle.stroke
          ..strokeWidth = 3.5
          ..strokeCap = StrokeCap.round;
        canvas.drawLine(const Offset(205, 330), const Offset(235, 332), ridgePaint);
        canvas.drawLine(const Offset(265, 350), const Offset(290, 353), ridgePaint);
        canvas.drawLine(const Offset(225, 380), const Offset(250, 382), ridgePaint);
      },
      outlinesPainter: (canvas, size) {
        final body = Path()
          ..moveTo(180, 190)
          ..cubicTo(200, 175, 300, 175, 320, 190)
          ..cubicTo(320, 270, 270, 410, 250, 440)
          ..cubicTo(230, 410, 180, 270, 180, 190)
          ..close();
        DrawingBuilderHelpers.drawOutline(canvas, body, width: 6.0);

        final leaves = Path()
          ..moveTo(230, 180)
          ..cubicTo(190, 120, 170, 80, 190, 60)
          ..cubicTo(220, 70, 235, 110, 245, 175)
          ..cubicTo(240, 110, 240, 60, 250, 50)
          ..cubicTo(260, 60, 260, 110, 255, 175)
          ..cubicTo(265, 110, 280, 70, 310, 60)
          ..cubicTo(330, 80, 310, 120, 270, 180)
          ..close();
        DrawingBuilderHelpers.drawOutline(canvas, leaves, width: 5.5);
      },
    ),

    // Level 9: Tomato
    ColoringDrawing(
      id: 'veg_tomato',
      title: 'Plump Tomato',
      category: DrawingCategory.vegetables,
      levelNumber: 9,
      funFact: 'Tomatoes are technically fruits, but we love them in salads as vegetables!',
      regions: [
        ColoringRegion(
          id: 'tomato_body',
          name: 'Tomato Flesh',
          defaultColor: const Color(0xFFFF3B30),
          path: Path()..addOval(Rect.fromCenter(center: const Offset(250, 270), width: 260, height: 220)),
        ),
        ColoringRegion(
          id: 'tomato_calyx',
          name: 'Green Calyx',
          defaultColor: const Color(0xFF34C759),
          path: Path()
            ..moveTo(250, 160)
            ..lineTo(210, 120)
            ..lineTo(230, 150)
            ..lineTo(170, 155)
            ..lineTo(220, 170)
            ..lineTo(250, 165)
            ..lineTo(280, 170)
            ..lineTo(330, 155)
            ..lineTo(270, 150)
            ..lineTo(290, 120)
            ..close(),
        ),
      ],
      detailsPainter: (canvas, size) {
        DrawingBuilderHelpers.drawKawaiiFace(
          canvas,
          leftEye: const Offset(205, 260),
          rightEye: const Offset(295, 260),
          mouthCenter: const Offset(250, 290),
          eyeRadius: 9,
        );
      },
      outlinesPainter: (canvas, size) {
        final body = Path()..addOval(Rect.fromCenter(center: const Offset(250, 270), width: 260, height: 220));
        DrawingBuilderHelpers.drawOutline(canvas, body, width: 6.0);

        final calyx = Path()
          ..moveTo(250, 160)
          ..lineTo(210, 120)
          ..lineTo(230, 150)
          ..lineTo(170, 155)
          ..lineTo(220, 170)
          ..lineTo(250, 165)
          ..lineTo(280, 170)
          ..lineTo(330, 155)
          ..lineTo(270, 150)
          ..lineTo(290, 120)
          ..close();
        DrawingBuilderHelpers.drawOutline(canvas, calyx, width: 5.5);
      },
    ),

    // Level 10: Broccoli
    ColoringDrawing(
      id: 'veg_broccoli',
      title: 'Tiny Tree Broccoli',
      category: DrawingCategory.vegetables,
      levelNumber: 10,
      funFact: 'Broccoli contains more vitamin C than an orange!',
      regions: [
        ColoringRegion(
          id: 'broc_crown',
          name: 'Broccoli Crown',
          defaultColor: const Color(0xFF34C759),
          path: Path()
            ..moveTo(150, 260)
            ..cubicTo(90, 220, 100, 120, 180, 120)
            ..cubicTo(200, 80, 300, 80, 320, 120)
            ..cubicTo(400, 120, 410, 220, 350, 260)
            ..cubicTo(320, 290, 180, 290, 150, 260)
            ..close(),
        ),
        ColoringRegion(
          id: 'broc_stem',
          name: 'Stem',
          defaultColor: const Color(0xFF80ED99),
          path: Path()
            ..moveTo(215, 270)
            ..lineTo(205, 420)
            ..cubicTo(230, 430, 270, 430, 295, 420)
            ..lineTo(285, 270)
            ..close(),
        ),
      ],
      detailsPainter: (canvas, size) {
        DrawingBuilderHelpers.drawKawaiiFace(
          canvas,
          leftEye: const Offset(215, 195),
          rightEye: const Offset(285, 195),
          mouthCenter: const Offset(250, 220),
          eyeRadius: 8,
        );
      },
      outlinesPainter: (canvas, size) {
        final crown = Path()
          ..moveTo(150, 260)
          ..cubicTo(90, 220, 100, 120, 180, 120)
          ..cubicTo(200, 80, 300, 80, 320, 120)
          ..cubicTo(400, 120, 410, 220, 350, 260)
          ..cubicTo(320, 290, 180, 290, 150, 260)
          ..close();
        DrawingBuilderHelpers.drawOutline(canvas, crown, width: 6.0);

        final stem = Path()
          ..moveTo(215, 270)
          ..lineTo(205, 420)
          ..cubicTo(230, 430, 270, 430, 295, 420)
          ..lineTo(285, 270)
          ..close();
        DrawingBuilderHelpers.drawOutline(canvas, stem, width: 5.5);
      },
    ),

    // Level 11: Corn
    ColoringDrawing(
      id: 'veg_corn',
      title: 'Sweet Corn',
      category: DrawingCategory.vegetables,
      levelNumber: 11,
      funFact: 'An ear of corn always has an even number of rows!',
      regions: [
        ColoringRegion(
          id: 'corn_cob',
          name: 'Corn Cob',
          defaultColor: const Color(0xFFFFCC00),
          path: Path()
            ..moveTo(210, 160)
            ..cubicTo(210, 100, 290, 100, 290, 160)
            ..lineTo(290, 360)
            ..cubicTo(290, 410, 210, 410, 210, 360)
            ..close(),
        ),
        ColoringRegion(
          id: 'corn_husk',
          name: 'Green Husk',
          defaultColor: const Color(0xFF34C759),
          path: Path()
            ..moveTo(170, 390)
            ..cubicTo(140, 280, 170, 210, 190, 200)
            ..cubicTo(190, 280, 210, 370, 240, 410)
            ..cubicTo(260, 420, 240, 420, 170, 390)
            ..close()
            ..moveTo(330, 390)
            ..cubicTo(360, 280, 330, 210, 310, 200)
            ..cubicTo(310, 280, 290, 370, 260, 410)
            ..cubicTo(240, 420, 260, 420, 330, 390)
            ..close(),
        ),
      ],
      detailsPainter: (canvas, size) {
        DrawingBuilderHelpers.drawKawaiiFace(
          canvas,
          leftEye: const Offset(230, 240),
          rightEye: const Offset(270, 240),
          mouthCenter: const Offset(250, 265),
          eyeRadius: 7,
        );
      },
      outlinesPainter: (canvas, size) {
        final cob = Path()
          ..moveTo(210, 160)
          ..cubicTo(210, 100, 290, 100, 290, 160)
          ..lineTo(290, 360)
          ..cubicTo(290, 410, 210, 410, 210, 360)
          ..close();
        DrawingBuilderHelpers.drawOutline(canvas, cob, width: 5.5);

        final husk = Path()
          ..moveTo(170, 390)
          ..cubicTo(140, 280, 170, 210, 190, 200)
          ..cubicTo(190, 280, 210, 370, 240, 410)
          ..cubicTo(260, 420, 240, 420, 170, 390)
          ..close()
          ..moveTo(330, 390)
          ..cubicTo(360, 280, 330, 210, 310, 200)
          ..cubicTo(310, 280, 290, 370, 260, 410)
          ..cubicTo(240, 420, 260, 420, 330, 390)
          ..close();
        DrawingBuilderHelpers.drawOutline(canvas, husk, width: 5.5);
      },
    ),

    // Level 12: Eggplant
    ColoringDrawing(
      id: 'veg_eggplant',
      title: 'Purple Eggplant',
      category: DrawingCategory.vegetables,
      levelNumber: 12,
      funFact: 'Eggplants get their name because early European ones were small, white, and looked like goose eggs!',
      regions: [
        ColoringRegion(
          id: 'egg_body',
          name: 'Eggplant Body',
          defaultColor: const Color(0xFFAF52DE),
          path: Path()
            ..moveTo(225, 170)
            ..cubicTo(220, 220, 160, 310, 180, 390)
            ..cubicTo(200, 440, 300, 440, 320, 390)
            ..cubicTo(340, 310, 280, 220, 275, 170)
            ..close(),
        ),
        ColoringRegion(
          id: 'egg_calyx',
          name: 'Calyx & Stem',
          defaultColor: const Color(0xFF34C759),
          path: Path()
            ..moveTo(250, 110)
            ..lineTo(255, 150)
            ..lineTo(290, 160)
            ..lineTo(265, 175)
            ..lineTo(270, 200)
            ..lineTo(250, 180)
            ..lineTo(230, 200)
            ..lineTo(235, 175)
            ..lineTo(210, 160)
            ..lineTo(245, 150)
            ..close(),
        ),
      ],
      detailsPainter: (canvas, size) {
        DrawingBuilderHelpers.drawKawaiiFace(
          canvas,
          leftEye: const Offset(215, 330),
          rightEye: const Offset(285, 330),
          mouthCenter: const Offset(250, 360),
          eyeRadius: 8,
        );
      },
      outlinesPainter: (canvas, size) {
        final body = Path()
          ..moveTo(225, 170)
          ..cubicTo(220, 220, 160, 310, 180, 390)
          ..cubicTo(200, 440, 300, 440, 320, 390)
          ..cubicTo(340, 310, 280, 220, 275, 170)
          ..close();
        DrawingBuilderHelpers.drawOutline(canvas, body, width: 6.0);

        final calyx = Path()
          ..moveTo(250, 110)
          ..lineTo(255, 150)
          ..lineTo(290, 160)
          ..lineTo(265, 175)
          ..lineTo(270, 200)
          ..lineTo(250, 180)
          ..lineTo(230, 200)
          ..lineTo(235, 175)
          ..lineTo(210, 160)
          ..lineTo(245, 150)
          ..close();
        DrawingBuilderHelpers.drawOutline(canvas, calyx, width: 5.0);
      },
    ),

    // Level 13: Pumpkin
    ColoringDrawing(
      id: 'veg_pumpkin',
      title: 'Round Pumpkin',
      category: DrawingCategory.vegetables,
      levelNumber: 13,
      funFact: 'Pumpkins are grown on every continent except Antarctica!',
      regions: [
        ColoringRegion(
          id: 'pump_body',
          name: 'Pumpkin Body',
          defaultColor: const Color(0xFFFF9500),
          path: Path()..addOval(Rect.fromCenter(center: const Offset(250, 280), width: 280, height: 210)),
        ),
        ColoringRegion(
          id: 'pump_stem',
          name: 'Stem',
          defaultColor: const Color(0xFF34C759),
          path: Path()
            ..moveTo(240, 180)
            ..quadraticBezierTo(230, 130, 255, 100)
            ..lineTo(270, 105)
            ..quadraticBezierTo(255, 130, 260, 180)
            ..close(),
        ),
      ],
      detailsPainter: (canvas, size) {
        DrawingBuilderHelpers.drawKawaiiFace(
          canvas,
          leftEye: const Offset(205, 270),
          rightEye: const Offset(295, 270),
          mouthCenter: const Offset(250, 305),
          eyeRadius: 9,
        );
      },
      outlinesPainter: (canvas, size) {
        final body = Path()..addOval(Rect.fromCenter(center: const Offset(250, 280), width: 280, height: 210));
        DrawingBuilderHelpers.drawOutline(canvas, body, width: 6.0);

        final stem = Path()
          ..moveTo(240, 180)
          ..quadraticBezierTo(230, 130, 255, 100)
          ..lineTo(270, 105)
          ..quadraticBezierTo(255, 130, 260, 180)
          ..close();
        DrawingBuilderHelpers.drawOutline(canvas, stem, width: 5.5);
      },
    ),

    // Level 14: Mushroom
    ColoringDrawing(
      id: 'veg_mushroom',
      title: 'Spotted Mushroom',
      category: DrawingCategory.vegetables,
      levelNumber: 14,
      funFact: 'Mushrooms talk to each other underground through an electrical network of roots called mycelium!',
      regions: [
        ColoringRegion(
          id: 'mush_cap',
          name: 'Mushroom Cap',
          defaultColor: const Color(0xFFFF3B30),
          path: Path()
            ..moveTo(120, 250)
            ..cubicTo(120, 100, 380, 100, 380, 250)
            ..close(),
        ),
        ColoringRegion(
          id: 'mush_stem',
          name: 'Stem',
          defaultColor: const Color(0xFFFFF07C),
          path: Path()
            ..moveTo(195, 250)
            ..lineTo(185, 410)
            ..cubicTo(215, 430, 285, 430, 315, 410)
            ..lineTo(305, 250)
            ..close(),
        ),
      ],
      detailsPainter: (canvas, size) {
        DrawingBuilderHelpers.drawKawaiiFace(
          canvas,
          leftEye: const Offset(220, 320),
          rightEye: const Offset(280, 320),
          mouthCenter: const Offset(250, 345),
          eyeRadius: 8,
        );
        // White Polka Dots on Cap
        final dotPaint = Paint()..color = Colors.white;
        for (final pt in [
          const Offset(190, 170),
          const Offset(250, 150),
          const Offset(310, 170),
          const Offset(150, 220),
          const Offset(350, 220),
        ]) {
          canvas.drawCircle(pt, 16, dotPaint);
        }
      },
      outlinesPainter: (canvas, size) {
        final cap = Path()
          ..moveTo(120, 250)
          ..cubicTo(120, 100, 380, 100, 380, 250)
          ..close();
        DrawingBuilderHelpers.drawOutline(canvas, cap, width: 6.0);

        final stem = Path()
          ..moveTo(195, 250)
          ..lineTo(185, 410)
          ..cubicTo(215, 430, 285, 430, 315, 410)
          ..lineTo(305, 250)
          ..close();
        DrawingBuilderHelpers.drawOutline(canvas, stem, width: 5.5);
      },
    ),
  ];
}
