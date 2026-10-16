import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/category_model.dart';
import '../models/drawing_model.dart';
import '../services/audio_feedback_service.dart';
import '../theme/app_colors.dart';
import '../viewmodels/game_viewmodel.dart';
import '../widgets/reward_badge.dart';
import 'coloring_view.dart';

class CategoryView extends StatefulWidget {
  final DrawingCategory initialCategory;

  const CategoryView({super.key, this.initialCategory = DrawingCategory.fruits});

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  late DrawingCategory _activeCategory;

  @override
  void initState() {
    super.initState();
    _activeCategory = widget.initialCategory;
  }

  @override
  Widget build(BuildContext context) {
    final gameVm = context.watch<GameViewModel>();
    final drawings = gameVm.progressService.progress;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Coloring Pages'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Center(
              child: RewardBadge(
                coins: gameVm.userCoins,
                stars: gameVm.userStars,
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Category Horizontal Tabs
            SizedBox(
              height: 52,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: DrawingCategory.values.length,
                separatorBuilder: (_, _) => const SizedBox(width: 8),
                itemBuilder: (context, index) {
                  final cat = DrawingCategory.values[index];
                  final isSelected = cat == _activeCategory;

                  return GestureDetector(
                    onTap: () {
                      AudioFeedbackService.tap();
                      setState(() => _activeCategory = cat);
                      gameVm.selectCategory(cat);
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 150),
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                      decoration: BoxDecoration(
                        color: isSelected ? cat.accentColor : Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: isSelected
                            ? [
                                BoxShadow(
                                  color: cat.accentColor.withValues(alpha: 0.35),
                                  blurRadius: 8,
                                  offset: const Offset(0, 3),
                                ),
                              ]
                            : [
                                const BoxShadow(
                                  color: Color(0x0C000000),
                                  blurRadius: 4,
                                  offset: Offset(0, 2),
                                ),
                              ],
                      ),
                      child: Row(
                        children: [
                          Icon(
                            cat.icon,
                            size: 18,
                            color: isSelected ? Colors.white : AppColors.textDark,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            cat.displayName,
                            style: TextStyle(
                              color: isSelected ? Colors.white : AppColors.textDark,
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 12),

            // Category progress pill
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    _activeCategory.displayName,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                      color: AppColors.textDark,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: _activeCategory.accentColor.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      '${gameVm.getCompletedCountForCategory(_activeCategory)} / 7 Completed',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: _activeCategory.accentColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            // Drawings Grid
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.85,
                  crossAxisSpacing: 14,
                  mainAxisSpacing: 14,
                ),
                itemCount: gameVm.getDrawingsForSelectedCategory().length,
                itemBuilder: (context, index) {
                  final drawing = gameVm.getDrawingsForSelectedCategory()[index];
                  final isUnlocked = gameVm.isLevelUnlocked(drawing.levelNumber);
                  final isCompleted = drawings.isDrawingCompleted(drawing.id);
                  final stars = drawings.getStarsForDrawing(drawing.id);

                  return GestureDetector(
                    onTap: isUnlocked
                        ? () {
                            AudioFeedbackService.tap();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => ColoringView(drawing: drawing),
                              ),
                            );
                          }
                        : () {
                            AudioFeedbackService.tap();
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Complete Level ${drawing.levelNumber - 1} to unlock ${drawing.title}!'),
                                duration: const Duration(seconds: 2),
                                behavior: SnackBarBehavior.floating,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                              ),
                            );
                          },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 150),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x10000000),
                            blurRadius: 10,
                            offset: Offset(0, 4),
                          ),
                        ],
                        border: isCompleted
                            ? Border.all(color: AppColors.accentGreen, width: 2.0)
                            : null,
                      ),
                      child: Stack(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              // Level badge
                              Padding(
                                padding: const EdgeInsets.only(left: 12, top: 12),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                                    decoration: BoxDecoration(
                                      color: isUnlocked ? AppColors.accentYellow : Colors.grey.shade300,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Text(
                                      'LVL ${drawing.levelNumber}',
                                      style: TextStyle(
                                        color: isUnlocked ? AppColors.textDark : Colors.grey.shade600,
                                        fontSize: 10,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                              // Thumbnail Line Art Canvas
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CustomPaint(
                                    painter: _MiniDrawingPainter(drawing: drawing),
                                  ),
                                ),
                              ),

                              // Drawing Title & Stars
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                                child: Column(
                                  children: [
                                    Text(
                                      drawing.title,
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: isUnlocked ? AppColors.textDark : Colors.grey.shade500,
                                      ),
                                      textAlign: TextAlign.center,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(height: 4),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: List.generate(3, (starIdx) {
                                        final hasStar = starIdx < stars;
                                        return Icon(
                                          hasStar ? Icons.star_rounded : Icons.star_outline_rounded,
                                          size: 16,
                                          color: hasStar ? AppColors.starGold : Colors.grey.shade300,
                                        );
                                      }),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),

                          // Locked Overlay
                          if (!isUnlocked)
                            Positioned.fill(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white.withValues(alpha: 0.72),
                                  borderRadius: BorderRadius.circular(24),
                                ),
                                child: const Center(
                                  child: Icon(
                                    Icons.lock_rounded,
                                    color: AppColors.textMuted,
                                    size: 38,
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MiniDrawingPainter extends CustomPainter {
  final ColoringDrawing drawing;

  _MiniDrawingPainter({required this.drawing});

  @override
  void paint(Canvas canvas, Size size) {
    const canonicalSize = 500.0;
    final scale = size.width / canonicalSize;

    canvas.save();
    canvas.scale(scale, scale);

    // Draw outline and details in mini preview
    drawing.detailsPainter?.call(canvas, const Size(canonicalSize, canonicalSize));
    drawing.outlinesPainter(canvas, const Size(canonicalSize, canonicalSize));

    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant _MiniDrawingPainter oldDelegate) => false;
}
