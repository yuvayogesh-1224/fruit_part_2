import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/reward_model.dart';
import '../models/user_progress.dart';

class ProgressService extends ChangeNotifier {
  static const String _keyProgress = 'kids_coloring_user_progress';
  static const String _keyAchievements = 'kids_coloring_achievements';

  late SharedPreferences _prefs;
  UserProgress _progress = UserProgress();
  List<Achievement> _achievements = RewardSystem.getInitialAchievements();

  UserProgress get progress => _progress;
  List<Achievement> get achievements => _achievements;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
    final data = _prefs.getString(_keyProgress);
    if (data != null && data.isNotEmpty) {
      _progress = UserProgress.deserialize(data);
    }

    final achData = _prefs.getStringList(_keyAchievements);
    if (achData != null) {
      final unlockedSet = achData.toSet();
      _achievements = _achievements.map((a) {
        return a.copyWith(isUnlocked: unlockedSet.contains(a.id));
      }).toList();
    }

    _checkDailyGoalReset();
    notifyListeners();
  }

  void _checkDailyGoalReset() {
    final now = DateTime.now();
    final todayStr = '${now.year}-${now.month}-${now.day}';
    if (_progress.lastDailyDate != todayStr) {
      _progress.lastDailyDate = todayStr;
      _progress.dailyGoalCompleted = 0;
      saveProgress();
    }
  }

  Future<void> saveProgress() async {
    await _prefs.setString(_keyProgress, _progress.serialize());
    final unlockedAchIds = _achievements.where((a) => a.isUnlocked).map((a) => a.id).toList();
    await _prefs.setStringList(_keyAchievements, unlockedAchIds);
    notifyListeners();
  }

  Future<int> completeLevel({
    required int levelNumber,
    required String drawingId,
    required double coverage,
  }) async {
    // Determine stars (1 to 3) based on coverage
    int starsEarned = 1;
    if (coverage >= 0.85) {
      starsEarned = 3;
    } else if (coverage >= 0.70) {
      starsEarned = 2;
    }

    final prevStars = _progress.getStarsForDrawing(drawingId);
    final newStarsDiff = max(0, starsEarned - prevStars);
    _progress.stars += newStarsDiff;
    _progress.drawingStars[drawingId] = max(prevStars, starsEarned);

    final isFirstTime = !_progress.completedDrawingIds.contains(drawingId);
    _progress.completedDrawingIds.add(drawingId);

    // Coins: 50 base + 20 per star
    final coinsEarned = isFirstTime ? (50 + starsEarned * 20) : (15 * starsEarned);
    _progress.coins += coinsEarned;

    // Unlock next level if current was the max level
    if (levelNumber >= _progress.maxUnlockedLevel) {
      _progress.maxUnlockedLevel = levelNumber + 1;
    }

    // Daily goal
    if (isFirstTime) {
      _progress.dailyGoalCompleted++;
    }

    // Check achievement triggers
    _evaluateAchievements();

    await saveProgress();
    return coinsEarned;
  }

  void _evaluateAchievements() {
    final completedCount = _progress.completedDrawingIds.length;

    void unlock(String id) {
      final idx = _achievements.indexWhere((a) => a.id == id);
      if (idx != -1 && !_achievements[idx].isUnlocked) {
        _achievements[idx] = _achievements[idx].copyWith(isUnlocked: true);
        _progress.coins += _achievements[idx].rewardCoins;
      }
    }

    if (completedCount >= 1) unlock('first_drawing');
    if (completedCount >= 5) unlock('animal_lover');
    if (completedCount >= 15) unlock('pro_artist');

    final fruitCount = _progress.completedDrawingIds.where((id) => id.startsWith('fruit_')).length;
    if (fruitCount >= 3) unlock('fruit_fan');

    final vegCount = _progress.completedDrawingIds.where((id) => id.startsWith('veg_')).length;
    if (vegCount >= 3) unlock('veggie_hero');

    final dinoCount = _progress.completedDrawingIds.where((id) => id.startsWith('dino_')).length;
    if (dinoCount >= 2) unlock('dino_master');

    final spaceCount = _progress.completedDrawingIds.where((id) => id.startsWith('space_')).length;
    if (spaceCount >= 2) unlock('space_cadet');
  }

  void recordBrushUsed(int brushIndex) {
    _progress.selectedBrushIndex = brushIndex;
    if (brushIndex == 5) {
      // Glitter brush used
      final idx = _achievements.indexWhere((a) => a.id == 'glitter_artist');
      if (idx != -1 && !_achievements[idx].isUnlocked) {
        _achievements[idx] = _achievements[idx].copyWith(isUnlocked: true);
        _progress.coins += _achievements[idx].rewardCoins;
        saveProgress();
      }
    }
  }

  void recordColorUsed(int colorValue) {
    _progress.selectedColorValue = colorValue;
  }
}
