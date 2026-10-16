import 'package:flutter/material.dart';
import '../models/stroke_model.dart';
import '../theme/app_colors.dart';
import 'kid_button.dart';

class BrushSelectorSheet extends StatelessWidget {
  final BrushStyle currentStyle;
  final double currentSize;
  final Color currentColor;
  final ValueChanged<BrushStyle> onStyleSelected;
  final ValueChanged<double> onSizeChanged;

  const BrushSelectorSheet({
    super.key,
    required this.currentStyle,
    required this.currentSize,
    required this.currentColor,
    required this.onStyleSelected,
    required this.onSizeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Choose Magic Brush',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textDark,
                ),
              ),
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.close_rounded, size: 28),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Brush Style Grid
          Wrap(
            spacing: 12,
            runSpacing: 12,
            alignment: WrapAlignment.center,
            children: BrushStyle.values.map((style) {
              final isSelected = style == currentStyle;
              return GestureDetector(
                onTap: () => onStyleSelected(style),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 150),
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                  decoration: BoxDecoration(
                    color: isSelected ? AppColors.primary : const Color(0xFFF0F4F8),
                    borderRadius: BorderRadius.circular(18),
                    boxShadow: isSelected
                        ? [
                            BoxShadow(
                              color: AppColors.primary.withValues(alpha: 0.35),
                              blurRadius: 8,
                              offset: const Offset(0, 3),
                            ),
                          ]
                        : [],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        style.icon,
                        color: isSelected ? Colors.white : AppColors.textDark,
                        size: 22,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        style.displayName,
                        style: TextStyle(
                          color: isSelected ? Colors.white : AppColors.textDark,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),

          const SizedBox(height: 24),
          const Text(
            'Brush Size',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppColors.textDark,
            ),
          ),
          const SizedBox(height: 10),

          // Brush size preview & slider
          Row(
            children: [
              Container(
                width: 60,
                height: 60,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: const Color(0xFFF7F8FA),
                  shape: BoxShape.circle,
                  border: Border.all(color: const Color(0xFFE2E8F0)),
                ),
                child: Container(
                  width: currentSize,
                  height: currentSize,
                  decoration: BoxDecoration(
                    color: currentColor,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Expanded(
                child: SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    activeTrackColor: AppColors.primary,
                    thumbColor: AppColors.primary,
                    overlayColor: AppColors.primary.withValues(alpha: 0.2),
                    trackHeight: 8,
                    thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 12),
                  ),
                  child: Slider(
                    value: currentSize,
                    min: 12.0,
                    max: 55.0,
                    onChanged: onSizeChanged,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          KidButton(
            color: AppColors.secondary,
            onPressed: () => Navigator.pop(context),
            child: const Center(
              child: Text(
                'Let\'s Color!',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
