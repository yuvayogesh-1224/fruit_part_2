import 'package:flutter/material.dart';
import '../models/category_model.dart';
import '../models/drawing_model.dart';
import '../models/region_model.dart';
import '../theme/app_colors.dart';
import 'drawing_builder_helpers.dart';

List<ColoringDrawing> getToyDrawings() {
  return [
    // Level 85: Teddy Bear
    ColoringDrawing(
      id: 'toy_bear',
      title: 'Cuddly Teddy',
      category: DrawingCategory.toys,
      levelNumber: 85,
      funFact: 'Teddy bears were named after US President Theodore "Teddy" Roosevelt in 1902!',
      regions: [
        ColoringRegion(
          id: 'ted_head',
          name: 'Teddy Head',
          defaultColor: const Color(0xFFA2845E),
          path: Path()..addOval(Rect.fromCenter(center: const Offset(250, 210), width: 190, height: 170)),
        ),
        ColoringRegion(
          id: 'ted_body',
          name: 'Plush Body',
          defaultColor: const Color(0xFFA2845E),
          path: Path()..addOval(Rect.fromCenter(center: const Offset(250, 340), width: 220, height: 180)),
        ),
        ColoringRegion(
          id: 'ted_ears',
          name: 'Teddy Ears',
          defaultColor: const Color(0xFF6F4E37),
          path: Path()
            ..addOval(Rect.fromCenter(center: const Offset(170, 135), width: 60, height: 60))
            ..addOval(Rect.fromCenter(center: const Offset(330, 135), width: 60, height: 60)),
        ),
      ],
      detailsPainter: (canvas, size) {
        DrawingBuilderHelpers.drawKawaiiFace(
          canvas,
          leftEye: const Offset(215, 200),
          rightEye: const Offset(285, 200),
          mouthCenter: const Offset(250, 230),
          eyeRadius: 8,
        );
      },
      outlinesPainter: (canvas, size) {
        DrawingBuilderHelpers.drawCircleOutline(canvas, const Offset(170, 135), 30);
        DrawingBuilderHelpers.drawCircleOutline(canvas, const Offset(330, 135), 30);
        final head = Path()..addOval(Rect.fromCenter(center: const Offset(250, 210), width: 190, height: 170));
        DrawingBuilderHelpers.drawOutline(canvas, head, width: 6.0);
        final body = Path()..addOval(Rect.fromCenter(center: const Offset(250, 340), width: 220, height: 180));
        DrawingBuilderHelpers.drawOutline(canvas, body, width: 6.0);
      },
    ),

    // Level 86: Robot
    ColoringDrawing(
      id: 'toy_robot',
      title: 'Beep Robot',
      category: DrawingCategory.toys,
      levelNumber: 86,
      funFact: 'The word robot comes from the Czech word "robota", meaning forced labor or work!',
      regions: [
        ColoringRegion(
          id: 'rob_head',
          name: 'Robot Head',
          defaultColor: const Color(0xFF4ECDC4),
          path: Path()..addRRect(RRect.fromRectAndRadius(const Rect.fromLTWH(160, 140, 180, 140), const Radius.circular(24))),
        ),
        ColoringRegion(
          id: 'rob_body',
          name: 'Robot Torso',
          defaultColor: const Color(0xFF3A86FF),
          path: Path()..addRRect(RRect.fromRectAndRadius(const Rect.fromLTWH(150, 300, 200, 140), const Radius.circular(20))),
        ),
      ],
      detailsPainter: (canvas, size) {
        // Robot screen eyes
        final eyePaint = Paint()..color = const Color(0xFFFFD166);
        canvas.drawCircle(const Offset(205, 200), 16, eyePaint);
        canvas.drawCircle(const Offset(295, 200), 16, eyePaint);
      },
      outlinesPainter: (canvas, size) {
        DrawingBuilderHelpers.drawOutline(canvas, Path()..addRRect(RRect.fromRectAndRadius(const Rect.fromLTWH(160, 140, 180, 140), const Radius.circular(24))), width: 6.0);
        DrawingBuilderHelpers.drawOutline(canvas, Path()..addRRect(RRect.fromRectAndRadius(const Rect.fromLTWH(150, 300, 200, 140), const Radius.circular(20))), width: 6.0);
      },
    ),

    // Level 87: Play Drum
    ColoringDrawing(
      id: 'toy_drum',
      title: 'Bongo Drum',
      category: DrawingCategory.toys,
      levelNumber: 87,
      funFact: 'Drums are the world’s oldest musical instruments after the human voice!',
      regions: [
        ColoringRegion(
          id: 'drum_body',
          name: 'Drum Shell',
          defaultColor: const Color(0xFFFF3B30),
          path: Path()..addRect(const Rect.fromLTWH(130, 210, 240, 170)),
        ),
        ColoringRegion(
          id: 'drum_top',
          name: 'Drum Head',
          defaultColor: const Color(0xFFFFF2D1),
          path: Path()..addOval(Rect.fromCenter(center: const Offset(250, 210), width: 240, height: 70)),
        ),
      ],
      detailsPainter: (canvas, size) {
        DrawingBuilderHelpers.drawKawaiiFace(
          canvas,
          leftEye: const Offset(215, 280),
          rightEye: const Offset(285, 280),
          mouthCenter: const Offset(250, 310),
          eyeRadius: 7,
        );
      },
      outlinesPainter: (canvas, size) {
        DrawingBuilderHelpers.drawOutline(canvas, Path()..addRect(const Rect.fromLTWH(130, 210, 240, 170)), width: 6.0);
        DrawingBuilderHelpers.drawOutline(canvas, Path()..addOval(Rect.fromCenter(center: const Offset(250, 210), width: 240, height: 70)), width: 5.5);
      },
    ),

    // Level 88: Rocking Horse
    ColoringDrawing(
      id: 'toy_horse',
      title: 'Rocking Horse',
      category: DrawingCategory.toys,
      levelNumber: 88,
      funFact: 'Rocking horses were first created in medieval times to teach children how to joust and ride!',
      regions: [
        ColoringRegion(
          id: 'horse_body',
          name: 'Wooden Horse',
          defaultColor: const Color(0xFFFF9F1C),
          path: Path()..addOval(Rect.fromCenter(center: const Offset(250, 260), width: 220, height: 160)),
        ),
      ],
      detailsPainter: (canvas, size) {
        DrawingBuilderHelpers.drawKawaiiFace(
          canvas,
          leftEye: const Offset(190, 240),
          rightEye: const Offset(230, 240),
          mouthCenter: const Offset(200, 270),
          eyeRadius: 7,
        );
      },
      outlinesPainter: (canvas, size) {
        final body = Path()..addOval(Rect.fromCenter(center: const Offset(250, 260), width: 220, height: 160));
        DrawingBuilderHelpers.drawOutline(canvas, body, width: 6.0);
      },
    ),

    // Level 89: Yo-Yo
    ColoringDrawing(
      id: 'toy_yoyo',
      title: 'Spinning Yo-Yo',
      category: DrawingCategory.toys,
      levelNumber: 89,
      funFact: 'Yo-yo is believed to be the second oldest toy in world history after dolls!',
      regions: [
        ColoringRegion(
          id: 'yoyo_body',
          name: 'Yo-Yo Disk',
          defaultColor: const Color(0xFFFF2D55),
          path: Path()..addOval(Rect.fromCircle(center: const Offset(250, 260), radius: 120)),
        ),
      ],
      detailsPainter: (canvas, size) {
        DrawingBuilderHelpers.drawKawaiiFace(
          canvas,
          leftEye: const Offset(215, 245),
          rightEye: const Offset(285, 245),
          mouthCenter: const Offset(250, 275),
          eyeRadius: 8,
        );
      },
      outlinesPainter: (canvas, size) {
        DrawingBuilderHelpers.drawCircleOutline(canvas, const Offset(250, 260), 120, width: 6.0);
      },
    ),

    // Level 90: Spinning Top
    ColoringDrawing(
      id: 'toy_top',
      title: 'Spinning Top',
      category: DrawingCategory.toys,
      levelNumber: 90,
      funFact: 'A spinning top stays upright because of angular momentum gyroscopic force!',
      regions: [
        ColoringRegion(
          id: 'top_cone',
          name: 'Top Body',
          defaultColor: const Color(0xFF9D4EDD),
          path: Path()
            ..moveTo(130, 210)
            ..lineTo(370, 210)
            ..lineTo(250, 390)
            ..close(),
        ),
      ],
      detailsPainter: (canvas, size) {
        DrawingBuilderHelpers.drawKawaiiFace(
          canvas,
          leftEye: const Offset(215, 250),
          rightEye: const Offset(285, 250),
          mouthCenter: const Offset(250, 280),
          eyeRadius: 7,
        );
      },
      outlinesPainter: (canvas, size) {
        final cone = Path()
          ..moveTo(130, 210)
          ..lineTo(370, 210)
          ..lineTo(250, 390)
          ..close();
        DrawingBuilderHelpers.drawOutline(canvas, cone, width: 6.0);
      },
    ),

    // Level 91: Rubber Duck
    ColoringDrawing(
      id: 'toy_duck',
      title: 'Bath Rubber Duck',
      category: DrawingCategory.toys,
      levelNumber: 91,
      funFact: 'In 1992, a container of 28,000 rubber ducks spilled into the Pacific Ocean and floated around the globe!',
      regions: [
        ColoringRegion(
          id: 'rduck_body',
          name: 'Yellow Duck',
          defaultColor: const Color(0xFFFFCC00),
          path: Path()
            ..moveTo(140, 270)
            ..cubicTo(120, 200, 360, 200, 350, 280)
            ..cubicTo(340, 380, 160, 380, 140, 270)
            ..close(),
        ),
      ],
      detailsPainter: (canvas, size) {
        DrawingBuilderHelpers.drawKawaiiFace(
          canvas,
          leftEye: const Offset(180, 230),
          rightEye: const Offset(230, 230),
          mouthCenter: const Offset(150, 250),
          eyeRadius: 7,
        );
      },
      outlinesPainter: (canvas, size) {
        final body = Path()
          ..moveTo(140, 270)
          ..cubicTo(120, 200, 360, 200, 350, 280)
          ..cubicTo(340, 380, 160, 380, 140, 270)
          ..close();
        DrawingBuilderHelpers.drawOutline(canvas, body, width: 6.0);
      },
    ),
  ];
}

List<ColoringDrawing> getFoodDrawings() {
  return [
    // Level 92: Ice Cream Cone
    ColoringDrawing(
      id: 'food_icecream',
      title: 'Ice Cream Cone',
      category: DrawingCategory.food,
      levelNumber: 92,
      funFact: 'It takes an average of 50 licks to finish a single ice cream scoop!',
      regions: [
        ColoringRegion(
          id: 'ice_scoop',
          name: 'Pink Scoop',
          defaultColor: const Color(0xFFFF85A1),
          path: Path()..addOval(Rect.fromCircle(center: const Offset(250, 200), radius: 95)),
        ),
        ColoringRegion(
          id: 'ice_cone',
          name: 'Waffle Cone',
          defaultColor: const Color(0xFFDDA15E),
          path: Path()
            ..moveTo(160, 250)
            ..lineTo(340, 250)
            ..lineTo(250, 440)
            ..close(),
        ),
      ],
      detailsPainter: (canvas, size) {
        DrawingBuilderHelpers.drawKawaiiFace(
          canvas,
          leftEye: const Offset(215, 190),
          rightEye: const Offset(285, 190),
          mouthCenter: const Offset(250, 215),
          eyeRadius: 8,
        );
      },
      outlinesPainter: (canvas, size) {
        DrawingBuilderHelpers.drawCircleOutline(canvas, const Offset(250, 200), 95, width: 6.0);
        final cone = Path()
          ..moveTo(160, 250)
          ..lineTo(340, 250)
          ..lineTo(250, 440)
          ..close();
        DrawingBuilderHelpers.drawOutline(canvas, cone, width: 6.0);
      },
    ),

    // Level 93: Cupcake
    ColoringDrawing(
      id: 'food_cupcake',
      title: 'Sweet Cupcake',
      category: DrawingCategory.food,
      levelNumber: 93,
      funFact: 'Cupcakes were originally called "number cakes" because of the easy 1-2-3-4 ingredient measuring formula!',
      regions: [
        ColoringRegion(
          id: 'cup_frosting',
          name: 'Frosting Swirl',
          defaultColor: const Color(0xFFFF85A1),
          path: Path()
            ..moveTo(150, 250)
            ..cubicTo(120, 150, 380, 150, 350, 250)
            ..close(),
        ),
        ColoringRegion(
          id: 'cup_wrapper',
          name: 'Pastry Liner',
          defaultColor: const Color(0xFFFFD166),
          path: Path()
            ..moveTo(160, 250)
            ..lineTo(190, 410)
            ..lineTo(310, 410)
            ..lineTo(340, 250)
            ..close(),
        ),
      ],
      detailsPainter: (canvas, size) {
        DrawingBuilderHelpers.drawKawaiiFace(
          canvas,
          leftEye: const Offset(215, 205),
          rightEye: const Offset(285, 205),
          mouthCenter: const Offset(250, 225),
          eyeRadius: 7,
        );
      },
      outlinesPainter: (canvas, size) {
        final frosting = Path()
          ..moveTo(150, 250)
          ..cubicTo(120, 150, 380, 150, 350, 250)
          ..close();
        DrawingBuilderHelpers.drawOutline(canvas, frosting, width: 6.0);
        final wrapper = Path()
          ..moveTo(160, 250)
          ..lineTo(190, 410)
          ..lineTo(310, 410)
          ..lineTo(340, 250)
          ..close();
        DrawingBuilderHelpers.drawOutline(canvas, wrapper, width: 5.5);
      },
    ),

    // Level 94: Donut
    ColoringDrawing(
      id: 'food_donut',
      title: 'Glazed Donut',
      category: DrawingCategory.food,
      levelNumber: 94,
      funFact: 'Over 10 billion donuts are made in the United States every single year!',
      regions: [
        ColoringRegion(
          id: 'don_dough',
          name: 'Donut Dough',
          defaultColor: const Color(0xFFDDA15E),
          path: Path()..addOval(Rect.fromCircle(center: const Offset(250, 250), radius: 130)),
        ),
        ColoringRegion(
          id: 'don_icing',
          name: 'Pink Icing',
          defaultColor: const Color(0xFFFF2D55),
          path: Path()..addOval(Rect.fromCircle(center: const Offset(250, 250), radius: 105)),
        ),
      ],
      detailsPainter: (canvas, size) {
        // Center hole
        canvas.drawCircle(const Offset(250, 250), 38, Paint()..color = AppColors.canvasBackground);
        DrawingBuilderHelpers.drawKawaiiFace(
          canvas,
          leftEye: const Offset(205, 230),
          rightEye: const Offset(295, 230),
          mouthCenter: const Offset(250, 315),
          eyeRadius: 7,
        );
      },
      outlinesPainter: (canvas, size) {
        DrawingBuilderHelpers.drawCircleOutline(canvas, const Offset(250, 250), 130, width: 6.0);
        DrawingBuilderHelpers.drawCircleOutline(canvas, const Offset(250, 250), 38, width: 5.5);
      },
    ),

    // Level 95: Pizza
    ColoringDrawing(
      id: 'food_pizza',
      title: 'Cheesy Pizza',
      category: DrawingCategory.food,
      levelNumber: 95,
      funFact: 'Around 350 slices of delicious pizza are eaten in the US every single second!',
      regions: [
        ColoringRegion(
          id: 'piz_slice',
          name: 'Cheese Slice',
          defaultColor: const Color(0xFFFFCC00),
          path: Path()
            ..moveTo(140, 160)
            ..cubicTo(200, 140, 300, 140, 360, 160)
            ..lineTo(250, 420)
            ..close(),
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
        final slice = Path()
          ..moveTo(140, 160)
          ..cubicTo(200, 140, 300, 140, 360, 160)
          ..lineTo(250, 420)
          ..close();
        DrawingBuilderHelpers.drawOutline(canvas, slice, width: 6.0);
      },
    ),

    // Level 96: Burger
    ColoringDrawing(
      id: 'food_burger',
      title: 'Juicy Burger',
      category: DrawingCategory.food,
      levelNumber: 96,
      funFact: 'The hamburger was invented more than 100 years ago!',
      regions: [
        ColoringRegion(
          id: 'burg_bun',
          name: 'Toasted Bun',
          defaultColor: const Color(0xFFDDA15E),
          path: Path()
            ..moveTo(140, 220)
            ..cubicTo(140, 120, 360, 120, 360, 220)
            ..close(),
        ),
        ColoringRegion(
          id: 'burg_patty',
          name: 'Patty & Cheese',
          defaultColor: const Color(0xFF6F4E37),
          path: Path()..addRRect(RRect.fromRectAndRadius(const Rect.fromLTWH(130, 240, 240, 60), const Radius.circular(16))),
        ),
      ],
      detailsPainter: (canvas, size) {
        DrawingBuilderHelpers.drawKawaiiFace(
          canvas,
          leftEye: const Offset(215, 185),
          rightEye: const Offset(285, 185),
          mouthCenter: const Offset(250, 205),
          eyeRadius: 7,
        );
      },
      outlinesPainter: (canvas, size) {
        final bun = Path()
          ..moveTo(140, 220)
          ..cubicTo(140, 120, 360, 120, 360, 220)
          ..close();
        DrawingBuilderHelpers.drawOutline(canvas, bun, width: 6.0);
      },
    ),

    // Level 97: Lollipop
    ColoringDrawing(
      id: 'food_lollipop',
      title: 'Rainbow Lollipop',
      category: DrawingCategory.food,
      levelNumber: 97,
      funFact: 'The world’s largest lollipop weighed 7,000 pounds!',
      regions: [
        ColoringRegion(
          id: 'loll_candy',
          name: 'Swirl Candy',
          defaultColor: const Color(0xFFFF2D55),
          path: Path()..addOval(Rect.fromCircle(center: const Offset(250, 190), radius: 95)),
        ),
        ColoringRegion(
          id: 'loll_stick',
          name: 'Candy Stick',
          defaultColor: Colors.white,
          path: Path()..addRect(const Rect.fromLTWH(242, 285, 16, 150)),
        ),
      ],
      detailsPainter: (canvas, size) {
        DrawingBuilderHelpers.drawKawaiiFace(
          canvas,
          leftEye: const Offset(220, 180),
          rightEye: const Offset(280, 180),
          mouthCenter: const Offset(250, 205),
          eyeRadius: 7,
        );
      },
      outlinesPainter: (canvas, size) {
        DrawingBuilderHelpers.drawCircleOutline(canvas, const Offset(250, 190), 95, width: 6.0);
        DrawingBuilderHelpers.drawOutline(canvas, Path()..addRect(const Rect.fromLTWH(242, 285, 16, 150)), width: 5.0);
      },
    ),

    // Level 98: Birthday Cake
    ColoringDrawing(
      id: 'food_cake',
      title: 'Celebration Cake',
      category: DrawingCategory.food,
      levelNumber: 98,
      funFact: 'Putting candles on birthday cakes started in Ancient Greece to make the cake glow like the moon!',
      regions: [
        ColoringRegion(
          id: 'cake_layer',
          name: 'Frosting Cake',
          defaultColor: const Color(0xFFFF85A1),
          path: Path()..addRRect(RRect.fromRectAndRadius(const Rect.fromLTWH(130, 230, 240, 170), const Radius.circular(20))),
        ),
      ],
      detailsPainter: (canvas, size) {
        DrawingBuilderHelpers.drawKawaiiFace(
          canvas,
          leftEye: const Offset(215, 300),
          rightEye: const Offset(285, 300),
          mouthCenter: const Offset(250, 330),
          eyeRadius: 8,
        );
      },
      outlinesPainter: (canvas, size) {
        DrawingBuilderHelpers.drawOutline(canvas, Path()..addRRect(RRect.fromRectAndRadius(const Rect.fromLTWH(130, 230, 240, 170), const Radius.circular(20))), width: 6.0);
      },
    ),
  ];
}

List<ColoringDrawing> getCartoonObjectDrawings() {
  return [
    // Level 99: Teapot
    ColoringDrawing(
      id: 'obj_teapot',
      title: 'Cozy Teapot',
      category: DrawingCategory.cartoonObjects,
      levelNumber: 99,
      funFact: 'Tea was discovered by accident in ancient China over 4,700 years ago when tea leaves blew into boiling water!',
      regions: [
        ColoringRegion(
          id: 'tea_pot',
          name: 'Teapot Body',
          defaultColor: const Color(0xFF00C7BE),
          path: Path()..addOval(Rect.fromCenter(center: const Offset(250, 270), width: 220, height: 180)),
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
        final pot = Path()..addOval(Rect.fromCenter(center: const Offset(250, 270), width: 220, height: 180));
        DrawingBuilderHelpers.drawOutline(canvas, pot, width: 6.0);
      },
    ),

    // Level 100: Alarm Clock
    ColoringDrawing(
      id: 'obj_clock',
      title: 'Cheerful Clock',
      category: DrawingCategory.cartoonObjects,
      levelNumber: 100,
      funFact: 'Before alarm clocks existed, people called "knocker-uppers" were paid to tap on bedroom windows with long sticks!',
      regions: [
        ColoringRegion(
          id: 'clock_face',
          name: 'Clock Face',
          defaultColor: const Color(0xFFFFCC00),
          path: Path()..addOval(Rect.fromCircle(center: const Offset(250, 250), radius: 110)),
        ),
        ColoringRegion(
          id: 'clock_bells',
          name: 'Twin Bells',
          defaultColor: const Color(0xFFFF3B30),
          path: Path()
            ..addOval(Rect.fromCircle(center: const Offset(170, 140), radius: 36))
            ..addOval(Rect.fromCircle(center: const Offset(330, 140), radius: 36)),
        ),
      ],
      detailsPainter: (canvas, size) {
        DrawingBuilderHelpers.drawKawaiiFace(
          canvas,
          leftEye: const Offset(215, 235),
          rightEye: const Offset(285, 235),
          mouthCenter: const Offset(250, 265),
          eyeRadius: 8,
        );
      },
      outlinesPainter: (canvas, size) {
        DrawingBuilderHelpers.drawCircleOutline(canvas, const Offset(170, 140), 36);
        DrawingBuilderHelpers.drawCircleOutline(canvas, const Offset(330, 140), 36);
        DrawingBuilderHelpers.drawCircleOutline(canvas, const Offset(250, 250), 110, width: 6.0);
      },
    ),

    // Level 101: Pencil
    ColoringDrawing(
      id: 'obj_pencil',
      title: 'Smiling Pencil',
      category: DrawingCategory.cartoonObjects,
      levelNumber: 101,
      funFact: 'A single pencil has enough graphite inside to draw a line 35 miles long!',
      regions: [
        ColoringRegion(
          id: 'pen_shaft',
          name: 'Yellow Shaft',
          defaultColor: const Color(0xFFFFCC00),
          path: Path()..addRect(const Rect.fromLTWH(210, 140, 80, 220)),
        ),
        ColoringRegion(
          id: 'pen_eraser',
          name: 'Pink Eraser',
          defaultColor: const Color(0xFFFF85A1),
          path: Path()..addRect(const Rect.fromLTWH(210, 90, 80, 50)),
        ),
        ColoringRegion(
          id: 'pen_tip',
          name: 'Sharpened Tip',
          defaultColor: const Color(0xFFDDA15E),
          path: Path()
            ..moveTo(210, 360)
            ..lineTo(290, 360)
            ..lineTo(250, 440)
            ..close(),
        ),
      ],
      detailsPainter: (canvas, size) {
        DrawingBuilderHelpers.drawKawaiiFace(
          canvas,
          leftEye: const Offset(230, 220),
          rightEye: const Offset(270, 220),
          mouthCenter: const Offset(250, 245),
          eyeRadius: 7,
        );
      },
      outlinesPainter: (canvas, size) {
        DrawingBuilderHelpers.drawOutline(canvas, Path()..addRect(const Rect.fromLTWH(210, 140, 80, 220)), width: 5.5);
        DrawingBuilderHelpers.drawOutline(canvas, Path()..addRect(const Rect.fromLTWH(210, 90, 80, 50)), width: 5.5);
        final tip = Path()
          ..moveTo(210, 360)
          ..lineTo(290, 360)
          ..lineTo(250, 440)
          ..close();
        DrawingBuilderHelpers.drawOutline(canvas, tip, width: 5.5);
      },
    ),

    // Level 102: Book
    ColoringDrawing(
      id: 'obj_book',
      title: 'Storybook',
      category: DrawingCategory.cartoonObjects,
      levelNumber: 102,
      funFact: 'Reading books for just 6 minutes a day can reduce stress by 68%!',
      regions: [
        ColoringRegion(
          id: 'bk_cover',
          name: 'Book Cover',
          defaultColor: const Color(0xFF3A86FF),
          path: Path()..addRRect(RRect.fromRectAndRadius(const Rect.fromLTWH(120, 180, 260, 200), const Radius.circular(18))),
        ),
      ],
      detailsPainter: (canvas, size) {
        DrawingBuilderHelpers.drawKawaiiFace(
          canvas,
          leftEye: const Offset(215, 260),
          rightEye: const Offset(285, 260),
          mouthCenter: const Offset(250, 290),
          eyeRadius: 8,
        );
      },
      outlinesPainter: (canvas, size) {
        DrawingBuilderHelpers.drawOutline(canvas, Path()..addRRect(RRect.fromRectAndRadius(const Rect.fromLTWH(120, 180, 260, 200), const Radius.circular(18))), width: 6.0);
      },
    ),

    // Level 103: Lightbulb
    ColoringDrawing(
      id: 'obj_lightbulb',
      title: 'Bright Idea Bulb',
      category: DrawingCategory.cartoonObjects,
      levelNumber: 103,
      funFact: 'Thomas Edison tested thousands of materials before creating the practical incandescent light bulb!',
      regions: [
        ColoringRegion(
          id: 'bulb_glass',
          name: 'Glowing Bulb',
          defaultColor: const Color(0xFFFFCC00),
          path: Path()..addOval(Rect.fromCircle(center: const Offset(250, 210), radius: 100)),
        ),
      ],
      detailsPainter: (canvas, size) {
        DrawingBuilderHelpers.drawKawaiiFace(
          canvas,
          leftEye: const Offset(215, 200),
          rightEye: const Offset(285, 200),
          mouthCenter: const Offset(250, 225),
          eyeRadius: 8,
        );
      },
      outlinesPainter: (canvas, size) {
        DrawingBuilderHelpers.drawCircleOutline(canvas, const Offset(250, 210), 100, width: 6.0);
      },
    ),

    // Level 104: Backpack
    ColoringDrawing(
      id: 'obj_backpack',
      title: 'Adventure Backpack',
      category: DrawingCategory.cartoonObjects,
      levelNumber: 104,
      funFact: 'Backpacks with two padded shoulder straps help distribute weight evenly across your back!',
      regions: [
        ColoringRegion(
          id: 'bp_body',
          name: 'Backpack Body',
          defaultColor: const Color(0xFFFF6B6B),
          path: Path()..addRRect(RRect.fromRectAndRadius(const Rect.fromLTWH(140, 160, 220, 240), const Radius.circular(32))),
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
        DrawingBuilderHelpers.drawOutline(canvas, Path()..addRRect(RRect.fromRectAndRadius(const Rect.fromLTWH(140, 160, 220, 240), const Radius.circular(32))), width: 6.0);
      },
    ),

    // Level 105: Teacup
    ColoringDrawing(
      id: 'obj_teacup',
      title: 'Smiling Teacup',
      category: DrawingCategory.cartoonObjects,
      levelNumber: 105,
      funFact: 'Congratulations on reaching Level 105! You are now an official Master Artist!',
      regions: [
        ColoringRegion(
          id: 'cup_bowl',
          name: 'Ceramic Cup',
          defaultColor: const Color(0xFFFF85A1),
          path: Path()
            ..moveTo(160, 220)
            ..cubicTo(160, 360, 340, 360, 340, 220)
            ..close(),
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
        final bowl = Path()
          ..moveTo(160, 220)
          ..cubicTo(160, 360, 340, 360, 340, 220)
          ..close();
        DrawingBuilderHelpers.drawOutline(canvas, bowl, width: 6.0);
      },
    ),
  ];
}
