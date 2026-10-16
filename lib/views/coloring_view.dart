import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../coloring_engine/coloring_canvas.dart';
import '../models/drawing_model.dart';
import '../services/artwork_storage_service.dart';
import '../services/progress_service.dart';
import '../theme/app_colors.dart';
import '../viewmodels/coloring_viewmodel.dart';
import '../widgets/color_palette.dart';
import '../widgets/completion_dialog.dart';
import '../widgets/confetti_particle_overlay.dart';
import '../widgets/tool_bar.dart';

class ColoringView extends StatelessWidget {
  final ColoringDrawing drawing;

  const ColoringView({super.key, required this.drawing});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ColoringViewModel(
        initialDrawing: drawing,
        progressService: context.read<ProgressService>(),
        storageService: context.read<ArtworkStorageService>(),
      ),
      child: const _ColoringViewContent(),
    );
  }
}

class _ColoringViewContent extends StatelessWidget {
  const _ColoringViewContent();

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<ColoringViewModel>();
    final engine = vm.engine;
    final drawing = vm.drawing;

    return PopScope(
      canPop: true,
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: SafeArea(
          child: Stack(
            children: [
              Column(
                children: [
                  // 1. Top Header Bar
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Row(
                      children: [
                        // Back Button
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: const [
                              BoxShadow(color: Color(0x15000000), blurRadius: 6, offset: Offset(0, 2)),
                            ],
                          ),
                          child: IconButton(
                            icon: const Icon(Icons.arrow_back_rounded, color: AppColors.textDark, size: 26),
                            onPressed: () => Navigator.pop(context),
                          ),
                        ),
                        const SizedBox(width: 12),

                        // Level badge & Drawing Title
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                    decoration: BoxDecoration(
                                      color: AppColors.primary,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Text(
                                      'LEVEL ${drawing.levelNumber}',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 11,
                                        fontWeight: FontWeight.w900,
                                        letterSpacing: 0.5,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    drawing.title,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.textDark,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 4),

                              // Coverage Progress Bar
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: LinearProgressIndicator(
                                  value: vm.totalCoverage,
                                  backgroundColor: const Color(0xFFE2E8F0),
                                  valueColor: const AlwaysStoppedAnimation<Color>(AppColors.accentGreen),
                                  minHeight: 8,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 12),

                        // Coverage percentage pill
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: const [
                              BoxShadow(color: Color(0x10000000), blurRadius: 4, offset: Offset(0, 2)),
                            ],
                          ),
                          child: Text(
                            '${(vm.totalCoverage * 100).toInt()}%',
                            style: const TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 13,
                              color: AppColors.accentGreen,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // 2. Large Centered Drawing Canvas
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                      child: ColoringCanvas(engine: engine),
                    ),
                  ),

                  // 3. Middle Tool Bar (Tools, Undo, Redo, Brushes, Sizes)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    child: ColoringToolBar(
                      currentStyle: engine.brushController.style,
                      currentSize: engine.brushController.size,
                      currentColor: engine.brushController.color,
                      isEraser: engine.brushController.isEraser,
                      isFillTool: engine.brushController.isFillTool,
                      canUndo: engine.undoRedoManager.canUndo,
                      canRedo: engine.undoRedoManager.canRedo,
                      onToggleEraser: vm.toggleEraser,
                      onToggleFill: vm.toggleFillTool,
                      onUndo: vm.undo,
                      onRedo: vm.redo,
                      onReset: vm.resetPicture,
                      onStyleSelected: vm.selectBrush,
                      onSizeChanged: vm.setBrushSize,
                    ),
                  ),

                  // 4. Horizontal Color Palette at the very bottom
                  ColorPalette(
                    selectedColor: engine.brushController.color,
                    onColorSelected: vm.selectColor,
                  ),
                ],
              ),

              // 5. Confetti Celebration Particle Overlay
              Positioned.fill(
                child: ConfettiParticleOverlay(isPlaying: vm.isLevelCompleted),
              ),

              // 6. Level Completed Dialog
              if (vm.isLevelCompleted)
                Positioned.fill(
                  child: Container(
                    color: Colors.black45,
                    alignment: Alignment.center,
                    child: LevelCompletedDialog(
                      drawing: drawing,
                      earnedCoins: vm.earnedCoins,
                      stars: vm.totalCoverage >= 0.85
                          ? 3
                          : (vm.totalCoverage >= 0.70 ? 2 : 1),
                      onNextLevel: () => vm.loadNextLevel(),
                      onReplay: () => vm.replayLevel(),
                      onHome: () => Navigator.pop(context),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
