import 'package:flutter/material.dart';
import '../models/category_model.dart';
import '../models/drawing_model.dart';
import '../models/region_model.dart';
import 'drawing_builder_helpers.dart';

List<ColoringDrawing> getNatureDrawings() {
  return [
    // Level 43: Rainbow Cloud
    ColoringDrawing(
      id: 'nature_rainbow',
      title: 'Magic Rainbow',
      category: DrawingCategory.nature,
      levelNumber: 43,
      funFact: 'No two people see the exact same rainbow because everyone has a different angle to the raindrops!',
      regions: [
        ColoringRegion(
          id: 'rain_red',
          name: 'Red Arch',
          defaultColor: const Color(0xFFFF3B30),
          path: Path()
            ..moveTo(80, 320)
            ..cubicTo(80, 100, 420, 100, 420, 320)
            ..lineTo(380, 320)
            ..cubicTo(380, 140, 120, 140, 120, 320)
            ..close(),
        ),
        ColoringRegion(
          id: 'rain_yellow',
          name: 'Yellow Arch',
          defaultColor: const Color(0xFFFFCC00),
          path: Path()
            ..moveTo(120, 320)
            ..cubicTo(120, 140, 380, 140, 380, 320)
            ..lineTo(340, 320)
            ..cubicTo(340, 180, 160, 180, 160, 320)
            ..close(),
        ),
        ColoringRegion(
          id: 'rain_blue',
          name: 'Blue Arch',
          defaultColor: const Color(0xFF007AFF),
          path: Path()
            ..moveTo(160, 320)
            ..cubicTo(160, 180, 340, 180, 340, 320)
            ..lineTo(300, 320)
            ..cubicTo(300, 220, 200, 220, 200, 320)
            ..close(),
        ),
        ColoringRegion(
          id: 'rain_cloud',
          name: 'Fluffy Cloud',
          defaultColor: Colors.white,
          path: Path()
            ..moveTo(80, 340)
            ..cubicTo(50, 280, 150, 250, 180, 280)
            ..cubicTo(200, 240, 290, 250, 290, 300)
            ..cubicTo(330, 290, 360, 350, 320, 390)
            ..lineTo(90, 390)
            ..close(),
        ),
      ],
      detailsPainter: (canvas, size) {
        DrawingBuilderHelpers.drawKawaiiFace(
          canvas,
          leftEye: const Offset(175, 330),
          rightEye: const Offset(235, 330),
          mouthCenter: const Offset(205, 355),
          eyeRadius: 7,
        );
      },
      outlinesPainter: (canvas, size) {
        final cloud = Path()
          ..moveTo(80, 340)
          ..cubicTo(50, 280, 150, 250, 180, 280)
          ..cubicTo(200, 240, 290, 250, 290, 300)
          ..cubicTo(330, 290, 360, 350, 320, 390)
          ..lineTo(90, 390)
          ..close();
        DrawingBuilderHelpers.drawOutline(canvas, cloud, width: 6.0);
      },
    ),

    // Level 44: Smiling Sun
    ColoringDrawing(
      id: 'nature_sun',
      title: 'Happy Sunshine',
      category: DrawingCategory.nature,
      levelNumber: 44,
      funFact: 'Sunlight travels 93 million miles in just about 8 minutes to reach Earth!',
      regions: [
        ColoringRegion(
          id: 'sun_disk',
          name: 'Sun Disk',
          defaultColor: const Color(0xFFFFCC00),
          path: Path()..addOval(Rect.fromCircle(center: const Offset(250, 250), radius: 100)),
        ),
        ColoringRegion(
          id: 'sun_rays',
          name: 'Sun Rays',
          defaultColor: const Color(0xFFFF9500),
          path: DrawingBuilderHelpers.makeStarPath(const Offset(250, 250), 160, 115, 8),
        ),
      ],
      detailsPainter: (canvas, size) {
        DrawingBuilderHelpers.drawKawaiiFace(
          canvas,
          leftEye: const Offset(215, 235),
          rightEye: const Offset(285, 235),
          mouthCenter: const Offset(250, 265),
          eyeRadius: 9,
        );
      },
      outlinesPainter: (canvas, size) {
        final rays = DrawingBuilderHelpers.makeStarPath(const Offset(250, 250), 160, 115, 8);
        DrawingBuilderHelpers.drawOutline(canvas, rays, width: 6.0);
        DrawingBuilderHelpers.drawCircleOutline(canvas, const Offset(250, 250), 100, width: 5.5);
      },
    ),

    // Level 45: Magic Tree
    ColoringDrawing(
      id: 'nature_tree',
      title: 'Green Tree',
      category: DrawingCategory.nature,
      levelNumber: 45,
      funFact: 'A single mature leafy tree can produce a day’s supply of oxygen for up to 10 people!',
      regions: [
        ColoringRegion(
          id: 'tree_canopy',
          name: 'Tree Canopy',
          defaultColor: const Color(0xFF34C759),
          path: Path()
            ..moveTo(150, 280)
            ..cubicTo(90, 220, 110, 120, 190, 120)
            ..cubicTo(200, 60, 300, 60, 310, 120)
            ..cubicTo(390, 120, 410, 220, 350, 280)
            ..cubicTo(300, 320, 200, 320, 150, 280)
            ..close(),
        ),
        ColoringRegion(
          id: 'tree_trunk',
          name: 'Brown Trunk',
          defaultColor: const Color(0xFF6F4E37),
          path: Path()
            ..moveTo(225, 290)
            ..lineTo(210, 430)
            ..lineTo(290, 430)
            ..lineTo(275, 290)
            ..close(),
        ),
      ],
      detailsPainter: (canvas, size) {
        DrawingBuilderHelpers.drawKawaiiFace(
          canvas,
          leftEye: const Offset(215, 210),
          rightEye: const Offset(285, 210),
          mouthCenter: const Offset(250, 235),
          eyeRadius: 8,
        );
      },
      outlinesPainter: (canvas, size) {
        final canopy = Path()
          ..moveTo(150, 280)
          ..cubicTo(90, 220, 110, 120, 190, 120)
          ..cubicTo(200, 60, 300, 60, 310, 120)
          ..cubicTo(390, 120, 410, 220, 350, 280)
          ..cubicTo(300, 320, 200, 320, 150, 280)
          ..close();
        DrawingBuilderHelpers.drawOutline(canvas, canopy, width: 6.0);
        final trunk = Path()
          ..moveTo(225, 290)
          ..lineTo(210, 430)
          ..lineTo(290, 430)
          ..lineTo(275, 290)
          ..close();
        DrawingBuilderHelpers.drawOutline(canvas, trunk, width: 5.5);
      },
    ),

    // Level 46: Mountain
    ColoringDrawing(
      id: 'nature_mountain',
      title: 'Snowy Mountain',
      category: DrawingCategory.nature,
      levelNumber: 46,
      funFact: 'Mount Everest is growing about 4 millimeters higher each year!',
      regions: [
        ColoringRegion(
          id: 'mount_base',
          name: 'Rocky Mountain',
          defaultColor: const Color(0xFF118AB2),
          path: Path()
            ..moveTo(80, 420)
            ..lineTo(250, 130)
            ..lineTo(420, 420)
            ..close(),
        ),
        ColoringRegion(
          id: 'mount_snow',
          name: 'Snow Cap',
          defaultColor: Colors.white,
          path: Path()
            ..moveTo(250, 130)
            ..lineTo(205, 210)
            ..lineTo(230, 225)
            ..lineTo(250, 205)
            ..lineTo(270, 225)
            ..lineTo(295, 210)
            ..close(),
        ),
      ],
      detailsPainter: (canvas, size) {
        DrawingBuilderHelpers.drawKawaiiFace(
          canvas,
          leftEye: const Offset(215, 280),
          rightEye: const Offset(285, 280),
          mouthCenter: const Offset(250, 310),
          eyeRadius: 8,
        );
      },
      outlinesPainter: (canvas, size) {
        final base = Path()
          ..moveTo(80, 420)
          ..lineTo(250, 130)
          ..lineTo(420, 420)
          ..close();
        DrawingBuilderHelpers.drawOutline(canvas, base, width: 6.0);
      },
    ),

    // Level 47: Moon & Stars
    ColoringDrawing(
      id: 'nature_moon',
      title: 'Crescent Moon',
      category: DrawingCategory.nature,
      levelNumber: 47,
      funFact: 'The moon has moonquakes just like Earth has earthquakes!',
      regions: [
        ColoringRegion(
          id: 'moon_crescent',
          name: 'Golden Moon',
          defaultColor: const Color(0xFFFFCC00),
          path: Path()
            ..moveTo(250, 100)
            ..cubicTo(350, 120, 380, 320, 230, 380)
            ..cubicTo(310, 310, 300, 170, 250, 100)
            ..close(),
        ),
      ],
      detailsPainter: (canvas, size) {
        DrawingBuilderHelpers.drawKawaiiFace(
          canvas,
          leftEye: const Offset(280, 220),
          rightEye: const Offset(310, 245),
          mouthCenter: const Offset(295, 265),
          eyeRadius: 6,
        );
      },
      outlinesPainter: (canvas, size) {
        final crescent = Path()
          ..moveTo(250, 100)
          ..cubicTo(350, 120, 380, 320, 230, 380)
          ..cubicTo(310, 310, 300, 170, 250, 100)
          ..close();
        DrawingBuilderHelpers.drawOutline(canvas, crescent, width: 6.0);
      },
    ),

    // Level 48: Waterfall
    ColoringDrawing(
      id: 'nature_waterfall',
      title: 'Magic Waterfall',
      category: DrawingCategory.nature,
      levelNumber: 48,
      funFact: 'Angel Falls in Venezuela is the world’s tallest uninterrupted waterfall at 3,212 feet!',
      regions: [
        ColoringRegion(
          id: 'wf_stream',
          name: 'Blue Cascade',
          defaultColor: const Color(0xFF007AFF),
          path: Path()
            ..moveTo(190, 120)
            ..lineTo(310, 120)
            ..lineTo(340, 420)
            ..lineTo(160, 420)
            ..close(),
        ),
      ],
      detailsPainter: (canvas, size) {
        DrawingBuilderHelpers.drawKawaiiFace(
          canvas,
          leftEye: const Offset(220, 250),
          rightEye: const Offset(280, 250),
          mouthCenter: const Offset(250, 275),
          eyeRadius: 7,
        );
      },
      outlinesPainter: (canvas, size) {
        final stream = Path()
          ..moveTo(190, 120)
          ..lineTo(310, 120)
          ..lineTo(340, 420)
          ..lineTo(160, 420)
          ..close();
        DrawingBuilderHelpers.drawOutline(canvas, stream, width: 6.0);
      },
    ),

    // Level 49: Island
    ColoringDrawing(
      id: 'nature_island',
      title: 'Tropical Island',
      category: DrawingCategory.nature,
      levelNumber: 49,
      funFact: 'Greenland is the largest island in the world that is not a continent!',
      regions: [
        ColoringRegion(
          id: 'isl_sand',
          name: 'Sandy Shore',
          defaultColor: const Color(0xFFFFD166),
          path: Path()
            ..moveTo(90, 360)
            ..cubicTo(120, 300, 380, 300, 410, 360)
            ..cubicTo(380, 420, 120, 420, 90, 360)
            ..close(),
        ),
        ColoringRegion(
          id: 'isl_palm',
          name: 'Palm Fronds',
          defaultColor: const Color(0xFF34C759),
          path: Path()
            ..moveTo(250, 180)
            ..cubicTo(200, 130, 140, 160, 120, 190)
            ..cubicTo(180, 180, 220, 210, 250, 200)
            ..cubicTo(280, 210, 320, 180, 380, 190)
            ..cubicTo(360, 160, 300, 130, 250, 180)
            ..close(),
        ),
      ],
      detailsPainter: (canvas, size) {
        DrawingBuilderHelpers.drawKawaiiFace(
          canvas,
          leftEye: const Offset(215, 345),
          rightEye: const Offset(285, 345),
          mouthCenter: const Offset(250, 365),
          eyeRadius: 7,
        );
      },
      outlinesPainter: (canvas, size) {
        final sand = Path()
          ..moveTo(90, 360)
          ..cubicTo(120, 300, 380, 300, 410, 360)
          ..cubicTo(380, 420, 120, 420, 90, 360)
          ..close();
        DrawingBuilderHelpers.drawOutline(canvas, sand, width: 6.0);
      },
    ),
  ];
}

List<ColoringDrawing> getVehicleDrawings() {
  return [
    // Level 50: Cute Car (Featured in prompt!)
    ColoringDrawing(
      id: 'veh_car',
      title: 'Beep Beep Car',
      category: DrawingCategory.vehicles,
      levelNumber: 50,
      funFact: 'An average car has around 30,000 different individual parts!',
      regions: [
        ColoringRegion(
          id: 'car_body',
          name: 'Car Chassis',
          defaultColor: const Color(0xFFFF3B30),
          path: Path()
            ..moveTo(90, 320)
            ..lineTo(140, 320)
            ..cubicTo(140, 240, 360, 240, 360, 320)
            ..lineTo(410, 320)
            ..lineTo(410, 370)
            ..lineTo(90, 370)
            ..close(),
        ),
        ColoringRegion(
          id: 'car_cabin',
          name: 'Car Roof',
          defaultColor: const Color(0xFF3A86FF),
          path: Path()
            ..moveTo(160, 240)
            ..lineTo(200, 160)
            ..lineTo(300, 160)
            ..lineTo(340, 240)
            ..close(),
        ),
        ColoringRegion(
          id: 'car_wheels',
          name: 'Black Wheels',
          defaultColor: const Color(0xFF1C1C1E),
          path: Path()
            ..addOval(Rect.fromCircle(center: const Offset(160, 370), radius: 36))
            ..addOval(Rect.fromCircle(center: const Offset(340, 370), radius: 36)),
        ),
      ],
      detailsPainter: (canvas, size) {
        // Headlights & Window
        final lightPaint = Paint()..color = const Color(0xFFFFCC00);
        canvas.drawCircle(const Offset(405, 335), 10, lightPaint);
        // Kawaii Face on Car Door
        DrawingBuilderHelpers.drawKawaiiFace(
          canvas,
          leftEye: const Offset(220, 285),
          rightEye: const Offset(280, 285),
          mouthCenter: const Offset(250, 310),
          eyeRadius: 7,
        );
      },
      outlinesPainter: (canvas, size) {
        final body = Path()
          ..moveTo(90, 320)
          ..lineTo(140, 320)
          ..cubicTo(140, 240, 360, 240, 360, 320)
          ..lineTo(410, 320)
          ..lineTo(410, 370)
          ..lineTo(90, 370)
          ..close();
        DrawingBuilderHelpers.drawOutline(canvas, body, width: 6.0);
        final cabin = Path()
          ..moveTo(160, 240)
          ..lineTo(200, 160)
          ..lineTo(300, 160)
          ..lineTo(340, 240)
          ..close();
        DrawingBuilderHelpers.drawOutline(canvas, cabin, width: 5.5);
        DrawingBuilderHelpers.drawCircleOutline(canvas, const Offset(160, 370), 36);
        DrawingBuilderHelpers.drawCircleOutline(canvas, const Offset(340, 370), 36);
      },
    ),

    // Level 51: School Bus
    ColoringDrawing(
      id: 'veh_bus',
      title: 'School Bus',
      category: DrawingCategory.vehicles,
      levelNumber: 51,
      funFact: 'School buses are painted National School Bus Glossy Yellow because humans see yellow faster than any other color!',
      regions: [
        ColoringRegion(
          id: 'bus_body',
          name: 'Yellow Bus',
          defaultColor: const Color(0xFFFFCC00),
          path: Path()..addRRect(RRect.fromRectAndRadius(const Rect.fromLTWH(80, 180, 340, 170), const Radius.circular(24))),
        ),
        ColoringRegion(
          id: 'bus_wheels',
          name: 'Wheels',
          defaultColor: const Color(0xFF1C1C1E),
          path: Path()
            ..addOval(Rect.fromCircle(center: const Offset(150, 360), radius: 34))
            ..addOval(Rect.fromCircle(center: const Offset(350, 360), radius: 34)),
        ),
      ],
      detailsPainter: (canvas, size) {
        // Bus windows
        final winPaint = Paint()..color = const Color(0xFFB5E2FA);
        for (double x = 110; x <= 340; x += 60) {
          canvas.drawRRect(RRect.fromRectAndRadius(Rect.fromLTWH(x, 210, 44, 40), const Radius.circular(8)), winPaint);
        }
      },
      outlinesPainter: (canvas, size) {
        final body = Path()..addRRect(RRect.fromRectAndRadius(const Rect.fromLTWH(80, 180, 340, 170), const Radius.circular(24)));
        DrawingBuilderHelpers.drawOutline(canvas, body, width: 6.0);
        DrawingBuilderHelpers.drawCircleOutline(canvas, const Offset(150, 360), 34);
        DrawingBuilderHelpers.drawCircleOutline(canvas, const Offset(350, 360), 34);
      },
    ),

    // Level 52: Train
    ColoringDrawing(
      id: 'veh_train',
      title: 'Choo-Choo Train',
      category: DrawingCategory.vehicles,
      levelNumber: 52,
      funFact: 'Early steam trains used water and burning coal to generate power!',
      regions: [
        ColoringRegion(
          id: 'tr_boiler',
          name: 'Steam Engine',
          defaultColor: const Color(0xFFFF3B30),
          path: Path()
            ..addRect(const Rect.fromLTWH(100, 220, 200, 120))
            ..addRect(const Rect.fromLTWH(300, 160, 100, 180)),
        ),
      ],
      detailsPainter: (canvas, size) {
        DrawingBuilderHelpers.drawKawaiiFace(
          canvas,
          leftEye: const Offset(180, 260),
          rightEye: const Offset(240, 260),
          mouthCenter: const Offset(210, 285),
          eyeRadius: 7,
        );
      },
      outlinesPainter: (canvas, size) {
        DrawingBuilderHelpers.drawOutline(canvas, Path()..addRect(const Rect.fromLTWH(100, 220, 200, 120)), width: 6.0);
        DrawingBuilderHelpers.drawOutline(canvas, Path()..addRect(const Rect.fromLTWH(300, 160, 100, 180)), width: 6.0);
      },
    ),

    // Level 53: Airplane
    ColoringDrawing(
      id: 'veh_plane',
      title: 'Soaring Airplane',
      category: DrawingCategory.vehicles,
      levelNumber: 53,
      funFact: 'Airplanes stay up in the sky because their curved wings create aerodynamic lift!',
      regions: [
        ColoringRegion(
          id: 'plane_hull',
          name: 'Airplane Fuselage',
          defaultColor: Colors.white,
          path: Path()..addOval(Rect.fromCenter(center: const Offset(250, 250), width: 340, height: 90)),
        ),
        ColoringRegion(
          id: 'plane_wings',
          name: 'Wings & Tail',
          defaultColor: const Color(0xFF3A86FF),
          path: Path()
            ..moveTo(220, 250)..lineTo(170, 120)..lineTo(270, 120)..close()
            ..moveTo(220, 250)..lineTo(170, 380)..lineTo(270, 380)..close(),
        ),
      ],
      detailsPainter: (canvas, size) {
        DrawingBuilderHelpers.drawKawaiiFace(
          canvas,
          leftEye: const Offset(360, 240),
          rightEye: const Offset(390, 240),
          mouthCenter: const Offset(375, 260),
          eyeRadius: 6,
        );
      },
      outlinesPainter: (canvas, size) {
        final hull = Path()..addOval(Rect.fromCenter(center: const Offset(250, 250), width: 340, height: 90));
        DrawingBuilderHelpers.drawOutline(canvas, hull, width: 6.0);
      },
    ),

    // Level 54: Helicopter
    ColoringDrawing(
      id: 'veh_heli',
      title: 'Whirly Helicopter',
      category: DrawingCategory.vehicles,
      levelNumber: 54,
      funFact: 'Helicopters can fly forward, backward, sideways, and even hover stationary in midair!',
      regions: [
        ColoringRegion(
          id: 'heli_cabin',
          name: 'Cockpit Body',
          defaultColor: const Color(0xFFFF9500),
          path: Path()..addOval(Rect.fromCenter(center: const Offset(210, 270), width: 220, height: 160)),
        ),
        ColoringRegion(
          id: 'heli_tail',
          name: 'Tail Boom',
          defaultColor: const Color(0xFFFF9500),
          path: Path()..addRect(const Rect.fromLTWH(300, 250, 120, 30)),
        ),
      ],
      detailsPainter: (canvas, size) {
        DrawingBuilderHelpers.drawKawaiiFace(
          canvas,
          leftEye: const Offset(150, 250),
          rightEye: const Offset(210, 250),
          mouthCenter: const Offset(180, 280),
          eyeRadius: 8,
        );
      },
      outlinesPainter: (canvas, size) {
        final cabin = Path()..addOval(Rect.fromCenter(center: const Offset(210, 270), width: 220, height: 160));
        DrawingBuilderHelpers.drawOutline(canvas, cabin, width: 6.0);
      },
    ),

    // Level 55: Submarine
    ColoringDrawing(
      id: 'veh_sub',
      title: 'Yellow Submarine',
      category: DrawingCategory.vehicles,
      levelNumber: 55,
      funFact: 'Deep-sea submarines can dive thousands of feet down where sunlight never reaches!',
      regions: [
        ColoringRegion(
          id: 'sub_hull',
          name: 'Submarine Hull',
          defaultColor: const Color(0xFFFFCC00),
          path: Path()..addOval(Rect.fromCenter(center: const Offset(250, 270), width: 300, height: 170)),
        ),
        ColoringRegion(
          id: 'sub_tower',
          name: 'Periscope Tower',
          defaultColor: const Color(0xFFFF9500),
          path: Path()..addRRect(RRect.fromRectAndRadius(const Rect.fromLTWH(210, 130, 80, 70), const Radius.circular(16))),
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
        final hull = Path()..addOval(Rect.fromCenter(center: const Offset(250, 270), width: 300, height: 170));
        DrawingBuilderHelpers.drawOutline(canvas, hull, width: 6.0);
      },
    ),

    // Level 56: Boat
    ColoringDrawing(
      id: 'veh_boat',
      title: 'Sailboat',
      category: DrawingCategory.vehicles,
      levelNumber: 56,
      funFact: 'Sailboats harness the free natural power of the wind to glide smoothly across waves!',
      regions: [
        ColoringRegion(
          id: 'boat_hull',
          name: 'Boat Hull',
          defaultColor: const Color(0xFF6F4E37),
          path: Path()
            ..moveTo(100, 310)
            ..lineTo(400, 310)
            ..lineTo(340, 390)
            ..lineTo(160, 390)
            ..close(),
        ),
        ColoringRegion(
          id: 'boat_sail',
          name: 'Big Sail',
          defaultColor: const Color(0xFFFF2D55),
          path: Path()
            ..moveTo(240, 110)
            ..lineTo(370, 290)
            ..lineTo(240, 290)
            ..close(),
        ),
      ],
      detailsPainter: (canvas, size) {
        DrawingBuilderHelpers.drawKawaiiFace(
          canvas,
          leftEye: const Offset(215, 340),
          rightEye: const Offset(285, 340),
          mouthCenter: const Offset(250, 360),
          eyeRadius: 7,
        );
      },
      outlinesPainter: (canvas, size) {
        final hull = Path()
          ..moveTo(100, 310)
          ..lineTo(400, 310)
          ..lineTo(340, 390)
          ..lineTo(160, 390)
          ..close();
        DrawingBuilderHelpers.drawOutline(canvas, hull, width: 6.0);
        final sail = Path()
          ..moveTo(240, 110)
          ..lineTo(370, 290)
          ..lineTo(240, 290)
          ..close();
        DrawingBuilderHelpers.drawOutline(canvas, sail, width: 5.5);
      },
    ),
  ];
}

List<ColoringDrawing> getDinosaurDrawings() {
  return [
    // Level 57: Baby T-Rex
    ColoringDrawing(
      id: 'dino_trex',
      title: 'Baby T-Rex',
      category: DrawingCategory.dinosaurs,
      levelNumber: 57,
      funFact: 'Tyrannosaurus Rex had teeth as long as large bananas!',
      regions: [
        ColoringRegion(
          id: 'trex_body',
          name: 'Green Dino Body',
          defaultColor: const Color(0xFF34C759),
          path: Path()
            ..moveTo(160, 160)
            ..cubicTo(260, 110, 360, 150, 360, 250)
            ..cubicTo(370, 350, 340, 420, 260, 430)
            ..cubicTo(180, 420, 140, 320, 160, 160)
            ..close(),
        ),
        ColoringRegion(
          id: 'trex_belly',
          name: 'Yellow Belly',
          defaultColor: const Color(0xFFFFCC00),
          path: Path()..addOval(Rect.fromCenter(center: const Offset(280, 330), width: 100, height: 140)),
        ),
      ],
      detailsPainter: (canvas, size) {
        DrawingBuilderHelpers.drawKawaiiFace(
          canvas,
          leftEye: const Offset(215, 200),
          rightEye: const Offset(275, 200),
          mouthCenter: const Offset(245, 235),
          eyeRadius: 9,
        );
      },
      outlinesPainter: (canvas, size) {
        final body = Path()
          ..moveTo(160, 160)
          ..cubicTo(260, 110, 360, 150, 360, 250)
          ..cubicTo(370, 350, 340, 420, 260, 430)
          ..cubicTo(180, 420, 140, 320, 160, 160)
          ..close();
        DrawingBuilderHelpers.drawOutline(canvas, body, width: 6.0);
      },
    ),

    // Level 58: Brachiosaurus
    ColoringDrawing(
      id: 'dino_brachio',
      title: 'Long-Neck Dino',
      category: DrawingCategory.dinosaurs,
      levelNumber: 58,
      funFact: 'Brachiosaurus weighed around 40 tons — as heavy as 8 school buses!',
      regions: [
        ColoringRegion(
          id: 'brach_body',
          name: 'Dino Body',
          defaultColor: const Color(0xFF00C7BE),
          path: Path()
            ..moveTo(140, 120)
            ..cubicTo(200, 120, 220, 260, 280, 300)
            ..cubicTo(380, 310, 400, 410, 340, 430)
            ..lineTo(180, 430)
            ..cubicTo(120, 410, 120, 260, 140, 120)
            ..close(),
        ),
      ],
      detailsPainter: (canvas, size) {
        DrawingBuilderHelpers.drawKawaiiFace(
          canvas,
          leftEye: const Offset(155, 140),
          rightEye: const Offset(195, 140),
          mouthCenter: const Offset(175, 165),
          eyeRadius: 7,
        );
      },
      outlinesPainter: (canvas, size) {
        final body = Path()
          ..moveTo(140, 120)
          ..cubicTo(200, 120, 220, 260, 280, 300)
          ..cubicTo(380, 310, 400, 410, 340, 430)
          ..lineTo(180, 430)
          ..cubicTo(120, 410, 120, 260, 140, 120)
          ..close();
        DrawingBuilderHelpers.drawOutline(canvas, body, width: 6.0);
      },
    ),

    // Level 59: Triceratops
    ColoringDrawing(
      id: 'dino_tri',
      title: 'Three-Horn Dino',
      category: DrawingCategory.dinosaurs,
      levelNumber: 59,
      funFact: 'Triceratops had up to 800 teeth that constantly replaced themselves!',
      regions: [
        ColoringRegion(
          id: 'tri_frill',
          name: 'Neck Shield',
          defaultColor: const Color(0xFFFF9500),
          path: Path()..addOval(Rect.fromCenter(center: const Offset(250, 190), width: 240, height: 160)),
        ),
        ColoringRegion(
          id: 'tri_face',
          name: 'Face',
          defaultColor: const Color(0xFFFFD166),
          path: Path()..addOval(Rect.fromCenter(center: const Offset(250, 240), width: 160, height: 150)),
        ),
      ],
      detailsPainter: (canvas, size) {
        DrawingBuilderHelpers.drawKawaiiFace(
          canvas,
          leftEye: const Offset(215, 230),
          rightEye: const Offset(285, 230),
          mouthCenter: const Offset(250, 265),
          eyeRadius: 8,
        );
      },
      outlinesPainter: (canvas, size) {
        final frill = Path()..addOval(Rect.fromCenter(center: const Offset(250, 190), width: 240, height: 160));
        DrawingBuilderHelpers.drawOutline(canvas, frill, width: 6.0);
        final face = Path()..addOval(Rect.fromCenter(center: const Offset(250, 240), width: 160, height: 150));
        DrawingBuilderHelpers.drawOutline(canvas, face, width: 5.5);
      },
    ),

    // Level 60: Stegosaurus
    ColoringDrawing(
      id: 'dino_stego',
      title: 'Plated Stegosaurus',
      category: DrawingCategory.dinosaurs,
      levelNumber: 60,
      funFact: 'Despite its huge body, a Stegosaurus had a brain the size of a walnut!',
      regions: [
        ColoringRegion(
          id: 'stego_body',
          name: 'Stego Body',
          defaultColor: const Color(0xFF34C759),
          path: Path()..addOval(Rect.fromCenter(center: const Offset(250, 290), width: 260, height: 180)),
        ),
        ColoringRegion(
          id: 'stego_plates',
          name: 'Back Plates',
          defaultColor: const Color(0xFFFF9500),
          path: Path()
            ..moveTo(160, 220)..lineTo(180, 150)..lineTo(200, 220)..close()
            ..moveTo(230, 200)..lineTo(250, 130)..lineTo(270, 200)..close()
            ..moveTo(300, 220)..lineTo(320, 150)..lineTo(340, 220)..close(),
        ),
      ],
      detailsPainter: (canvas, size) {
        DrawingBuilderHelpers.drawKawaiiFace(
          canvas,
          leftEye: const Offset(170, 270),
          rightEye: const Offset(210, 270),
          mouthCenter: const Offset(185, 295),
          eyeRadius: 7,
        );
      },
      outlinesPainter: (canvas, size) {
        final body = Path()..addOval(Rect.fromCenter(center: const Offset(250, 290), width: 260, height: 180));
        DrawingBuilderHelpers.drawOutline(canvas, body, width: 6.0);
      },
    ),

    // Level 61: Pterodactyl
    ColoringDrawing(
      id: 'dino_ptero',
      title: 'Flying Pterodactyl',
      category: DrawingCategory.dinosaurs,
      levelNumber: 61,
      funFact: 'Pterosaurs were the very first reptiles ever able to fly with powered flight!',
      regions: [
        ColoringRegion(
          id: 'ptero_wings',
          name: 'Wide Wings',
          defaultColor: const Color(0xFF8338EC),
          path: Path()
            ..moveTo(80, 200)
            ..cubicTo(160, 130, 240, 240, 250, 250)
            ..cubicTo(260, 240, 340, 130, 420, 200)
            ..cubicTo(360, 280, 280, 310, 250, 340)
            ..cubicTo(220, 310, 140, 280, 80, 200)
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
        final wings = Path()
          ..moveTo(80, 200)
          ..cubicTo(160, 130, 240, 240, 250, 250)
          ..cubicTo(260, 240, 340, 130, 420, 200)
          ..cubicTo(360, 280, 280, 310, 250, 340)
          ..cubicTo(220, 310, 140, 280, 80, 200)
          ..close();
        DrawingBuilderHelpers.drawOutline(canvas, wings, width: 6.0);
      },
    ),

    // Level 62: Spinosaurus
    ColoringDrawing(
      id: 'dino_spino',
      title: 'Sail Spinosaurus',
      category: DrawingCategory.dinosaurs,
      levelNumber: 62,
      funFact: 'Spinosaurus was bigger than T-Rex and loved swimming after huge prehistoric fish!',
      regions: [
        ColoringRegion(
          id: 'spino_sail',
          name: 'Big Sail',
          defaultColor: const Color(0xFFFF2D55),
          path: Path()
            ..moveTo(170, 240)
            ..cubicTo(190, 120, 310, 120, 330, 240)
            ..close(),
        ),
        ColoringRegion(
          id: 'spino_body',
          name: 'Body',
          defaultColor: const Color(0xFF34C759),
          path: Path()..addOval(Rect.fromCenter(center: const Offset(250, 280), width: 240, height: 160)),
        ),
      ],
      detailsPainter: (canvas, size) {
        DrawingBuilderHelpers.drawKawaiiFace(
          canvas,
          leftEye: const Offset(170, 260),
          rightEye: const Offset(210, 260),
          mouthCenter: const Offset(185, 285),
          eyeRadius: 7,
        );
      },
      outlinesPainter: (canvas, size) {
        final sail = Path()
          ..moveTo(170, 240)
          ..cubicTo(190, 120, 310, 120, 330, 240)
          ..close();
        DrawingBuilderHelpers.drawOutline(canvas, sail, width: 6.0);
        final body = Path()..addOval(Rect.fromCenter(center: const Offset(250, 280), width: 240, height: 160));
        DrawingBuilderHelpers.drawOutline(canvas, body, width: 6.0);
      },
    ),

    // Level 63: Ankylosaurus
    ColoringDrawing(
      id: 'dino_anky',
      title: 'Shield Dinosaur',
      category: DrawingCategory.dinosaurs,
      levelNumber: 63,
      funFact: 'Ankylosaurus had a giant bony club at the end of its tail to defend against predators!',
      regions: [
        ColoringRegion(
          id: 'anky_shell',
          name: 'Armored Shell',
          defaultColor: const Color(0xFFA2845E),
          path: Path()..addOval(Rect.fromCenter(center: const Offset(250, 270), width: 260, height: 180)),
        ),
      ],
      detailsPainter: (canvas, size) {
        DrawingBuilderHelpers.drawKawaiiFace(
          canvas,
          leftEye: const Offset(160, 260),
          rightEye: const Offset(200, 260),
          mouthCenter: const Offset(175, 285),
          eyeRadius: 7,
        );
      },
      outlinesPainter: (canvas, size) {
        final shell = Path()..addOval(Rect.fromCenter(center: const Offset(250, 270), width: 260, height: 180));
        DrawingBuilderHelpers.drawOutline(canvas, shell, width: 6.0);
      },
    ),
  ];
}
