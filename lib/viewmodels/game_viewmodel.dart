import 'package:flutter/material.dart';
import '../data/drawings_library.dart';
import '../models/category_model.dart';
import '../models/drawing_model.dart';
import '../services/progress_service.dart';

class GameViewModel extends ChangeNotifier {
  final ProgressService progressService;
  DrawingCategory _selectedCategory = DrawingCategory.fruits;

  GameViewModel({required this.progressService}) {
    progressService.addListener(notifyListeners);
  }

  DrawingCategory get selectedCategory => _selectedCategory;
  int get userCoins => progressService.progress.coins;
  int get userStars => progressService.progress.stars;
  int get maxUnlockedLevel => progressService.progress.maxUnlockedLevel;
  int get dailyGoalTarget => progressService.progress.dailyGoalTarget;
  int get dailyGoalCompleted => progressService.progress.dailyGoalCompleted;

  void selectCategory(DrawingCategory category) {
    _selectedCategory = category;
    notifyListeners();
  }

  List<ColoringDrawing> getDrawingsForSelectedCategory() {
    return DrawingsLibrary.getDrawingsByCategory(_selectedCategory);
  }

  int getCompletedCountForCategory(DrawingCategory category) {
    final list = DrawingsLibrary.getDrawingsByCategory(category);
    int count = 0;
    for (final d in list) {
      if (progressService.progress.isDrawingCompleted(d.id)) {
        count++;
      }
    }
    return count;
  }

  bool isLevelUnlocked(int levelNumber) {
    return progressService.progress.isLevelUnlocked(levelNumber);
  }

  bool isDrawingCompleted(String id) {
    return progressService.progress.isDrawingCompleted(id);
  }

  int getDrawingStars(String id) {
    return progressService.progress.getStarsForDrawing(id);
  }

  @override
  void dispose() {
    progressService.removeListener(notifyListeners);
    super.dispose();
  }
}
