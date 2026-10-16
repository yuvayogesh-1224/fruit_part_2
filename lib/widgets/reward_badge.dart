import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class RewardBadge extends StatelessWidget {
  final int coins;
  final int stars;

  const RewardBadge({
    super.key,
    required this.coins,
    required this.stars,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Coins Pill
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                color: Color(0x12000000),
                blurRadius: 6,
                offset: Offset(0, 2),
              ),
            ],
            border: Border.all(color: const Color(0xFFFFD166), width: 1.5),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.monetization_on_rounded, color: AppColors.coinGold, size: 20),
              const SizedBox(width: 4),
              Text(
                '$coins',
                style: const TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 14,
                  color: AppColors.textDark,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 8),

        // Stars Pill
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                color: Color(0x12000000),
                blurRadius: 6,
                offset: Offset(0, 2),
              ),
            ],
            border: Border.all(color: const Color(0xFFFFBA08), width: 1.5),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.star_rounded, color: AppColors.starGold, size: 20),
              const SizedBox(width: 4),
              Text(
                '$stars',
                style: const TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 14,
                  color: AppColors.textDark,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
