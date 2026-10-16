import 'package:flutter/material.dart';
import '../models/category_model.dart';
import '../models/drawing_model.dart';
import '../models/region_model.dart';
import '../theme/app_colors.dart';
import 'drawing_builder_helpers.dart';

List<ColoringDrawing> getCuteAnimalDrawings() {
  return [
    // Level 15: Cute Cat
    ColoringDrawing(
      id: 'animal_cat',
      title: 'Cute Kitty',
      category: DrawingCategory.cuteAnimals,
      levelNumber: 15,
      funFact: 'Cats spend 70% of their lives sleeping and purring!',
      regions: [
        ColoringRegion(
          id: 'cat_head',
          name: 'Kitty Head',
          defaultColor: const Color(0xFFFFD166),
          path: Path()
            ..addOval(Rect.fromCenter(center: const Offset(250, 240), width: 230, height: 190)),
        ),
        ColoringRegion(
          id: 'cat_ears',
          name: 'Pointy Ears',
          defaultColor: const Color(0xFFFF85A1),
          path: Path()
            ..moveTo(160, 180)
            ..lineTo(140, 85)
            ..lineTo(210, 145)
            ..close()
            ..moveTo(340, 180)
            ..lineTo(360, 85)
            ..lineTo(290, 145)
            ..close(),
        ),
        ColoringRegion(
          id: 'cat_body',
          name: 'Kitty Body',
          defaultColor: const Color(0xFFFFD166),
          path: Path()
            ..moveTo(180, 310)
            ..cubicTo(160, 360, 160, 420, 190, 440)
            ..lineTo(310, 440)
            ..cubicTo(340, 420, 340, 360, 320, 310)
            ..close(),
        ),
      ],
      detailsPainter: (canvas, size) {
        DrawingBuilderHelpers.drawKawaiiFace(
          canvas,
          leftEye: const Offset(205, 230),
          rightEye: const Offset(295, 230),
          mouthCenter: const Offset(250, 260),
          eyeRadius: 9,
        );
        // Whiskers
        final whiskerPaint = Paint()
          ..color = AppColors.detailBlack
          ..style = PaintingStyle.stroke
          ..strokeWidth = 3.5
          ..strokeCap = StrokeCap.round;
        canvas.drawLine(const Offset(150, 235), const Offset(110, 225), whiskerPaint);
        canvas.drawLine(const Offset(150, 250), const Offset(105, 255), whiskerPaint);
        canvas.drawLine(const Offset(350, 235), const Offset(390, 225), whiskerPaint);
        canvas.drawLine(const Offset(350, 250), const Offset(395, 255), whiskerPaint);
      },
      outlinesPainter: (canvas, size) {
        final head = Path()..addOval(Rect.fromCenter(center: const Offset(250, 240), width: 230, height: 190));
        DrawingBuilderHelpers.drawOutline(canvas, head, width: 6.0);

        final ears = Path()
          ..moveTo(160, 180)
          ..lineTo(140, 85)
          ..lineTo(210, 145)
          ..close()
          ..moveTo(340, 180)
          ..lineTo(360, 85)
          ..lineTo(290, 145)
          ..close();
        DrawingBuilderHelpers.drawOutline(canvas, ears, width: 5.5);

        final body = Path()
          ..moveTo(180, 310)
          ..cubicTo(160, 360, 160, 420, 190, 440)
          ..lineTo(310, 440)
          ..cubicTo(340, 420, 340, 360, 320, 310)
          ..close();
        DrawingBuilderHelpers.drawOutline(canvas, body, width: 5.5);
      },
    ),

    // Level 16: Puppy
    ColoringDrawing(
      id: 'animal_dog',
      title: 'Playful Puppy',
      category: DrawingCategory.cuteAnimals,
      levelNumber: 16,
      funFact: 'A dog’s sense of smell is 10,000 to 100,000 times stronger than humans!',
      regions: [
        ColoringRegion(
          id: 'dog_head',
          name: 'Puppy Head',
          defaultColor: const Color(0xFFDDA15E),
          path: Path()..addOval(Rect.fromCenter(center: const Offset(250, 220), width: 200, height: 180)),
        ),
        ColoringRegion(
          id: 'dog_ears',
          name: 'Floppy Ears',
          defaultColor: const Color(0xFFA2845E),
          path: Path()
            ..addOval(Rect.fromCenter(center: const Offset(140, 220), width: 60, height: 120))
            ..addOval(Rect.fromCenter(center: const Offset(360, 220), width: 60, height: 120)),
        ),
        ColoringRegion(
          id: 'dog_body',
          name: 'Puppy Body',
          defaultColor: const Color(0xFFDDA15E),
          path: Path()
            ..moveTo(190, 290)
            ..cubicTo(170, 350, 170, 410, 190, 430)
            ..lineTo(310, 430)
            ..cubicTo(330, 410, 330, 350, 310, 290)
            ..close(),
        ),
      ],
      detailsPainter: (canvas, size) {
        DrawingBuilderHelpers.drawKawaiiFace(
          canvas,
          leftEye: const Offset(215, 210),
          rightEye: const Offset(285, 210),
          mouthCenter: const Offset(250, 240),
          eyeRadius: 9,
        );
      },
      outlinesPainter: (canvas, size) {
        final head = Path()..addOval(Rect.fromCenter(center: const Offset(250, 220), width: 200, height: 180));
        DrawingBuilderHelpers.drawOutline(canvas, head, width: 6.0);
        DrawingBuilderHelpers.drawOutline(canvas, Path()..addOval(Rect.fromCenter(center: const Offset(140, 220), width: 60, height: 120)), width: 5.5);
        DrawingBuilderHelpers.drawOutline(canvas, Path()..addOval(Rect.fromCenter(center: const Offset(360, 220), width: 60, height: 120)), width: 5.5);
        final body = Path()
          ..moveTo(190, 290)
          ..cubicTo(170, 350, 170, 410, 190, 430)
          ..lineTo(310, 430)
          ..cubicTo(330, 410, 330, 350, 310, 290)
          ..close();
        DrawingBuilderHelpers.drawOutline(canvas, body, width: 5.5);
      },
    ),

    // Level 17: Bunny
    ColoringDrawing(
      id: 'animal_bunny',
      title: 'Fluffy Bunny',
      category: DrawingCategory.cuteAnimals,
      levelNumber: 17,
      funFact: 'When bunnies are super happy, they jump in the air and twist — called a binky!',
      regions: [
        ColoringRegion(
          id: 'bunny_head',
          name: 'Bunny Head',
          defaultColor: Colors.white,
          path: Path()..addOval(Rect.fromCenter(center: const Offset(250, 270), width: 190, height: 170)),
        ),
        ColoringRegion(
          id: 'bunny_ears',
          name: 'Tall Ears',
          defaultColor: const Color(0xFFFFE6ED),
          path: Path()
            ..addOval(Rect.fromCenter(center: const Offset(195, 140), width: 50, height: 130))
            ..addOval(Rect.fromCenter(center: const Offset(305, 140), width: 50, height: 130)),
        ),
      ],
      detailsPainter: (canvas, size) {
        DrawingBuilderHelpers.drawKawaiiFace(
          canvas,
          leftEye: const Offset(215, 260),
          rightEye: const Offset(285, 260),
          mouthCenter: const Offset(250, 285),
          eyeRadius: 8,
        );
      },
      outlinesPainter: (canvas, size) {
        final head = Path()..addOval(Rect.fromCenter(center: const Offset(250, 270), width: 190, height: 170));
        DrawingBuilderHelpers.drawOutline(canvas, head, width: 6.0);
        DrawingBuilderHelpers.drawOutline(canvas, Path()..addOval(Rect.fromCenter(center: const Offset(195, 140), width: 50, height: 130)), width: 5.5);
        DrawingBuilderHelpers.drawOutline(canvas, Path()..addOval(Rect.fromCenter(center: const Offset(305, 140), width: 50, height: 130)), width: 5.5);
      },
    ),

    // Level 18: Panda
    ColoringDrawing(
      id: 'animal_panda',
      title: 'Sweet Panda',
      category: DrawingCategory.cuteAnimals,
      levelNumber: 18,
      funFact: 'Giant Pandas spend 12 hours a day munching on fresh green bamboo!',
      regions: [
        ColoringRegion(
          id: 'panda_head',
          name: 'White Head',
          defaultColor: Colors.white,
          path: Path()..addOval(Rect.fromCenter(center: const Offset(250, 250), width: 220, height: 190)),
        ),
        ColoringRegion(
          id: 'panda_ears',
          name: 'Black Ears',
          defaultColor: const Color(0xFF1C1C1E),
          path: Path()
            ..addOval(Rect.fromCenter(center: const Offset(160, 160), width: 65, height: 65))
            ..addOval(Rect.fromCenter(center: const Offset(340, 160), width: 65, height: 65)),
        ),
        ColoringRegion(
          id: 'panda_patches',
          name: 'Eye Patches',
          defaultColor: const Color(0xFF1C1C1E),
          path: Path()
            ..addOval(Rect.fromCenter(center: const Offset(205, 240), width: 50, height: 40))
            ..addOval(Rect.fromCenter(center: const Offset(295, 240), width: 50, height: 40)),
        ),
      ],
      detailsPainter: (canvas, size) {
        // White glint inside black patches
        final glint = Paint()..color = Colors.white;
        canvas.drawCircle(const Offset(205, 235), 6, glint);
        canvas.drawCircle(const Offset(295, 235), 6, glint);

        final mouth = Path()
          ..moveTo(235, 280)
          ..quadraticBezierTo(250, 295, 265, 280);
        canvas.drawPath(mouth, Paint()..color = AppColors.detailBlack..style = PaintingStyle.stroke..strokeWidth = 4..strokeCap = StrokeCap.round);
      },
      outlinesPainter: (canvas, size) {
        final head = Path()..addOval(Rect.fromCenter(center: const Offset(250, 250), width: 220, height: 190));
        DrawingBuilderHelpers.drawOutline(canvas, head, width: 6.0);
        DrawingBuilderHelpers.drawCircleOutline(canvas, const Offset(160, 160), 32.5);
        DrawingBuilderHelpers.drawCircleOutline(canvas, const Offset(340, 160), 32.5);
      },
    ),

    // Level 19: Hamster
    ColoringDrawing(
      id: 'animal_hamster',
      title: 'Chubby Hamster',
      category: DrawingCategory.cuteAnimals,
      levelNumber: 19,
      funFact: 'Hamsters have cheek pouches that can stretch back to their shoulders!',
      regions: [
        ColoringRegion(
          id: 'ham_body',
          name: 'Hamster Body',
          defaultColor: const Color(0xFFFFD166),
          path: Path()..addOval(Rect.fromCenter(center: const Offset(250, 260), width: 240, height: 220)),
        ),
        ColoringRegion(
          id: 'ham_belly',
          name: 'White Belly',
          defaultColor: Colors.white,
          path: Path()..addOval(Rect.fromCenter(center: const Offset(250, 310), width: 140, height: 120)),
        ),
      ],
      detailsPainter: (canvas, size) {
        DrawingBuilderHelpers.drawKawaiiFace(
          canvas,
          leftEye: const Offset(210, 230),
          rightEye: const Offset(290, 230),
          mouthCenter: const Offset(250, 255),
          eyeRadius: 8,
        );
      },
      outlinesPainter: (canvas, size) {
        final body = Path()..addOval(Rect.fromCenter(center: const Offset(250, 260), width: 240, height: 220));
        DrawingBuilderHelpers.drawOutline(canvas, body, width: 6.0);
      },
    ),

    // Level 20: Koala
    ColoringDrawing(
      id: 'animal_koala',
      title: 'Cozy Koala',
      category: DrawingCategory.cuteAnimals,
      levelNumber: 20,
      funFact: 'Koalas love eucalyptus leaves so much that they sleep up to 20 hours a day!',
      regions: [
        ColoringRegion(
          id: 'koala_head',
          name: 'Koala Head',
          defaultColor: const Color(0xFF8E8E93),
          path: Path()..addOval(Rect.fromCenter(center: const Offset(250, 250), width: 210, height: 180)),
        ),
        ColoringRegion(
          id: 'koala_ears',
          name: 'Fluffy Ears',
          defaultColor: const Color(0xFFFFF07C),
          path: Path()
            ..addOval(Rect.fromCenter(center: const Offset(140, 180), width: 80, height: 80))
            ..addOval(Rect.fromCenter(center: const Offset(360, 180), width: 80, height: 80)),
        ),
      ],
      detailsPainter: (canvas, size) {
        DrawingBuilderHelpers.drawKawaiiFace(
          canvas,
          leftEye: const Offset(210, 235),
          rightEye: const Offset(290, 235),
          mouthCenter: const Offset(250, 285),
          eyeRadius: 8,
        );
        // Big black oval nose
        canvas.drawOval(
          Rect.fromCenter(center: const Offset(250, 255), width: 34, height: 46),
          Paint()..color = AppColors.detailBlack,
        );
      },
      outlinesPainter: (canvas, size) {
        final head = Path()..addOval(Rect.fromCenter(center: const Offset(250, 250), width: 210, height: 180));
        DrawingBuilderHelpers.drawOutline(canvas, head, width: 6.0);
        DrawingBuilderHelpers.drawCircleOutline(canvas, const Offset(140, 180), 40);
        DrawingBuilderHelpers.drawCircleOutline(canvas, const Offset(360, 180), 40);
      },
    ),

    // Level 21: Bear
    ColoringDrawing(
      id: 'animal_bear',
      title: 'Honey Bear',
      category: DrawingCategory.cuteAnimals,
      levelNumber: 21,
      funFact: 'Bears have excellent memories and can navigate large forests effortlessly!',
      regions: [
        ColoringRegion(
          id: 'bear_head',
          name: 'Bear Head',
          defaultColor: const Color(0xFFA2845E),
          path: Path()..addOval(Rect.fromCenter(center: const Offset(250, 250), width: 220, height: 200)),
        ),
        ColoringRegion(
          id: 'bear_ears',
          name: 'Round Ears',
          defaultColor: const Color(0xFF6F4E37),
          path: Path()
            ..addOval(Rect.fromCenter(center: const Offset(160, 160), width: 60, height: 60))
            ..addOval(Rect.fromCenter(center: const Offset(340, 160), width: 60, height: 60)),
        ),
        ColoringRegion(
          id: 'bear_muzzle',
          name: 'Muzzle',
          defaultColor: const Color(0xFFFFF2D1),
          path: Path()..addOval(Rect.fromCenter(center: const Offset(250, 280), width: 90, height: 70)),
        ),
      ],
      detailsPainter: (canvas, size) {
        DrawingBuilderHelpers.drawKawaiiFace(
          canvas,
          leftEye: const Offset(210, 220),
          rightEye: const Offset(290, 220),
          mouthCenter: const Offset(250, 295),
          eyeRadius: 8,
        );
      },
      outlinesPainter: (canvas, size) {
        final head = Path()..addOval(Rect.fromCenter(center: const Offset(250, 250), width: 220, height: 200));
        DrawingBuilderHelpers.drawOutline(canvas, head, width: 6.0);
        DrawingBuilderHelpers.drawCircleOutline(canvas, const Offset(160, 160), 30);
        DrawingBuilderHelpers.drawCircleOutline(canvas, const Offset(340, 160), 30);
        final muzzle = Path()..addOval(Rect.fromCenter(center: const Offset(250, 280), width: 90, height: 70));
        DrawingBuilderHelpers.drawOutline(canvas, muzzle, width: 5.0);
      },
    ),
  ];
}
