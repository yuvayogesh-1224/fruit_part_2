import 'package:flutter/material.dart';
import '../models/drawing_model.dart';
import '../theme/app_colors.dart';
import 'kid_button.dart';

class LevelCompletedDialog extends StatelessWidget {
  final ColoringDrawing drawing;
  final int earnedCoins;
  final int stars;
  final VoidCallback onNextLevel;
  final VoidCallback onReplay;
  final VoidCallback onHome;

  const LevelCompletedDialog({
    super.key,
    required this.drawing,
    required this.earnedCoins,
    required this.stars,
    required this.onNextLevel,
    required this.onReplay,
    required this.onHome,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      insetPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(32),
          boxShadow: const [
            BoxShadow(
              color: Color(0x33000000),
              blurRadius: 20,
              offset: Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Cheerful Banner
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              decoration: BoxDecoration(
                color: AppColors.accentYellow,
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x22FFBA08),
                    blurRadius: 8,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: const Text(
                '🎉 LEVEL COMPLETED! 🎉',
                style: TextStyle(
                  color: AppColors.textDark,
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 0.5,
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Artwork title
            Text(
              drawing.title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.textDark,
              ),
            ),

            if (drawing.funFact != null) ...[
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.surfacePastelBlue,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.lightbulb_rounded, color: AppColors.accentBlue, size: 22),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        drawing.funFact!,
                        style: const TextStyle(
                          fontSize: 13,
                          color: AppColors.textDark,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],

            const SizedBox(height: 16),

            // 3 Animated Stars
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(3, (index) {
                final isEarned = index < stars;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: Icon(
                    isEarned ? Icons.star_rounded : Icons.star_outline_rounded,
                    color: isEarned ? AppColors.starGold : Colors.grey.shade300,
                    size: index == 1 ? 52 : 42,
                    shadows: isEarned
                        ? [
                            const Shadow(
                              color: Color(0x66FFBA08),
                              blurRadius: 10,
                            ),
                          ]
                        : [],
                  ),
                );
              }),
            ),

            const SizedBox(height: 14),

            // Coins earned pill
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              decoration: BoxDecoration(
                color: const Color(0xFFFFF3CD),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: AppColors.coinGold, width: 1.5),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.monetization_on_rounded, color: AppColors.coinGold, size: 24),
                  const SizedBox(width: 6),
                  Text(
                    '+$earnedCoins Coins!',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF856404),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Action Buttons
            KidButton(
              color: AppColors.accentGreen,
              onPressed: onNextLevel,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.play_arrow_rounded, color: Colors.white, size: 28),
                  SizedBox(width: 8),
                  Text(
                    'Next Level',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),

            Row(
              children: [
                Expanded(
                  child: KidButton(
                    color: AppColors.secondary,
                    onPressed: onReplay,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.replay_rounded, color: Colors.white, size: 20),
                        SizedBox(width: 6),
                        Text(
                          'Replay',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: KidButton(
                    color: AppColors.textMuted,
                    onPressed: onHome,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.home_rounded, color: Colors.white, size: 20),
                        SizedBox(width: 6),
                        Text(
                          'Home',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
