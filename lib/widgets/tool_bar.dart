import 'package:flutter/material.dart';
import '../models/stroke_model.dart';
import '../theme/app_colors.dart';
import 'brush_selector.dart';

class ColoringToolBar extends StatelessWidget {
  final BrushStyle currentStyle;
  final double currentSize;
  final Color currentColor;
  final bool isEraser;
  final bool isFillTool;
  final bool canUndo;
  final bool canRedo;
  final VoidCallback onToggleEraser;
  final VoidCallback onToggleFill;
  final VoidCallback onUndo;
  final VoidCallback onRedo;
  final VoidCallback onReset;
  final ValueChanged<BrushStyle> onStyleSelected;
  final ValueChanged<double> onSizeChanged;

  const ColoringToolBar({
    super.key,
    required this.currentStyle,
    required this.currentSize,
    required this.currentColor,
    required this.isEraser,
    required this.isFillTool,
    required this.canUndo,
    required this.canRedo,
    required this.onToggleEraser,
    required this.onToggleFill,
    required this.onUndo,
    required this.onRedo,
    required this.onReset,
    required this.onStyleSelected,
    required this.onSizeChanged,
  });

  void _showBrushPicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
      ),
      builder: (context) {
        return BrushSelectorSheet(
          currentStyle: currentStyle,
          currentSize: currentSize,
          currentColor: currentColor,
          onStyleSelected: (style) {
            onStyleSelected(style);
            Navigator.pop(context);
          },
          onSizeChanged: onSizeChanged,
        );
      },
    );
  }

  void _showResetConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        title: const Text(
          'Start Over?',
          style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.textDark),
        ),
        content: const Text(
          'Do you want to clean the page and start coloring fresh?',
          style: TextStyle(fontSize: 16),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Keep Coloring', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(ctx);
              onReset();
            },
            child: const Text('Reset Page'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(28),
        boxShadow: const [
          BoxShadow(
            color: Color(0x12000000),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // 1. Brush Style / Size selector button
          _buildToolButton(
            icon: currentStyle.icon,
            label: currentStyle.displayName,
            isActive: !isEraser && !isFillTool,
            activeColor: AppColors.primary,
            onTap: () => _showBrushPicker(context),
          ),

          // 2. Fill Tool (Paint bucket)
          _buildToolButton(
            icon: Icons.format_color_fill_rounded,
            label: 'Fill',
            isActive: isFillTool,
            activeColor: AppColors.secondary,
            onTap: onToggleFill,
          ),

          // 3. Eraser
          _buildToolButton(
            icon: Icons.auto_fix_high_rounded,
            label: 'Eraser',
            isActive: isEraser,
            activeColor: AppColors.accentOrange,
            onTap: onToggleEraser,
          ),

          // 4. Undo
          _buildIconButton(
            icon: Icons.undo_rounded,
            tooltip: 'Undo',
            isEnabled: canUndo,
            onTap: onUndo,
          ),

          // 5. Redo
          _buildIconButton(
            icon: Icons.redo_rounded,
            tooltip: 'Redo',
            isEnabled: canRedo,
            onTap: onRedo,
          ),

          // 6. Reset
          _buildIconButton(
            icon: Icons.refresh_rounded,
            tooltip: 'Reset',
            isEnabled: true,
            onTap: () => _showResetConfirmation(context),
          ),
        ],
      ),
    );
  }

  Widget _buildToolButton({
    required IconData icon,
    required String label,
    required bool isActive,
    required Color activeColor,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
          color: isActive ? activeColor : const Color(0xFFF3F5F7),
          borderRadius: BorderRadius.circular(16),
          boxShadow: isActive
              ? [
                  BoxShadow(
                    color: activeColor.withValues(alpha: 0.35),
                    blurRadius: 6,
                    offset: const Offset(0, 2),
                  ),
                ]
              : [],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 20,
              color: isActive ? Colors.white : AppColors.textDark,
            ),
            const SizedBox(width: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: isActive ? Colors.white : AppColors.textDark,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIconButton({
    required IconData icon,
    required String tooltip,
    required bool isEnabled,
    required VoidCallback onTap,
  }) {
    return IconButton(
      tooltip: tooltip,
      onPressed: isEnabled ? onTap : null,
      icon: Icon(
        icon,
        size: 24,
        color: isEnabled ? AppColors.textDark : Colors.grey.shade400,
      ),
    );
  }
}
