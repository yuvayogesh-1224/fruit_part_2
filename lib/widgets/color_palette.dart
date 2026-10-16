import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class ColorPalette extends StatelessWidget {
  final Color selectedColor;
  final ValueChanged<Color> onColorSelected;
  final List<Color> colors;

  const ColorPalette({
    super.key,
    required this.selectedColor,
    required this.onColorSelected,
    this.colors = AppColors.defaultPalette,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72,
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.95),
        boxShadow: const [
          BoxShadow(
            color: Color(0x14000000),
            blurRadius: 10,
            offset: Offset(0, -2),
          ),
        ],
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: colors.length,
        separatorBuilder: (_, _) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          final color = colors[index];
          final isSelected = color.toARGB32() == selectedColor.toARGB32();

          return Center(
            child: GestureDetector(
              onTap: () => onColorSelected(color),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 180),
                width: isSelected ? 52 : 44,
                height: isSelected ? 52 : 44,
                decoration: BoxDecoration(
                  color: color,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: isSelected ? const Color(0xFF2D3142) : Colors.white,
                    width: isSelected ? 3.5 : 2.5,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: color.withValues(alpha: 0.4),
                      blurRadius: isSelected ? 8 : 4,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: isSelected
                    ? const Icon(
                        Icons.check_rounded,
                        color: Colors.white,
                        size: 26,
                        shadows: [
                          Shadow(
                            color: Colors.black45,
                            blurRadius: 4,
                          ),
                        ],
                      )
                    : null,
              ),
            ),
          );
        },
      ),
    );
  }
}
