import 'package:flutter/material.dart';
import '../models/category_model.dart';
import '../models/drawing_model.dart';
import '../models/region_model.dart';
import '../theme/app_colors.dart';
import 'drawing_builder_helpers.dart';

List<ColoringDrawing> getWildAnimalDrawings() {
  return [
    // Level 22: Lion
    ColoringDrawing(
      id: 'wild_lion',
      title: 'Brave Lion',
      category: DrawingCategory.wildAnimals,
      levelNumber: 22,
      funFact: 'A lion’s roar can be heard from up to 5 miles away!',
      regions: [
        ColoringRegion(
          id: 'lion_mane',
          name: 'Fluffy Mane',
          defaultColor: const Color(0xFFFF9500),
          path: Path()..addOval(Rect.fromCenter(center: const Offset(250, 240), width: 280, height: 280)),
        ),
        ColoringRegion(
          id: 'lion_face',
          name: 'Lion Face',
          defaultColor: const Color(0xFFFFD166),
          path: Path()..addOval(Rect.fromCenter(center: const Offset(250, 240), width: 170, height: 160)),
        ),
      ],
      detailsPainter: (canvas, size) {
        DrawingBuilderHelpers.drawKawaiiFace(
          canvas,
          leftEye: const Offset(215, 225),
          rightEye: const Offset(285, 225),
          mouthCenter: const Offset(250, 260),
          eyeRadius: 8,
        );
      },
      outlinesPainter: (canvas, size) {
        DrawingBuilderHelpers.drawCircleOutline(canvas, const Offset(250, 240), 140, width: 6.0);
        DrawingBuilderHelpers.drawCircleOutline(canvas, const Offset(250, 240), 85, width: 5.5);
      },
    ),

    // Level 23: Elephant (Featured in prompt!)
    ColoringDrawing(
      id: 'wild_elephant',
      title: 'Gentle Elephant',
      category: DrawingCategory.wildAnimals,
      levelNumber: 23,
      funFact: 'Elephants are the largest living land animals and can recognize their reflections in mirrors!',
      regions: [
        ColoringRegion(
          id: 'ele_body',
          name: 'Elephant Body',
          defaultColor: const Color(0xFF8E8E93),
          path: Path()
            ..moveTo(150, 200)
            ..cubicTo(150, 130, 350, 130, 350, 200)
            ..cubicTo(370, 280, 360, 420, 320, 430)
            ..lineTo(180, 430)
            ..cubicTo(140, 420, 130, 280, 150, 200)
            ..close(),
        ),
        ColoringRegion(
          id: 'ele_ears',
          name: 'Big Ears',
          defaultColor: const Color(0xFFFF85A1),
          path: Path()
            ..addOval(Rect.fromCenter(center: const Offset(120, 220), width: 90, height: 140))
            ..addOval(Rect.fromCenter(center: const Offset(380, 220), width: 90, height: 140)),
        ),
        ColoringRegion(
          id: 'ele_trunk',
          name: 'Curled Trunk',
          defaultColor: const Color(0xFF8E8E93),
          path: Path()
            ..moveTo(230, 260)
            ..cubicTo(225, 340, 230, 380, 270, 380)
            ..cubicTo(290, 380, 290, 350, 270, 350)
            ..cubicTo(260, 350, 255, 330, 260, 260)
            ..close(),
        ),
      ],
      detailsPainter: (canvas, size) {
        DrawingBuilderHelpers.drawKawaiiFace(
          canvas,
          leftEye: const Offset(200, 220),
          rightEye: const Offset(300, 220),
          mouthCenter: const Offset(250, 280),
          eyeRadius: 8,
          drawBlush: true,
        );
      },
      outlinesPainter: (canvas, size) {
        final body = Path()
          ..moveTo(150, 200)
          ..cubicTo(150, 130, 350, 130, 350, 200)
          ..cubicTo(370, 280, 360, 420, 320, 430)
          ..lineTo(180, 430)
          ..cubicTo(140, 420, 130, 280, 150, 200)
          ..close();
        DrawingBuilderHelpers.drawOutline(canvas, body, width: 6.0);
        DrawingBuilderHelpers.drawOutline(canvas, Path()..addOval(Rect.fromCenter(center: const Offset(120, 220), width: 90, height: 140)), width: 5.5);
        DrawingBuilderHelpers.drawOutline(canvas, Path()..addOval(Rect.fromCenter(center: const Offset(380, 220), width: 90, height: 140)), width: 5.5);

        final trunk = Path()
          ..moveTo(230, 260)
          ..cubicTo(225, 340, 230, 380, 270, 380)
          ..cubicTo(290, 380, 290, 350, 270, 350)
          ..cubicTo(260, 350, 255, 330, 260, 260)
          ..close();
        DrawingBuilderHelpers.drawOutline(canvas, trunk, width: 5.5);
      },
    ),

    // Level 24: Giraffe
    ColoringDrawing(
      id: 'wild_giraffe',
      title: 'Tall Giraffe',
      category: DrawingCategory.wildAnimals,
      levelNumber: 24,
      funFact: 'Giraffes only need 5 to 30 minutes of sleep in a whole 24-hour day!',
      regions: [
        ColoringRegion(
          id: 'gir_head',
          name: 'Head & Neck',
          defaultColor: const Color(0xFFFFCC00),
          path: Path()
            ..moveTo(210, 140)
            ..cubicTo(210, 80, 290, 80, 290, 140)
            ..lineTo(300, 440)
            ..lineTo(200, 440)
            ..close(),
        ),
        ColoringRegion(
          id: 'gir_spots',
          name: 'Spots',
          defaultColor: const Color(0xFF6F4E37),
          path: Path()
            ..addOval(Rect.fromCenter(center: const Offset(250, 260), width: 45, height: 35))
            ..addOval(Rect.fromCenter(center: const Offset(230, 340), width: 40, height: 35))
            ..addOval(Rect.fromCenter(center: const Offset(270, 400), width: 45, height: 40)),
        ),
      ],
      detailsPainter: (canvas, size) {
        DrawingBuilderHelpers.drawKawaiiFace(
          canvas,
          leftEye: const Offset(230, 130),
          rightEye: const Offset(270, 130),
          mouthCenter: const Offset(250, 155),
          eyeRadius: 7,
        );
      },
      outlinesPainter: (canvas, size) {
        final neck = Path()
          ..moveTo(210, 140)
          ..cubicTo(210, 80, 290, 80, 290, 140)
          ..lineTo(300, 440)
          ..lineTo(200, 440)
          ..close();
        DrawingBuilderHelpers.drawOutline(canvas, neck, width: 6.0);
      },
    ),

    // Level 25: Zebra
    ColoringDrawing(
      id: 'wild_zebra',
      title: 'Striped Zebra',
      category: DrawingCategory.wildAnimals,
      levelNumber: 25,
      funFact: 'Every single zebra has a unique pattern of black and white stripes!',
      regions: [
        ColoringRegion(
          id: 'zebra_head',
          name: 'Zebra Head',
          defaultColor: Colors.white,
          path: Path()..addOval(Rect.fromCenter(center: const Offset(250, 240), width: 220, height: 200)),
        ),
        ColoringRegion(
          id: 'zebra_stripes',
          name: 'Black Stripes',
          defaultColor: const Color(0xFF1C1C1E),
          path: Path()
            ..moveTo(140, 220)..lineTo(185, 225)..lineTo(140, 240)..close()
            ..moveTo(360, 220)..lineTo(315, 225)..lineTo(360, 240)..close()
            ..moveTo(150, 280)..lineTo(195, 285)..lineTo(150, 300)..close()
            ..moveTo(350, 280)..lineTo(305, 285)..lineTo(350, 300)..close(),
        ),
      ],
      detailsPainter: (canvas, size) {
        DrawingBuilderHelpers.drawKawaiiFace(
          canvas,
          leftEye: const Offset(215, 220),
          rightEye: const Offset(285, 220),
          mouthCenter: const Offset(250, 260),
          eyeRadius: 8,
        );
      },
      outlinesPainter: (canvas, size) {
        final head = Path()..addOval(Rect.fromCenter(center: const Offset(250, 240), width: 220, height: 200));
        DrawingBuilderHelpers.drawOutline(canvas, head, width: 6.0);
      },
    ),

    // Level 26: Monkey
    ColoringDrawing(
      id: 'wild_monkey',
      title: 'Cheeky Monkey',
      category: DrawingCategory.wildAnimals,
      levelNumber: 26,
      funFact: 'Monkeys peel bananas from the bottom up, which is easier and cleaner!',
      regions: [
        ColoringRegion(
          id: 'monk_head',
          name: 'Monkey Head',
          defaultColor: const Color(0xFF6F4E37),
          path: Path()..addOval(Rect.fromCenter(center: const Offset(250, 250), width: 220, height: 200)),
        ),
        ColoringRegion(
          id: 'monk_face',
          name: 'Peach Face',
          defaultColor: const Color(0xFFFFD166),
          path: Path()..addOval(Rect.fromCenter(center: const Offset(250, 265), width: 160, height: 140)),
        ),
        ColoringRegion(
          id: 'monk_ears',
          name: 'Round Ears',
          defaultColor: const Color(0xFFFFD166),
          path: Path()
            ..addOval(Rect.fromCenter(center: const Offset(130, 240), width: 70, height: 70))
            ..addOval(Rect.fromCenter(center: const Offset(370, 240), width: 70, height: 70)),
        ),
      ],
      detailsPainter: (canvas, size) {
        DrawingBuilderHelpers.drawKawaiiFace(
          canvas,
          leftEye: const Offset(215, 245),
          rightEye: const Offset(285, 245),
          mouthCenter: const Offset(250, 280),
          eyeRadius: 8,
        );
      },
      outlinesPainter: (canvas, size) {
        DrawingBuilderHelpers.drawCircleOutline(canvas, const Offset(130, 240), 35);
        DrawingBuilderHelpers.drawCircleOutline(canvas, const Offset(370, 240), 35);
        final head = Path()..addOval(Rect.fromCenter(center: const Offset(250, 250), width: 220, height: 200));
        DrawingBuilderHelpers.drawOutline(canvas, head, width: 6.0);
        final face = Path()..addOval(Rect.fromCenter(center: const Offset(250, 265), width: 160, height: 140));
        DrawingBuilderHelpers.drawOutline(canvas, face, width: 5.0);
      },
    ),

    // Level 27: Hippo
    ColoringDrawing(
      id: 'wild_hippo',
      title: 'Happy Hippo',
      category: DrawingCategory.wildAnimals,
      levelNumber: 27,
      funFact: 'Hippos secrete an oily red fluid that acts as natural pink sunscreen!',
      regions: [
        ColoringRegion(
          id: 'hip_head',
          name: 'Hippo Head',
          defaultColor: const Color(0xFF00C7BE),
          path: Path()
            ..moveTo(160, 220)
            ..cubicTo(160, 140, 340, 140, 340, 220)
            ..cubicTo(370, 320, 360, 400, 320, 420)
            ..lineTo(180, 420)
            ..cubicTo(140, 400, 130, 320, 160, 220)
            ..close(),
        ),
      ],
      detailsPainter: (canvas, size) {
        DrawingBuilderHelpers.drawKawaiiFace(
          canvas,
          leftEye: const Offset(205, 200),
          rightEye: const Offset(295, 200),
          mouthCenter: const Offset(250, 350),
          eyeRadius: 8,
        );
        // Nostrils
        final nostrilPaint = Paint()..color = AppColors.detailBlack;
        canvas.drawCircle(const Offset(220, 280), 8, nostrilPaint);
        canvas.drawCircle(const Offset(280, 280), 8, nostrilPaint);
      },
      outlinesPainter: (canvas, size) {
        final head = Path()
          ..moveTo(160, 220)
          ..cubicTo(160, 140, 340, 140, 340, 220)
          ..cubicTo(370, 320, 360, 400, 320, 420)
          ..lineTo(180, 420)
          ..cubicTo(140, 400, 130, 320, 160, 220)
          ..close();
        DrawingBuilderHelpers.drawOutline(canvas, head, width: 6.0);
      },
    ),

    // Level 28: Tiger
    ColoringDrawing(
      id: 'wild_tiger',
      title: 'Striped Tiger',
      category: DrawingCategory.wildAnimals,
      levelNumber: 28,
      funFact: 'No two tigers ever share the exact same pattern of orange and black stripes!',
      regions: [
        ColoringRegion(
          id: 'tig_head',
          name: 'Tiger Head',
          defaultColor: const Color(0xFFFF9500),
          path: Path()..addOval(Rect.fromCenter(center: const Offset(250, 240), width: 230, height: 200)),
        ),
        ColoringRegion(
          id: 'tig_stripes',
          name: 'Tiger Stripes',
          defaultColor: const Color(0xFF1C1C1E),
          path: Path()
            ..moveTo(140, 200)..lineTo(180, 210)..lineTo(145, 225)..close()
            ..moveTo(360, 200)..lineTo(320, 210)..lineTo(355, 225)..close()
            ..moveTo(235, 150)..lineTo(250, 185)..lineTo(265, 150)..close(),
        ),
      ],
      detailsPainter: (canvas, size) {
        DrawingBuilderHelpers.drawKawaiiFace(
          canvas,
          leftEye: const Offset(210, 235),
          rightEye: const Offset(290, 235),
          mouthCenter: const Offset(250, 270),
          eyeRadius: 8,
        );
      },
      outlinesPainter: (canvas, size) {
        final head = Path()..addOval(Rect.fromCenter(center: const Offset(250, 240), width: 230, height: 200));
        DrawingBuilderHelpers.drawOutline(canvas, head, width: 6.0);
      },
    ),
  ];
}

List<ColoringDrawing> getBirdDrawings() {
  return [
    // Level 29: Penguin
    ColoringDrawing(
      id: 'bird_penguin',
      title: 'Playful Penguin',
      category: DrawingCategory.birds,
      levelNumber: 29,
      funFact: 'Penguins can leap up to 9 feet out of the freezing water onto the ice!',
      regions: [
        ColoringRegion(
          id: 'peng_body',
          name: 'Penguin Body',
          defaultColor: const Color(0xFF1C1C1E),
          path: Path()..addOval(Rect.fromCenter(center: const Offset(250, 260), width: 210, height: 270)),
        ),
        ColoringRegion(
          id: 'peng_belly',
          name: 'White Belly',
          defaultColor: Colors.white,
          path: Path()..addOval(Rect.fromCenter(center: const Offset(250, 290), width: 140, height: 190)),
        ),
        ColoringRegion(
          id: 'peng_beak',
          name: 'Beak & Feet',
          defaultColor: const Color(0xFFFF9500),
          path: Path()
            ..moveTo(230, 230)..lineTo(270, 230)..lineTo(250, 260)..close()
            ..addOval(Rect.fromCenter(center: const Offset(205, 400), width: 50, height: 24))
            ..addOval(Rect.fromCenter(center: const Offset(295, 400), width: 50, height: 24)),
        ),
      ],
      detailsPainter: (canvas, size) {
        DrawingBuilderHelpers.drawKawaiiFace(
          canvas,
          leftEye: const Offset(210, 215),
          rightEye: const Offset(290, 215),
          mouthCenter: const Offset(250, 255),
          eyeRadius: 7,
          drawBlush: true,
        );
      },
      outlinesPainter: (canvas, size) {
        final body = Path()..addOval(Rect.fromCenter(center: const Offset(250, 260), width: 210, height: 270));
        DrawingBuilderHelpers.drawOutline(canvas, body, width: 6.0);
        final belly = Path()..addOval(Rect.fromCenter(center: const Offset(250, 290), width: 140, height: 190));
        DrawingBuilderHelpers.drawOutline(canvas, belly, width: 5.0);
      },
    ),

    // Level 30: Owl
    ColoringDrawing(
      id: 'bird_owl',
      title: 'Wise Owl',
      category: DrawingCategory.birds,
      levelNumber: 30,
      funFact: 'Owls can turn their heads an astonishing 270 degrees in either direction!',
      regions: [
        ColoringRegion(
          id: 'owl_body',
          name: 'Owl Body',
          defaultColor: const Color(0xFFA2845E),
          path: Path()..addOval(Rect.fromCenter(center: const Offset(250, 260), width: 220, height: 260)),
        ),
        ColoringRegion(
          id: 'owl_belly',
          name: 'Belly Feathers',
          defaultColor: const Color(0xFFFFF07C),
          path: Path()..addOval(Rect.fromCenter(center: const Offset(250, 290), width: 140, height: 160)),
        ),
      ],
      detailsPainter: (canvas, size) {
        // Big round owl eyes
        final whitePaint = Paint()..color = Colors.white;
        canvas.drawCircle(const Offset(205, 210), 26, whitePaint);
        canvas.drawCircle(const Offset(295, 210), 26, whitePaint);
        final blackPaint = Paint()..color = AppColors.detailBlack;
        canvas.drawCircle(const Offset(205, 210), 14, blackPaint);
        canvas.drawCircle(const Offset(295, 210), 14, blackPaint);
        final beak = Path()..moveTo(240, 230)..lineTo(260, 230)..lineTo(250, 255)..close();
        canvas.drawPath(beak, Paint()..color = const Color(0xFFFF9500));
      },
      outlinesPainter: (canvas, size) {
        final body = Path()..addOval(Rect.fromCenter(center: const Offset(250, 260), width: 220, height: 260));
        DrawingBuilderHelpers.drawOutline(canvas, body, width: 6.0);
      },
    ),

    // Level 31: Parrot
    ColoringDrawing(
      id: 'bird_parrot',
      title: 'Tropical Parrot',
      category: DrawingCategory.birds,
      levelNumber: 31,
      funFact: 'Some parrots can live to be over 80 years old and learn hundreds of words!',
      regions: [
        ColoringRegion(
          id: 'par_body',
          name: 'Green Body',
          defaultColor: const Color(0xFF34C759),
          path: Path()..addOval(Rect.fromCenter(center: const Offset(240, 250), width: 160, height: 240)),
        ),
        ColoringRegion(
          id: 'par_wing',
          name: 'Red Wing',
          defaultColor: const Color(0xFFFF3B30),
          path: Path()
            ..moveTo(220, 200)
            ..cubicTo(290, 210, 310, 330, 260, 360)
            ..close(),
        ),
      ],
      detailsPainter: (canvas, size) {
        DrawingBuilderHelpers.drawKawaiiFace(
          canvas,
          leftEye: const Offset(195, 190),
          rightEye: const Offset(245, 190),
          mouthCenter: const Offset(215, 215),
          eyeRadius: 7,
        );
      },
      outlinesPainter: (canvas, size) {
        final body = Path()..addOval(Rect.fromCenter(center: const Offset(240, 250), width: 160, height: 240));
        DrawingBuilderHelpers.drawOutline(canvas, body, width: 6.0);
      },
    ),

    // Level 32: Duck
    ColoringDrawing(
      id: 'bird_duck',
      title: 'Cute Duckling',
      category: DrawingCategory.birds,
      levelNumber: 32,
      funFact: 'Duck feathers are completely waterproof thanks to a natural protective wax!',
      regions: [
        ColoringRegion(
          id: 'duck_body',
          name: 'Yellow Body',
          defaultColor: const Color(0xFFFFCC00),
          path: Path()
            ..moveTo(140, 280)
            ..cubicTo(120, 210, 360, 210, 350, 290)
            ..cubicTo(340, 380, 160, 380, 140, 280)
            ..close(),
        ),
        ColoringRegion(
          id: 'duck_head',
          name: 'Head',
          defaultColor: const Color(0xFFFFCC00),
          path: Path()..addOval(Rect.fromCircle(center: const Offset(190, 190), radius: 60)),
        ),
      ],
      detailsPainter: (canvas, size) {
        DrawingBuilderHelpers.drawKawaiiFace(
          canvas,
          leftEye: const Offset(170, 180),
          rightEye: const Offset(210, 180),
          mouthCenter: const Offset(140, 200),
          eyeRadius: 7,
        );
      },
      outlinesPainter: (canvas, size) {
        DrawingBuilderHelpers.drawCircleOutline(canvas, const Offset(190, 190), 60);
      },
    ),

    // Level 33: Flamingo
    ColoringDrawing(
      id: 'bird_flamingo',
      title: 'Pink Flamingo',
      category: DrawingCategory.birds,
      levelNumber: 33,
      funFact: 'Flamingos get their vibrant pink color from carotenoid pigments in the shrimp they eat!',
      regions: [
        ColoringRegion(
          id: 'flam_body',
          name: 'Pink Body',
          defaultColor: const Color(0xFFFF85A1),
          path: Path()..addOval(Rect.fromCenter(center: const Offset(250, 230), width: 160, height: 120)),
        ),
      ],
      detailsPainter: (canvas, size) {
        DrawingBuilderHelpers.drawKawaiiFace(
          canvas,
          leftEye: const Offset(230, 210),
          rightEye: const Offset(270, 210),
          mouthCenter: const Offset(250, 240),
          eyeRadius: 7,
        );
      },
      outlinesPainter: (canvas, size) {
        final body = Path()..addOval(Rect.fromCenter(center: const Offset(250, 230), width: 160, height: 120));
        DrawingBuilderHelpers.drawOutline(canvas, body, width: 6.0);
      },
    ),

    // Level 34: Peacock
    ColoringDrawing(
      id: 'bird_peacock',
      title: 'Proud Peacock',
      category: DrawingCategory.birds,
      levelNumber: 34,
      funFact: 'Only male peafowl are called peacocks; females are called peahens!',
      regions: [
        ColoringRegion(
          id: 'pea_tail',
          name: 'Feather Fan',
          defaultColor: const Color(0xFF00C7BE),
          path: Path()
            ..moveTo(100, 320)
            ..cubicTo(100, 100, 400, 100, 400, 320)
            ..close(),
        ),
        ColoringRegion(
          id: 'pea_body',
          name: 'Blue Body',
          defaultColor: const Color(0xFF007AFF),
          path: Path()..addOval(Rect.fromCenter(center: const Offset(250, 300), width: 90, height: 160)),
        ),
      ],
      detailsPainter: (canvas, size) {
        DrawingBuilderHelpers.drawKawaiiFace(
          canvas,
          leftEye: const Offset(235, 260),
          rightEye: const Offset(265, 260),
          mouthCenter: const Offset(250, 280),
          eyeRadius: 6,
        );
      },
      outlinesPainter: (canvas, size) {
        final tail = Path()
          ..moveTo(100, 320)
          ..cubicTo(100, 100, 400, 100, 400, 320)
          ..close();
        DrawingBuilderHelpers.drawOutline(canvas, tail, width: 6.0);
      },
    ),

    // Level 35: Toucan
    ColoringDrawing(
      id: 'bird_toucan',
      title: 'Big-Beak Toucan',
      category: DrawingCategory.birds,
      levelNumber: 35,
      funFact: 'A toucan’s huge beak is actually very lightweight because it is hollow like a honeycomb!',
      regions: [
        ColoringRegion(
          id: 'touc_body',
          name: 'Black Body',
          defaultColor: const Color(0xFF1C1C1E),
          path: Path()..addOval(Rect.fromCenter(center: const Offset(210, 270), width: 140, height: 210)),
        ),
        ColoringRegion(
          id: 'touc_beak',
          name: 'Orange Beak',
          defaultColor: const Color(0xFFFF9500),
          path: Path()
            ..moveTo(240, 190)
            ..cubicTo(380, 180, 420, 270, 320, 290)
            ..lineTo(240, 250)
            ..close(),
        ),
      ],
      detailsPainter: (canvas, size) {
        DrawingBuilderHelpers.drawKawaiiFace(
          canvas,
          leftEye: const Offset(190, 210),
          rightEye: const Offset(225, 210),
          mouthCenter: const Offset(210, 240),
          eyeRadius: 7,
        );
      },
      outlinesPainter: (canvas, size) {
        final body = Path()..addOval(Rect.fromCenter(center: const Offset(210, 270), width: 140, height: 210));
        DrawingBuilderHelpers.drawOutline(canvas, body, width: 6.0);
        final beak = Path()
          ..moveTo(240, 190)
          ..cubicTo(380, 180, 420, 270, 320, 290)
          ..lineTo(240, 250)
          ..close();
        DrawingBuilderHelpers.drawOutline(canvas, beak, width: 5.5);
      },
    ),
  ];
}

List<ColoringDrawing> getFlowerDrawings() {
  return [
    // Level 36: Sunflower
    ColoringDrawing(
      id: 'flower_sunflower',
      title: 'Sunny Sunflower',
      category: DrawingCategory.flowers,
      levelNumber: 36,
      funFact: 'Young sunflowers follow the movement of the sun from east to west every day — called heliotropism!',
      regions: [
        ColoringRegion(
          id: 'sunf_petals',
          name: 'Yellow Petals',
          defaultColor: const Color(0xFFFFCC00),
          path: DrawingBuilderHelpers.makeStarPath(const Offset(250, 220), 140, 95, 12),
        ),
        ColoringRegion(
          id: 'sunf_center',
          name: 'Seed Center',
          defaultColor: const Color(0xFF6F4E37),
          path: Path()..addOval(Rect.fromCircle(center: const Offset(250, 220), radius: 65)),
        ),
        ColoringRegion(
          id: 'sunf_stem',
          name: 'Stem & Leaf',
          defaultColor: const Color(0xFF34C759),
          path: Path()
            ..moveTo(240, 285)
            ..lineTo(240, 440)
            ..lineTo(260, 440)
            ..lineTo(260, 285)
            ..close()
            ..addPath(DrawingBuilderHelpers.makeLeafPath(const Offset(260, 350), const Offset(360, 310), 30), Offset.zero),
        ),
      ],
      detailsPainter: (canvas, size) {
        DrawingBuilderHelpers.drawKawaiiFace(
          canvas,
          leftEye: const Offset(220, 215),
          rightEye: const Offset(280, 215),
          mouthCenter: const Offset(250, 240),
          eyeRadius: 8,
        );
      },
      outlinesPainter: (canvas, size) {
        final petals = DrawingBuilderHelpers.makeStarPath(const Offset(250, 220), 140, 95, 12);
        DrawingBuilderHelpers.drawOutline(canvas, petals, width: 6.0);
        DrawingBuilderHelpers.drawCircleOutline(canvas, const Offset(250, 220), 65, width: 5.5);
      },
    ),

    // Level 37: Tulip
    ColoringDrawing(
      id: 'flower_tulip',
      title: 'Bright Tulip',
      category: DrawingCategory.flowers,
      levelNumber: 37,
      funFact: 'At one time in history, tulip bulbs were more valuable than gold!',
      regions: [
        ColoringRegion(
          id: 'tul_cup',
          name: 'Tulip Cup',
          defaultColor: const Color(0xFFFF2D55),
          path: Path()
            ..moveTo(170, 160)
            ..lineTo(200, 220)
            ..lineTo(250, 160)
            ..lineTo(300, 220)
            ..lineTo(330, 160)
            ..cubicTo(360, 290, 140, 290, 170, 160)
            ..close(),
        ),
        ColoringRegion(
          id: 'tul_stem',
          name: 'Green Stem',
          defaultColor: const Color(0xFF34C759),
          path: Path()
            ..moveTo(240, 280)
            ..lineTo(240, 430)
            ..lineTo(260, 430)
            ..lineTo(260, 280)
            ..close(),
        ),
      ],
      detailsPainter: (canvas, size) {
        DrawingBuilderHelpers.drawKawaiiFace(
          canvas,
          leftEye: const Offset(215, 230),
          rightEye: const Offset(285, 230),
          mouthCenter: const Offset(250, 255),
          eyeRadius: 8,
        );
      },
      outlinesPainter: (canvas, size) {
        final cup = Path()
          ..moveTo(170, 160)
          ..lineTo(200, 220)
          ..lineTo(250, 160)
          ..lineTo(300, 220)
          ..lineTo(330, 160)
          ..cubicTo(360, 290, 140, 290, 170, 160)
          ..close();
        DrawingBuilderHelpers.drawOutline(canvas, cup, width: 6.0);
      },
    ),

    // Level 38: Rose
    ColoringDrawing(
      id: 'flower_rose',
      title: 'Velvet Rose',
      category: DrawingCategory.flowers,
      levelNumber: 38,
      funFact: 'Fossilized roses from 35 million years ago have been discovered by scientists!',
      regions: [
        ColoringRegion(
          id: 'rose_bloom',
          name: 'Red Bloom',
          defaultColor: const Color(0xFFFF3B30),
          path: Path()..addOval(Rect.fromCenter(center: const Offset(250, 220), width: 190, height: 180)),
        ),
      ],
      detailsPainter: (canvas, size) {
        DrawingBuilderHelpers.drawKawaiiFace(
          canvas,
          leftEye: const Offset(215, 215),
          rightEye: const Offset(285, 215),
          mouthCenter: const Offset(250, 245),
          eyeRadius: 8,
        );
      },
      outlinesPainter: (canvas, size) {
        final bloom = Path()..addOval(Rect.fromCenter(center: const Offset(250, 220), width: 190, height: 180));
        DrawingBuilderHelpers.drawOutline(canvas, bloom, width: 6.0);
      },
    ),

    // Level 39: Daisy
    ColoringDrawing(
      id: 'flower_daisy',
      title: 'Happy Daisy',
      category: DrawingCategory.flowers,
      levelNumber: 39,
      funFact: 'Daisies are found everywhere on Earth except Antarctica!',
      regions: [
        ColoringRegion(
          id: 'dai_petals',
          name: 'White Petals',
          defaultColor: Colors.white,
          path: DrawingBuilderHelpers.makeStarPath(const Offset(250, 230), 130, 80, 10),
        ),
        ColoringRegion(
          id: 'dai_center',
          name: 'Golden Center',
          defaultColor: const Color(0xFFFFCC00),
          path: Path()..addOval(Rect.fromCircle(center: const Offset(250, 230), radius: 50)),
        ),
      ],
      detailsPainter: (canvas, size) {
        DrawingBuilderHelpers.drawKawaiiFace(
          canvas,
          leftEye: const Offset(230, 225),
          rightEye: const Offset(270, 225),
          mouthCenter: const Offset(250, 245),
          eyeRadius: 6,
        );
      },
      outlinesPainter: (canvas, size) {
        final petals = DrawingBuilderHelpers.makeStarPath(const Offset(250, 230), 130, 80, 10);
        DrawingBuilderHelpers.drawOutline(canvas, petals, width: 6.0);
        DrawingBuilderHelpers.drawCircleOutline(canvas, const Offset(250, 230), 50, width: 5.5);
      },
    ),

    // Level 40: Lotus
    ColoringDrawing(
      id: 'flower_lotus',
      title: 'Water Lotus',
      category: DrawingCategory.flowers,
      levelNumber: 40,
      funFact: 'Lotus flowers can regulate their own temperature just like humans do!',
      regions: [
        ColoringRegion(
          id: 'lot_petals',
          name: 'Pink Petals',
          defaultColor: const Color(0xFFFF85A1),
          path: Path()
            ..moveTo(150, 280)
            ..lineTo(190, 170)
            ..lineTo(250, 120)
            ..lineTo(310, 170)
            ..lineTo(350, 280)
            ..close(),
        ),
      ],
      detailsPainter: (canvas, size) {
        DrawingBuilderHelpers.drawKawaiiFace(
          canvas,
          leftEye: const Offset(215, 230),
          rightEye: const Offset(285, 230),
          mouthCenter: const Offset(250, 255),
          eyeRadius: 8,
        );
      },
      outlinesPainter: (canvas, size) {
        final petals = Path()
          ..moveTo(150, 280)
          ..lineTo(190, 170)
          ..lineTo(250, 120)
          ..lineTo(310, 170)
          ..lineTo(350, 280)
          ..close();
        DrawingBuilderHelpers.drawOutline(canvas, petals, width: 6.0);
      },
    ),

    // Level 41: Cherry Blossom
    ColoringDrawing(
      id: 'flower_cherry',
      title: 'Sakura Blossom',
      category: DrawingCategory.flowers,
      levelNumber: 41,
      funFact: 'Cherry blossom season in Japan signals the arrival of cheerful springtime!',
      regions: [
        ColoringRegion(
          id: 'sak_petals',
          name: 'Sakura Petals',
          defaultColor: const Color(0xFFFFE6ED),
          path: DrawingBuilderHelpers.makeStarPath(const Offset(250, 240), 125, 70, 5),
        ),
      ],
      detailsPainter: (canvas, size) {
        DrawingBuilderHelpers.drawKawaiiFace(
          canvas,
          leftEye: const Offset(225, 235),
          rightEye: const Offset(275, 235),
          mouthCenter: const Offset(250, 255),
          eyeRadius: 7,
        );
      },
      outlinesPainter: (canvas, size) {
        final petals = DrawingBuilderHelpers.makeStarPath(const Offset(250, 240), 125, 70, 5);
        DrawingBuilderHelpers.drawOutline(canvas, petals, width: 6.0);
      },
    ),

    // Level 42: Cactus Flower
    ColoringDrawing(
      id: 'flower_cactus',
      title: 'Desert Cactus',
      category: DrawingCategory.flowers,
      levelNumber: 42,
      funFact: 'Some desert cacti can live for more than 200 years without needing much water!',
      regions: [
        ColoringRegion(
          id: 'cac_body',
          name: 'Green Cactus',
          defaultColor: const Color(0xFF34C759),
          path: Path()..addRRect(RRect.fromRectAndRadius(const Rect.fromLTWH(180, 160, 140, 220), const Radius.circular(50))),
        ),
        ColoringRegion(
          id: 'cac_flower',
          name: 'Pink Bloom',
          defaultColor: const Color(0xFFFF2D55),
          path: Path()..addOval(Rect.fromCircle(center: const Offset(250, 140), radius: 35)),
        ),
      ],
      detailsPainter: (canvas, size) {
        DrawingBuilderHelpers.drawKawaiiFace(
          canvas,
          leftEye: const Offset(215, 250),
          rightEye: const Offset(285, 250),
          mouthCenter: const Offset(250, 280),
          eyeRadius: 8,
        );
      },
      outlinesPainter: (canvas, size) {
        final body = Path()..addRRect(RRect.fromRectAndRadius(const Rect.fromLTWH(180, 160, 140, 220), const Radius.circular(50)));
        DrawingBuilderHelpers.drawOutline(canvas, body, width: 6.0);
        DrawingBuilderHelpers.drawCircleOutline(canvas, const Offset(250, 140), 35);
      },
    ),
  ];
}
