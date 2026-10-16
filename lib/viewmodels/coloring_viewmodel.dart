import 'package:flutter/material.dart';
import '../coloring_engine/coloring_engine.dart';
import '../data/drawings_library.dart';
import '../models/drawing_model.dart';
import '../models/stroke_model.dart';
import '../services/artwork_storage_service.dart';
import '../services/audio_feedback_service.dart';
import '../services/progress_service.dart';

class ColoringViewModel extends ChangeNotifier {
  final ProgressService progressService;
  final ArtworkStorageService storageService;

  late ColoringEngine _engine;
  bool _isLevelCompleted = false;
  int _earnedCoins = 0;
  bool _isProcessingCompletion = false;

  ColoringViewModel({
    required ColoringDrawing initialDrawing,
    required this.progressService,
    required this.storageService,
  }) {
    _engine = ColoringEngine(initialDrawing: initialDrawing.clone());
    _engine.addListener(_handleEngineUpdate);

    // Restore last used brush and color if available
    _engine.brushController.setColor(Color(progressService.progress.selectedColorValue));
    final brushIdx = progressService.progress.selectedBrushIndex.clamp(0, BrushStyle.values.length - 1);
    _engine.brushController.setStyle(BrushStyle.values[brushIdx]);
  }

  ColoringEngine get engine => _engine;
  ColoringDrawing get drawing => _engine.drawing;
  bool get isLevelCompleted => _isLevelCompleted;
  int get earnedCoins => _earnedCoins;
  double get totalCoverage => _engine.totalCoverage;

  void _handleEngineUpdate() {
    notifyListeners();

    // Check completion threshold
    if (_engine.isCompleted && !_isLevelCompleted && !_isProcessingCompletion) {
      _triggerLevelCompletion();
    }
  }

  Future<void> _triggerLevelCompletion() async {
    _isProcessingCompletion = true;
    _isLevelCompleted = true;

    AudioFeedbackService.levelComplete();

    // Complete level in storage & SharedPreferences
    _earnedCoins = await progressService.completeLevel(
      levelNumber: _engine.drawing.levelNumber,
      drawingId: _engine.drawing.id,
      coverage: _engine.totalCoverage,
    );

    // Save completed artwork snapshot offline
    await storageService.saveDrawing(_engine.drawing);

    _isProcessingCompletion = false;
    notifyListeners();
  }

  void selectColor(Color color) {
    AudioFeedbackService.colorSelected();
    _engine.brushController.setColor(color);
    progressService.recordColorUsed(color.toARGB32());
    notifyListeners();
  }

  void selectBrush(BrushStyle style) {
    AudioFeedbackService.tap();
    _engine.brushController.setStyle(style);
    progressService.recordBrushUsed(style.index);
    notifyListeners();
  }

  void setBrushSize(double size) {
    _engine.brushController.setSize(size);
    notifyListeners();
  }

  void toggleEraser() {
    AudioFeedbackService.tap();
    final newActive = !_engine.brushController.isEraser;
    _engine.brushController.setEraser(newActive);
    notifyListeners();
  }

  void toggleFillTool() {
    AudioFeedbackService.tap();
    final newActive = !_engine.brushController.isFillTool;
    _engine.brushController.setFillTool(newActive);
    notifyListeners();
  }

  void undo() {
    AudioFeedbackService.tap();
    _engine.undo();
  }

  void redo() {
    AudioFeedbackService.tap();
    _engine.redo();
  }

  void resetPicture() {
    AudioFeedbackService.tap();
    _engine.resetDrawing();
    _isLevelCompleted = false;
    notifyListeners();
  }

  void loadNextLevel() {
    final nextDrawing = DrawingsLibrary.getNextLevelDrawing(_engine.drawing.levelNumber);
    if (nextDrawing != null) {
      _isLevelCompleted = false;
      _engine.loadDrawing(nextDrawing.clone());
      notifyListeners();
    }
  }

  void replayLevel() {
    _isLevelCompleted = false;
    _engine.resetDrawing();
    notifyListeners();
  }

  @override
  void dispose() {
    _engine.removeListener(_handleEngineUpdate);
    _engine.dispose();
    super.dispose();
  }
}
