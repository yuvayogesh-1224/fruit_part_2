import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kids_coloring_game/coloring_engine/coloring_engine.dart';
import 'package:kids_coloring_game/data/drawings_library.dart';
import 'package:kids_coloring_game/models/category_model.dart';
import 'package:kids_coloring_game/models/stroke_model.dart';

void main() {
  group('Drawings Library & 100+ Drawings Requirement Tests', () {
    test('Library has at least 100 unique drawings', () {
      final allDrawings = DrawingsLibrary.getAllDrawings();
      expect(allDrawings.length, greaterThanOrEqualTo(100));
      expect(allDrawings.length, equals(105)); // 15 categories * 7 drawings
    });

    test('All 15 Categories exist and each has at least 7 unique drawings', () {
      for (final cat in DrawingCategory.values) {
        final catDrawings = DrawingsLibrary.getDrawingsByCategory(cat);
        expect(catDrawings.length, greaterThanOrEqualTo(7));
      }
    });

    test('Every drawing has valid regions, title, level, and outline painter', () {
      for (final drawing in DrawingsLibrary.getAllDrawings()) {
        expect(drawing.id.isNotEmpty, isTrue);
        expect(drawing.title.isNotEmpty, isTrue);
        expect(drawing.levelNumber, greaterThanOrEqualTo(1));
        expect(drawing.regions.isNotEmpty, isTrue);
        expect(drawing.outlinesPainter, isNotNull);

        // Every region has a non-empty boundary path
        for (final r in drawing.regions) {
          expect(r.id.isNotEmpty, isTrue);
          expect(r.name.isNotEmpty, isTrue);
          expect(r.path.getBounds().isEmpty, isFalse);
        }
      }
    });
  });

  group('Universal Coloring Engine Tests — Strict Region Boundaries', () {
    test('Test 1: Carrot Body vs Leaves isolation', () {
      final carrot = DrawingsLibrary.getDrawingById('veg_carrot')!;
      final engine = ColoringEngine(initialDrawing: carrot);

      // Point inside carrot body (center ~ 250, 260)
      const carrotBodyPoint = Offset(250, 260);
      final bodyRegion = engine.regionMaskManager.findRegionAt(carrotBodyPoint);
      expect(bodyRegion, isNotNull);
      expect(bodyRegion!.id, equals('carrot_body'));

      // Point inside carrot leaves (center ~ 250, 100)
      const carrotLeafPoint = Offset(250, 100);
      final leafRegion = engine.regionMaskManager.findRegionAt(carrotLeafPoint);
      expect(leafRegion, isNotNull);
      expect(leafRegion!.id, equals('carrot_leaves'));

      // Point outside drawing (e.g. background 10, 10)
      const outsidePoint = Offset(10, 10);
      final outsideRegion = engine.regionMaskManager.findRegionAt(outsidePoint);
      expect(outsideRegion, isNull); // Never colors outside!
    });

    test('Test 2: Drawing stroke in Carrot Body never touches Leaf region', () {
      final carrot = DrawingsLibrary.getDrawingById('veg_carrot')!;
      final engine = ColoringEngine(initialDrawing: carrot);

      // Select orange color
      engine.brushController.setColor(const Color(0xFFFF9500));

      // Draw inside body
      engine.onTouchDown(const Offset(250, 260));
      engine.onTouchMove(const Offset(255, 270));
      // Drag outside into leaf area or background
      engine.onTouchMove(const Offset(250, 50));
      engine.onTouchUp();

      final bodyRegion = engine.drawing.regions.firstWhere((r) => r.id == 'carrot_body');
      final leafRegion = engine.drawing.regions.firstWhere((r) => r.id == 'carrot_leaves');

      // The stroke is stored only inside the active region (bodyRegion)
      expect(bodyRegion.strokes.length, equals(1));
      expect(leafRegion.strokes.isEmpty, isTrue);
      expect(leafRegion.fillColor, isNull);
    });

    test('Test 3: Fill Tool fills only target region without leaking', () {
      final apple = DrawingsLibrary.getDrawingById('fruit_apple')!;
      final engine = ColoringEngine(initialDrawing: apple);

      engine.brushController.setFillTool(true);
      engine.brushController.setColor(const Color(0xFFFF3B30));

      // Tap apple body
      engine.onTouchDown(const Offset(250, 260));

      final bodyRegion = engine.drawing.regions.firstWhere((r) => r.id == 'apple_body');
      final stemRegion = engine.drawing.regions.firstWhere((r) => r.id == 'apple_stem');
      final leafRegion = engine.drawing.regions.firstWhere((r) => r.id == 'apple_leaf');

      expect(bodyRegion.fillColor, equals(const Color(0xFFFF3B30)));
      expect(bodyRegion.coverage, equals(1.0));
      expect(stemRegion.fillColor, isNull);
      expect(leafRegion.fillColor, isNull);

      // Now fill leaf with green
      engine.brushController.setColor(const Color(0xFF34C759));
      engine.onTouchDown(const Offset(290, 105));
      expect(leafRegion.fillColor, equals(const Color(0xFF34C759)));
      expect(stemRegion.fillColor, isNull);
    });

    test('Test 4: Undo & Redo for strokes and fills', () {
      final sunf = DrawingsLibrary.getDrawingById('flower_sunflower')!;
      final engine = ColoringEngine(initialDrawing: sunf);

      // Fill center
      engine.brushController.setFillTool(true);
      engine.brushController.setColor(const Color(0xFF6F4E37));
      engine.onTouchDown(const Offset(250, 220));

      final center = engine.drawing.regions.firstWhere((r) => r.id == 'sunf_center');
      expect(center.fillColor, equals(const Color(0xFF6F4E37)));

      // Undo
      expect(engine.undoRedoManager.canUndo, isTrue);
      engine.undo();
      expect(center.fillColor, isNull);

      // Redo
      expect(engine.undoRedoManager.canRedo, isTrue);
      engine.redo();
      expect(center.fillColor, equals(const Color(0xFF6F4E37)));
    });

    test('Test 5: All 6 Brush Styles stay strictly in region', () {
      final elephant = DrawingsLibrary.getDrawingById('wild_elephant')!;
      final engine = ColoringEngine(initialDrawing: elephant);

      for (final style in BrushStyle.values) {
        engine.brushController.setStyle(style);
        expect(engine.brushController.style, equals(style));

        // Draw in elephant ear
        engine.onTouchDown(const Offset(120, 220));
        engine.onTouchMove(const Offset(125, 230));
        engine.onTouchUp();
      }

      final earRegion = engine.drawing.regions.firstWhere((r) => r.id == 'ele_ears');
      expect(earRegion.strokes.length, equals(BrushStyle.values.length));
    });

    test('Test 6: Level Completion requires all required regions to be colored', () {
      final car = DrawingsLibrary.getDrawingById('veh_car')!;
      final engine = ColoringEngine(initialDrawing: car);

      expect(engine.isCompleted, isFalse);

      // Fill each region
      for (final r in engine.drawing.regions) {
        r.fill(r.defaultColor ?? Colors.blue);
      }

      expect(engine.isCompleted, isTrue);
    });

    test('Test 7: Eraser tool marks stroke as isEraser', () {
      final fish = DrawingsLibrary.getDrawingById('sea_fish')!;
      final engine = ColoringEngine(initialDrawing: fish);

      engine.brushController.setEraser(true);
      engine.onTouchDown(const Offset(250, 250));
      engine.onTouchMove(const Offset(260, 260));
      engine.onTouchUp();

      final body = engine.drawing.regions.firstWhere((r) => r.id == 'fish_body');
      expect(body.strokes.last.isEraser, isTrue);
    });
  });
}
