import 'package:flutter/material.dart';
import '../models/category_model.dart';
import '../models/drawing_model.dart';
import '../models/region_model.dart';
import '../theme/app_colors.dart';
import 'drawing_builder_helpers.dart';

List<ColoringDrawing> getSeaAnimalDrawings() {
  return [
    // Level 64: Happy Fish (Featured in prompt!)
    ColoringDrawing(
      id: 'sea_fish',
      title: 'Bubbling Fish',
      category: DrawingCategory.seaAnimals,
      levelNumber: 64,
      funFact: 'Goldfish have a memory span of at least 3 months, not 3 seconds!',
      regions: [
        ColoringRegion(
          id: 'fish_body',
          name: 'Fish Body',
          defaultColor: const Color(0xFFFF9500),
          path: Path()
            ..moveTo(130, 250)
            ..cubicTo(180, 160, 310, 160, 360, 250)
            ..cubicTo(310, 340, 180, 340, 130, 250)
            ..close(),
        ),
        ColoringRegion(
          id: 'fish_tail',
          name: 'Fish Tail',
          defaultColor: const Color(0xFFFFCC00),
          path: Path()
            ..moveTo(340, 250)
            ..lineTo(410, 190)
            ..lineTo(390, 250)
            ..lineTo(410, 310)
            ..close(),
        ),
        ColoringRegion(
          id: 'fish_fins',
          name: 'Top Fin',
          defaultColor: const Color(0xFFFFCC00),
          path: Path()
            ..moveTo(210, 190)
            ..cubicTo(240, 130, 280, 130, 300, 190)
            ..close(),
        ),
      ],
      detailsPainter: (canvas, size) {
        DrawingBuilderHelpers.drawKawaiiFace(
          canvas,
          leftEye: const Offset(195, 230),
          rightEye: const Offset(235, 230),
          mouthCenter: const Offset(155, 260),
          eyeRadius: 8,
        );
      },
      outlinesPainter: (canvas, size) {
        final body = Path()
          ..moveTo(130, 250)
          ..cubicTo(180, 160, 310, 160, 360, 250)
          ..cubicTo(310, 340, 180, 340, 130, 250)
          ..close();
        DrawingBuilderHelpers.drawOutline(canvas, body, width: 6.0);
        final tail = Path()
          ..moveTo(340, 250)
          ..lineTo(410, 190)
          ..lineTo(390, 250)
          ..lineTo(410, 310)
          ..close();
        DrawingBuilderHelpers.drawOutline(canvas, tail, width: 5.5);
      },
    ),

    // Level 65: Octopus
    ColoringDrawing(
      id: 'sea_octopus',
      title: 'Smiling Octopus',
      category: DrawingCategory.seaAnimals,
      levelNumber: 65,
      funFact: 'Octopuses have 3 hearts and blue blood!',
      regions: [
        ColoringRegion(
          id: 'oct_head',
          name: 'Round Head',
          defaultColor: const Color(0xFFFF2D55),
          path: Path()..addOval(Rect.fromCenter(center: const Offset(250, 220), width: 200, height: 180)),
        ),
        ColoringRegion(
          id: 'oct_tentacles',
          name: 'Wiggly Tentacles',
          defaultColor: const Color(0xFFFF85A1),
          path: Path()
            ..moveTo(160, 280)
            ..cubicTo(130, 380, 170, 420, 190, 380)
            ..cubicTo(200, 430, 240, 430, 250, 380)
            ..cubicTo(260, 430, 300, 430, 310, 380)
            ..cubicTo(330, 420, 370, 380, 340, 280)
            ..close(),
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
        final head = Path()..addOval(Rect.fromCenter(center: const Offset(250, 220), width: 200, height: 180));
        DrawingBuilderHelpers.drawOutline(canvas, head, width: 6.0);
      },
    ),

    // Level 66: Dolphin
    ColoringDrawing(
      id: 'sea_dolphin',
      title: 'Leaping Dolphin',
      category: DrawingCategory.seaAnimals,
      levelNumber: 66,
      funFact: 'Dolphins sleep with one eye open and half their brain awake!',
      regions: [
        ColoringRegion(
          id: 'dol_body',
          name: 'Blue Dolphin',
          defaultColor: const Color(0xFF00C7BE),
          path: Path()
            ..moveTo(110, 270)
            ..cubicTo(160, 150, 340, 150, 390, 270)
            ..cubicTo(330, 310, 200, 310, 110, 270)
            ..close(),
        ),
      ],
      detailsPainter: (canvas, size) {
        DrawingBuilderHelpers.drawKawaiiFace(
          canvas,
          leftEye: const Offset(170, 245),
          rightEye: const Offset(215, 245),
          mouthCenter: const Offset(140, 275),
          eyeRadius: 7,
        );
      },
      outlinesPainter: (canvas, size) {
        final body = Path()
          ..moveTo(110, 270)
          ..cubicTo(160, 150, 340, 150, 390, 270)
          ..cubicTo(330, 310, 200, 310, 110, 270)
          ..close();
        DrawingBuilderHelpers.drawOutline(canvas, body, width: 6.0);
      },
    ),

    // Level 67: Whale
    ColoringDrawing(
      id: 'sea_whale',
      title: 'Spouting Whale',
      category: DrawingCategory.seaAnimals,
      levelNumber: 67,
      funFact: 'A blue whale’s tongue can weigh as much as an entire elephant!',
      regions: [
        ColoringRegion(
          id: 'wha_body',
          name: 'Whale Body',
          defaultColor: const Color(0xFF118AB2),
          path: Path()..addOval(Rect.fromCenter(center: const Offset(230, 280), width: 250, height: 180)),
        ),
        ColoringRegion(
          id: 'wha_belly',
          name: 'White Belly',
          defaultColor: Colors.white,
          path: Path()..addOval(Rect.fromCenter(center: const Offset(230, 320), width: 170, height: 100)),
        ),
      ],
      detailsPainter: (canvas, size) {
        DrawingBuilderHelpers.drawKawaiiFace(
          canvas,
          leftEye: const Offset(175, 270),
          rightEye: const Offset(225, 270),
          mouthCenter: const Offset(195, 300),
          eyeRadius: 7,
        );
      },
      outlinesPainter: (canvas, size) {
        final body = Path()..addOval(Rect.fromCenter(center: const Offset(230, 280), width: 250, height: 180));
        DrawingBuilderHelpers.drawOutline(canvas, body, width: 6.0);
      },
    ),

    // Level 68: Sea Turtle
    ColoringDrawing(
      id: 'sea_turtle',
      title: 'Gentle Sea Turtle',
      category: DrawingCategory.seaAnimals,
      levelNumber: 68,
      funFact: 'Sea turtles have lived in our oceans for more than 100 million years!',
      regions: [
        ColoringRegion(
          id: 'turt_shell',
          name: 'Turtle Shell',
          defaultColor: const Color(0xFF34C759),
          path: Path()..addOval(Rect.fromCenter(center: const Offset(250, 250), width: 210, height: 180)),
        ),
        ColoringRegion(
          id: 'turt_flippers',
          name: 'Flippers',
          defaultColor: const Color(0xFF80ED99),
          path: Path()
            ..addOval(Rect.fromCenter(center: const Offset(130, 190), width: 80, height: 50))
            ..addOval(Rect.fromCenter(center: const Offset(370, 190), width: 80, height: 50)),
        ),
      ],
      detailsPainter: (canvas, size) {
        DrawingBuilderHelpers.drawKawaiiFace(
          canvas,
          leftEye: const Offset(220, 235),
          rightEye: const Offset(280, 235),
          mouthCenter: const Offset(250, 260),
          eyeRadius: 7,
        );
      },
      outlinesPainter: (canvas, size) {
        final shell = Path()..addOval(Rect.fromCenter(center: const Offset(250, 250), width: 210, height: 180));
        DrawingBuilderHelpers.drawOutline(canvas, shell, width: 6.0);
      },
    ),

    // Level 69: Jellyfish
    ColoringDrawing(
      id: 'sea_jellyfish',
      title: 'Glowing Jellyfish',
      category: DrawingCategory.seaAnimals,
      levelNumber: 69,
      funFact: 'Jellyfish have no brain, no heart, and no bones, but they can glow in the dark!',
      regions: [
        ColoringRegion(
          id: 'jelly_bell',
          name: 'Umbrella Bell',
          defaultColor: const Color(0xFFFF85A1),
          path: Path()
            ..moveTo(140, 240)
            ..cubicTo(140, 120, 360, 120, 360, 240)
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
        final bell = Path()
          ..moveTo(140, 240)
          ..cubicTo(140, 120, 360, 120, 360, 240)
          ..close();
        DrawingBuilderHelpers.drawOutline(canvas, bell, width: 6.0);
      },
    ),

    // Level 70: Crab
    ColoringDrawing(
      id: 'sea_crab',
      title: 'Snappy Crab',
      category: DrawingCategory.seaAnimals,
      levelNumber: 70,
      funFact: 'Crabs communicate with each other by drumming their big claws!',
      regions: [
        ColoringRegion(
          id: 'crab_body',
          name: 'Red Shell',
          defaultColor: const Color(0xFFFF3B30),
          path: Path()..addOval(Rect.fromCenter(center: const Offset(250, 270), width: 200, height: 150)),
        ),
        ColoringRegion(
          id: 'crab_claws',
          name: 'Big Claws',
          defaultColor: const Color(0xFFFF3B30),
          path: Path()
            ..addOval(Rect.fromCenter(center: const Offset(120, 190), width: 70, height: 70))
            ..addOval(Rect.fromCenter(center: const Offset(380, 190), width: 70, height: 70)),
        ),
      ],
      detailsPainter: (canvas, size) {
        DrawingBuilderHelpers.drawKawaiiFace(
          canvas,
          leftEye: const Offset(215, 255),
          rightEye: const Offset(285, 255),
          mouthCenter: const Offset(250, 280),
          eyeRadius: 8,
        );
      },
      outlinesPainter: (canvas, size) {
        final body = Path()..addOval(Rect.fromCenter(center: const Offset(250, 270), width: 200, height: 150));
        DrawingBuilderHelpers.drawOutline(canvas, body, width: 6.0);
        DrawingBuilderHelpers.drawCircleOutline(canvas, const Offset(120, 190), 35);
        DrawingBuilderHelpers.drawCircleOutline(canvas, const Offset(380, 190), 35);
      },
    ),
  ];
}

List<ColoringDrawing> getSpaceDrawings() {
  return [
    // Level 71: Rocket Ship
    ColoringDrawing(
      id: 'space_rocket',
      title: 'Space Rocket',
      category: DrawingCategory.space,
      levelNumber: 71,
      funFact: 'Rockets must reach speeds of 25,000 miles per hour to break free of Earth’s gravity!',
      regions: [
        ColoringRegion(
          id: 'rock_hull',
          name: 'Rocket Body',
          defaultColor: Colors.white,
          path: Path()
            ..moveTo(250, 90)
            ..cubicTo(200, 160, 190, 310, 190, 350)
            ..lineTo(310, 350)
            ..cubicTo(310, 310, 300, 160, 250, 90)
            ..close(),
        ),
        ColoringRegion(
          id: 'rock_fins',
          name: 'Red Fins',
          defaultColor: const Color(0xFFFF3B30),
          path: Path()
            ..moveTo(190, 290)..lineTo(120, 370)..lineTo(190, 360)..close()
            ..moveTo(310, 290)..lineTo(380, 370)..lineTo(310, 360)..close(),
        ),
        ColoringRegion(
          id: 'rock_flame',
          name: 'Fire Booster',
          defaultColor: const Color(0xFFFF9500),
          path: Path()
            ..moveTo(210, 360)
            ..lineTo(250, 440)
            ..lineTo(290, 360)
            ..close(),
        ),
      ],
      detailsPainter: (canvas, size) {
        // Porthole window
        final bluePaint = Paint()..color = const Color(0xFF3A86FF);
        canvas.drawCircle(const Offset(250, 230), 30, bluePaint);
        DrawingBuilderHelpers.drawKawaiiFace(
          canvas,
          leftEye: const Offset(240, 225),
          rightEye: const Offset(260, 225),
          mouthCenter: const Offset(250, 240),
          eyeRadius: 4,
          drawBlush: false,
        );
      },
      outlinesPainter: (canvas, size) {
        final hull = Path()
          ..moveTo(250, 90)
          ..cubicTo(200, 160, 190, 310, 190, 350)
          ..lineTo(310, 350)
          ..cubicTo(310, 310, 300, 160, 250, 90)
          ..close();
        DrawingBuilderHelpers.drawOutline(canvas, hull, width: 6.0);
        DrawingBuilderHelpers.drawCircleOutline(canvas, const Offset(250, 230), 30);
      },
    ),

    // Level 72: Astronaut
    ColoringDrawing(
      id: 'space_astro',
      title: 'Brave Astronaut',
      category: DrawingCategory.space,
      levelNumber: 72,
      funFact: 'In space, without gravity pulling on spine vertebrae, astronauts can grow up to 2 inches taller!',
      regions: [
        ColoringRegion(
          id: 'astro_suit',
          name: 'Space Suit',
          defaultColor: Colors.white,
          path: Path()..addOval(Rect.fromCenter(center: const Offset(250, 240), width: 220, height: 210)),
        ),
        ColoringRegion(
          id: 'astro_visor',
          name: 'Gold Visor',
          defaultColor: const Color(0xFFFFD166),
          path: Path()..addOval(Rect.fromCenter(center: const Offset(250, 240), width: 140, height: 110)),
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
        final suit = Path()..addOval(Rect.fromCenter(center: const Offset(250, 240), width: 220, height: 210));
        DrawingBuilderHelpers.drawOutline(canvas, suit, width: 6.0);
        final visor = Path()..addOval(Rect.fromCenter(center: const Offset(250, 240), width: 140, height: 110));
        DrawingBuilderHelpers.drawOutline(canvas, visor, width: 5.5);
      },
    ),

    // Level 73: Saturn
    ColoringDrawing(
      id: 'space_saturn',
      title: 'Ringed Saturn',
      category: DrawingCategory.space,
      levelNumber: 73,
      funFact: 'Saturn’s magnificent rings are made mostly of billions of tiny sparkling ice chunks!',
      regions: [
        ColoringRegion(
          id: 'sat_planet',
          name: 'Saturn Planet',
          defaultColor: const Color(0xFFFFD166),
          path: Path()..addOval(Rect.fromCircle(center: const Offset(250, 250), radius: 100)),
        ),
        ColoringRegion(
          id: 'sat_rings',
          name: 'Cosmic Rings',
          defaultColor: const Color(0xFFFF9500),
          path: Path()..addOval(Rect.fromCenter(center: const Offset(250, 250), width: 380, height: 100)),
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
        DrawingBuilderHelpers.drawCircleOutline(canvas, const Offset(250, 250), 100, width: 6.0);
        final rings = Path()..addOval(Rect.fromCenter(center: const Offset(250, 250), width: 380, height: 100));
        DrawingBuilderHelpers.drawOutline(canvas, rings, width: 5.0);
      },
    ),

    // Level 74: UFO
    ColoringDrawing(
      id: 'space_ufo',
      title: 'Flying Saucer',
      category: DrawingCategory.space,
      levelNumber: 74,
      funFact: 'The word UFO stands for Unidentified Flying Object!',
      regions: [
        ColoringRegion(
          id: 'ufo_dome',
          name: 'Glass Dome',
          defaultColor: const Color(0xFF00C7BE),
          path: Path()
            ..moveTo(180, 240)
            ..cubicTo(180, 140, 320, 140, 320, 240)
            ..close(),
        ),
        ColoringRegion(
          id: 'ufo_saucer',
          name: 'Metal Saucer',
          defaultColor: const Color(0xFF9D4EDD),
          path: Path()..addOval(Rect.fromCenter(center: const Offset(250, 270), width: 340, height: 110)),
        ),
      ],
      detailsPainter: (canvas, size) {
        DrawingBuilderHelpers.drawKawaiiFace(
          canvas,
          leftEye: const Offset(230, 200),
          rightEye: const Offset(270, 200),
          mouthCenter: const Offset(250, 220),
          eyeRadius: 6,
        );
      },
      outlinesPainter: (canvas, size) {
        final dome = Path()
          ..moveTo(180, 240)
          ..cubicTo(180, 140, 320, 140, 320, 240)
          ..close();
        DrawingBuilderHelpers.drawOutline(canvas, dome, width: 5.5);
        final saucer = Path()..addOval(Rect.fromCenter(center: const Offset(250, 270), width: 340, height: 110));
        DrawingBuilderHelpers.drawOutline(canvas, saucer, width: 6.0);
      },
    ),

    // Level 75: Moon Lander
    ColoringDrawing(
      id: 'space_lander',
      title: 'Moon Lander',
      category: DrawingCategory.space,
      levelNumber: 75,
      funFact: 'Footprints left on the Moon by Apollo astronauts will stay there for millions of years!',
      regions: [
        ColoringRegion(
          id: 'lan_cabin',
          name: 'Lander Cabin',
          defaultColor: const Color(0xFFFFD166),
          path: Path()..addRect(const Rect.fromLTWH(170, 170, 160, 150)),
        ),
      ],
      detailsPainter: (canvas, size) {
        DrawingBuilderHelpers.drawKawaiiFace(
          canvas,
          leftEye: const Offset(215, 230),
          rightEye: const Offset(285, 230),
          mouthCenter: const Offset(250, 260),
          eyeRadius: 7,
        );
      },
      outlinesPainter: (canvas, size) {
        DrawingBuilderHelpers.drawOutline(canvas, Path()..addRect(const Rect.fromLTWH(170, 170, 160, 150)), width: 6.0);
      },
    ),

    // Level 76: Alien
    ColoringDrawing(
      id: 'space_alien',
      title: 'Friendly Alien',
      category: DrawingCategory.space,
      levelNumber: 76,
      funFact: 'Astronomers use giant radio telescopes to listen for friendly signals from distant galaxies!',
      regions: [
        ColoringRegion(
          id: 'ali_head',
          name: 'Green Alien',
          defaultColor: const Color(0xFF06D6A0),
          path: Path()..addOval(Rect.fromCenter(center: const Offset(250, 250), width: 220, height: 230)),
        ),
      ],
      detailsPainter: (canvas, size) {
        // Cute big alien eyes
        final blackPaint = Paint()..color = AppColors.detailBlack;
        canvas.drawOval(Rect.fromCenter(center: const Offset(200, 230), width: 44, height: 60), blackPaint);
        canvas.drawOval(Rect.fromCenter(center: const Offset(300, 230), width: 44, height: 60), blackPaint);
        final whitePaint = Paint()..color = Colors.white;
        canvas.drawCircle(const Offset(195, 220), 8, whitePaint);
        canvas.drawCircle(const Offset(295, 220), 8, whitePaint);
      },
      outlinesPainter: (canvas, size) {
        final head = Path()..addOval(Rect.fromCenter(center: const Offset(250, 250), width: 220, height: 230));
        DrawingBuilderHelpers.drawOutline(canvas, head, width: 6.0);
      },
    ),

    // Level 77: Shooting Star
    ColoringDrawing(
      id: 'space_star',
      title: 'Shooting Star',
      category: DrawingCategory.space,
      levelNumber: 77,
      funFact: 'Shooting stars aren’t actually stars — they are tiny space rocks burning up bright in the atmosphere!',
      regions: [
        ColoringRegion(
          id: 'star_body',
          name: 'Golden Star',
          defaultColor: const Color(0xFFFFCC00),
          path: DrawingBuilderHelpers.makeStarPath(const Offset(200, 220), 110, 55, 5),
        ),
        ColoringRegion(
          id: 'star_trail',
          name: 'Rainbow Trail',
          defaultColor: const Color(0xFFFF85A1),
          path: Path()
            ..moveTo(230, 260)
            ..lineTo(400, 390)
            ..lineTo(370, 420)
            ..lineTo(190, 280)
            ..close(),
        ),
      ],
      detailsPainter: (canvas, size) {
        DrawingBuilderHelpers.drawKawaiiFace(
          canvas,
          leftEye: const Offset(185, 215),
          rightEye: const Offset(215, 215),
          mouthCenter: const Offset(200, 230),
          eyeRadius: 6,
        );
      },
      outlinesPainter: (canvas, size) {
        final star = DrawingBuilderHelpers.makeStarPath(const Offset(200, 220), 110, 55, 5);
        DrawingBuilderHelpers.drawOutline(canvas, star, width: 6.0);
      },
    ),
  ];
}

List<ColoringDrawing> getFantasyDrawings() {
  return [
    // Level 78: Unicorn
    ColoringDrawing(
      id: 'fan_unicorn',
      title: 'Magic Unicorn',
      category: DrawingCategory.fantasyCharacters,
      levelNumber: 78,
      funFact: 'The unicorn is the official national animal of Scotland!',
      regions: [
        ColoringRegion(
          id: 'uni_head',
          name: 'Unicorn Head',
          defaultColor: Colors.white,
          path: Path()..addOval(Rect.fromCenter(center: const Offset(250, 260), width: 190, height: 180)),
        ),
        ColoringRegion(
          id: 'uni_horn',
          name: 'Spiral Horn',
          defaultColor: const Color(0xFFFFD166),
          path: Path()
            ..moveTo(235, 170)
            ..lineTo(250, 70)
            ..lineTo(265, 170)
            ..close(),
        ),
        ColoringRegion(
          id: 'uni_mane',
          name: 'Rainbow Mane',
          defaultColor: const Color(0xFFFF85A1),
          path: Path()
            ..moveTo(290, 180)
            ..cubicTo(370, 220, 360, 350, 310, 390)
            ..close(),
        ),
      ],
      detailsPainter: (canvas, size) {
        DrawingBuilderHelpers.drawKawaiiFace(
          canvas,
          leftEye: const Offset(215, 250),
          rightEye: const Offset(265, 250),
          mouthCenter: const Offset(235, 280),
          eyeRadius: 8,
        );
      },
      outlinesPainter: (canvas, size) {
        final head = Path()..addOval(Rect.fromCenter(center: const Offset(250, 260), width: 190, height: 180));
        DrawingBuilderHelpers.drawOutline(canvas, head, width: 6.0);
        final horn = Path()
          ..moveTo(235, 170)
          ..lineTo(250, 70)
          ..lineTo(265, 170)
          ..close();
        DrawingBuilderHelpers.drawOutline(canvas, horn, width: 5.5);
      },
    ),

    // Level 79: Baby Dragon
    ColoringDrawing(
      id: 'fan_dragon',
      title: 'Baby Dragon',
      category: DrawingCategory.fantasyCharacters,
      levelNumber: 79,
      funFact: 'In legends, friendly dragons love collecting shiny sparkling crystals and gems!',
      regions: [
        ColoringRegion(
          id: 'drag_body',
          name: 'Dragon Body',
          defaultColor: const Color(0xFF4ECDC4),
          path: Path()..addOval(Rect.fromCenter(center: const Offset(250, 260), width: 220, height: 210)),
        ),
        ColoringRegion(
          id: 'drag_wings',
          name: 'Dragon Wings',
          defaultColor: const Color(0xFFFF85A1),
          path: Path()
            ..moveTo(160, 230)..lineTo(100, 140)..lineTo(160, 170)..close()
            ..moveTo(340, 230)..lineTo(400, 140)..lineTo(340, 170)..close(),
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
        final body = Path()..addOval(Rect.fromCenter(center: const Offset(250, 260), width: 220, height: 210));
        DrawingBuilderHelpers.drawOutline(canvas, body, width: 6.0);
      },
    ),

    // Level 80: Fairy
    ColoringDrawing(
      id: 'fan_fairy',
      title: 'Little Fairy',
      category: DrawingCategory.fantasyCharacters,
      levelNumber: 80,
      funFact: 'Fairies are believed to leave trails of sparkling fairy dust wherever they fly!',
      regions: [
        ColoringRegion(
          id: 'fairy_dress',
          name: 'Fairy Dress',
          defaultColor: const Color(0xFFFF85A1),
          path: Path()
            ..moveTo(230, 230)
            ..lineTo(180, 380)
            ..lineTo(320, 380)
            ..lineTo(270, 230)
            ..close(),
        ),
        ColoringRegion(
          id: 'fairy_wings',
          name: 'Gossamer Wings',
          defaultColor: const Color(0xFFB5E2FA),
          path: Path()
            ..addOval(Rect.fromCenter(center: const Offset(150, 240), width: 90, height: 130))
            ..addOval(Rect.fromCenter(center: const Offset(350, 240), width: 90, height: 130)),
        ),
      ],
      detailsPainter: (canvas, size) {
        DrawingBuilderHelpers.drawKawaiiFace(
          canvas,
          leftEye: const Offset(235, 185),
          rightEye: const Offset(265, 185),
          mouthCenter: const Offset(250, 205),
          eyeRadius: 6,
        );
      },
      outlinesPainter: (canvas, size) {
        final dress = Path()
          ..moveTo(230, 230)
          ..lineTo(180, 380)
          ..lineTo(320, 380)
          ..lineTo(270, 230)
          ..close();
        DrawingBuilderHelpers.drawOutline(canvas, dress, width: 5.5);
      },
    ),

    // Level 81: Mermaid
    ColoringDrawing(
      id: 'fan_mermaid',
      title: 'Sweet Mermaid',
      category: DrawingCategory.fantasyCharacters,
      levelNumber: 81,
      funFact: 'Ancient sailors often mistook gentle manatees for legendary mermaids!',
      regions: [
        ColoringRegion(
          id: 'mer_tail',
          name: 'Emerald Tail',
          defaultColor: const Color(0xFF06D6A0),
          path: Path()
            ..moveTo(220, 270)
            ..cubicTo(210, 360, 300, 380, 250, 440)
            ..cubicTo(280, 360, 270, 320, 280, 270)
            ..close(),
        ),
      ],
      detailsPainter: (canvas, size) {
        DrawingBuilderHelpers.drawKawaiiFace(
          canvas,
          leftEye: const Offset(230, 190),
          rightEye: const Offset(270, 190),
          mouthCenter: const Offset(250, 210),
          eyeRadius: 6,
        );
      },
      outlinesPainter: (canvas, size) {
        final tail = Path()
          ..moveTo(220, 270)
          ..cubicTo(210, 360, 300, 380, 250, 440)
          ..cubicTo(280, 360, 270, 320, 280, 270)
          ..close();
        DrawingBuilderHelpers.drawOutline(canvas, tail, width: 6.0);
      },
    ),

    // Level 82: Wizard Hat
    ColoringDrawing(
      id: 'fan_wizard',
      title: 'Wizard Hat',
      category: DrawingCategory.fantasyCharacters,
      levelNumber: 82,
      funFact: 'Magical wizard hats in stories often store endless scrolls and potions!',
      regions: [
        ColoringRegion(
          id: 'wiz_cone',
          name: 'Magic Cone',
          defaultColor: const Color(0xFF7209B7),
          path: Path()
            ..moveTo(250, 90)
            ..lineTo(140, 330)
            ..lineTo(360, 330)
            ..close(),
        ),
        ColoringRegion(
          id: 'wiz_brim',
          name: 'Hat Brim',
          defaultColor: const Color(0xFF9D4EDD),
          path: Path()..addOval(Rect.fromCenter(center: const Offset(250, 340), width: 320, height: 80)),
        ),
      ],
      detailsPainter: (canvas, size) {
        DrawingBuilderHelpers.drawKawaiiFace(
          canvas,
          leftEye: const Offset(220, 270),
          rightEye: const Offset(280, 270),
          mouthCenter: const Offset(250, 295),
          eyeRadius: 7,
        );
      },
      outlinesPainter: (canvas, size) {
        final cone = Path()
          ..moveTo(250, 90)
          ..lineTo(140, 330)
          ..lineTo(360, 330)
          ..close();
        DrawingBuilderHelpers.drawOutline(canvas, cone, width: 6.0);
        final brim = Path()..addOval(Rect.fromCenter(center: const Offset(250, 340), width: 320, height: 80));
        DrawingBuilderHelpers.drawOutline(canvas, brim, width: 5.5);
      },
    ),

    // Level 83: Castle
    ColoringDrawing(
      id: 'fan_castle',
      title: 'Magic Castle',
      category: DrawingCategory.fantasyCharacters,
      levelNumber: 83,
      funFact: 'Castles were built with thick stone walls to withstand magical dragon breath!',
      regions: [
        ColoringRegion(
          id: 'cas_walls',
          name: 'Stone Walls',
          defaultColor: const Color(0xFFE4F3FF),
          path: Path()..addRect(const Rect.fromLTWH(140, 220, 220, 160)),
        ),
        ColoringRegion(
          id: 'cas_roofs',
          name: 'Royal Roofs',
          defaultColor: const Color(0xFFFF2D55),
          path: Path()
            ..moveTo(140, 220)..lineTo(170, 130)..lineTo(200, 220)..close()
            ..moveTo(300, 220)..lineTo(330, 130)..lineTo(360, 220)..close(),
        ),
      ],
      detailsPainter: (canvas, size) {
        DrawingBuilderHelpers.drawKawaiiFace(
          canvas,
          leftEye: const Offset(220, 270),
          rightEye: const Offset(280, 270),
          mouthCenter: const Offset(250, 300),
          eyeRadius: 7,
        );
      },
      outlinesPainter: (canvas, size) {
        DrawingBuilderHelpers.drawOutline(canvas, Path()..addRect(const Rect.fromLTWH(140, 220, 220, 160)), width: 6.0);
      },
    ),

    // Level 84: Magic Wand
    ColoringDrawing(
      id: 'fan_wand',
      title: 'Star Wand',
      category: DrawingCategory.fantasyCharacters,
      levelNumber: 84,
      funFact: 'A wave of a magic wand in fairytales can turn pumpkins into golden carriages!',
      regions: [
        ColoringRegion(
          id: 'wand_star',
          name: 'Golden Star',
          defaultColor: const Color(0xFFFFCC00),
          path: DrawingBuilderHelpers.makeStarPath(const Offset(250, 160), 90, 45, 5),
        ),
        ColoringRegion(
          id: 'wand_handle',
          name: 'Wand Handle',
          defaultColor: const Color(0xFFFF85A1),
          path: Path()..addRRect(RRect.fromRectAndRadius(const Rect.fromLTWH(240, 220, 20, 190), const Radius.circular(10))),
        ),
      ],
      detailsPainter: (canvas, size) {
        DrawingBuilderHelpers.drawKawaiiFace(
          canvas,
          leftEye: const Offset(235, 155),
          rightEye: const Offset(265, 155),
          mouthCenter: const Offset(250, 175),
          eyeRadius: 6,
        );
      },
      outlinesPainter: (canvas, size) {
        final star = DrawingBuilderHelpers.makeStarPath(const Offset(250, 160), 90, 45, 5);
        DrawingBuilderHelpers.drawOutline(canvas, star, width: 6.0);
        DrawingBuilderHelpers.drawOutline(canvas, Path()..addRRect(RRect.fromRectAndRadius(const Rect.fromLTWH(240, 220, 20, 190), const Radius.circular(10))), width: 5.5);
      },
    ),
  ];
}
