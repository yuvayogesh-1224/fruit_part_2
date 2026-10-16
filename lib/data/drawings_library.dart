import '../models/category_model.dart';
import '../models/drawing_model.dart';
import 'drawings_cute_animals.dart';
import 'drawings_fruits.dart';
import 'drawings_nature_vehicles_dinosaurs.dart';
import 'drawings_sea_space_fantasy.dart';
import 'drawings_toys_food_objects.dart';
import 'drawings_vegetables.dart';
import 'drawings_wild_birds_flowers.dart';

class DrawingsLibrary {
  static List<ColoringDrawing>? _cachedAll;

  static List<ColoringDrawing> getAllDrawings() {
    _cachedAll ??= [
      ...getFruitDrawings(),
      ...getVegetableDrawings(),
      ...getCuteAnimalDrawings(),
      ...getWildAnimalDrawings(),
      ...getBirdDrawings(),
      ...getFlowerDrawings(),
      ...getNatureDrawings(),
      ...getVehicleDrawings(),
      ...getDinosaurDrawings(),
      ...getSeaAnimalDrawings(),
      ...getSpaceDrawings(),
      ...getFantasyDrawings(),
      ...getToyDrawings(),
      ...getFoodDrawings(),
      ...getCartoonObjectDrawings(),
    ];
    return _cachedAll!;
  }

  static List<ColoringDrawing> getDrawingsByCategory(DrawingCategory category) {
    return getAllDrawings().where((d) => d.category == category).toList();
  }

  static ColoringDrawing? getDrawingByLevel(int level) {
    try {
      return getAllDrawings().firstWhere((d) => d.levelNumber == level);
    } catch (_) {
      return null;
    }
  }

  static ColoringDrawing? getDrawingById(String id) {
    try {
      return getAllDrawings().firstWhere((d) => d.id == id);
    } catch (_) {
      return null;
    }
  }

  static ColoringDrawing? getNextLevelDrawing(int currentLevel) {
    return getDrawingByLevel(currentLevel + 1);
  }
}
