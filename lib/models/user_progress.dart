import 'dart:convert';

class UserProgress {
  int maxUnlockedLevel;
  Set<String> completedDrawingIds;
  Map<String, int> drawingStars;
  int coins;
  int stars;
  int dailyGoalTarget;
  int dailyGoalCompleted;
  String lastDailyDate;
  int selectedBrushIndex;
  int selectedColorValue;

  UserProgress({
    this.maxUnlockedLevel = 1,
    Set<String>? completedDrawingIds,
    Map<String, int>? drawingStars,
    this.coins = 100, // Starting bonus coins for kids
    this.stars = 0,
    this.dailyGoalTarget = 3,
    this.dailyGoalCompleted = 0,
    this.lastDailyDate = '',
    this.selectedBrushIndex = 0,
    this.selectedColorValue = 0xFFFF3B30,
  })  : completedDrawingIds = completedDrawingIds ?? {},
        drawingStars = drawingStars ?? {};

  bool isLevelUnlocked(int level) {
    return level <= maxUnlockedLevel;
  }

  bool isDrawingCompleted(String drawingId) {
    return completedDrawingIds.contains(drawingId);
  }

  int getStarsForDrawing(String drawingId) {
    return drawingStars[drawingId] ?? 0;
  }

  Map<String, dynamic> toJson() {
    return {
      'maxUnlockedLevel': maxUnlockedLevel,
      'completedDrawingIds': completedDrawingIds.toList(),
      'drawingStars': drawingStars,
      'coins': coins,
      'stars': stars,
      'dailyGoalTarget': dailyGoalTarget,
      'dailyGoalCompleted': dailyGoalCompleted,
      'lastDailyDate': lastDailyDate,
      'selectedBrushIndex': selectedBrushIndex,
      'selectedColorValue': selectedColorValue,
    };
  }

  factory UserProgress.fromJson(Map<String, dynamic> json) {
    return UserProgress(
      maxUnlockedLevel: json['maxUnlockedLevel'] as int? ?? 1,
      completedDrawingIds: (json['completedDrawingIds'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toSet() ??
          {},
      drawingStars: (json['drawingStars'] as Map<String, dynamic>?)?.map(
            (k, v) => MapEntry(k, v as int),
          ) ??
          {},
      coins: json['coins'] as int? ?? 100,
      stars: json['stars'] as int? ?? 0,
      dailyGoalTarget: json['dailyGoalTarget'] as int? ?? 3,
      dailyGoalCompleted: json['dailyGoalCompleted'] as int? ?? 0,
      lastDailyDate: json['lastDailyDate'] as String? ?? '',
      selectedBrushIndex: json['selectedBrushIndex'] as int? ?? 0,
      selectedColorValue: json['selectedColorValue'] as int? ?? 0xFFFF3B30,
    );
  }

  String serialize() => jsonEncode(toJson());

  factory UserProgress.deserialize(String data) {
    try {
      return UserProgress.fromJson(jsonDecode(data) as Map<String, dynamic>);
    } catch (_) {
      return UserProgress();
    }
  }
}
