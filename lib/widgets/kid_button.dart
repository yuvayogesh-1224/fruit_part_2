import 'package:flutter/material.dart';
import '../services/audio_feedback_service.dart';

class KidButton extends StatefulWidget {
  final Widget child;
  final VoidCallback? onPressed;
  final Color color;
  final Color? shadowColor;
  final EdgeInsetsGeometry padding;
  final double borderRadius;
  final double elevation;

  const KidButton({
    super.key,
    required this.child,
    this.onPressed,
    this.color = const Color(0xFFFF6B6B),
    this.shadowColor,
    this.padding = const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
    this.borderRadius = 22.0,
    this.elevation = 4.0,
  });

  @override
  State<KidButton> createState() => _KidButtonState();
}

class _KidButtonState extends State<KidButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    final effectiveShadow = widget.shadowColor ??
        HSLColor.fromColor(widget.color).withLightness((HSLColor.fromColor(widget.color).lightness - 0.18).clamp(0.0, 1.0)).toColor();

    return GestureDetector(
      onTapDown: widget.onPressed == null
          ? null
          : (_) {
              setState(() => _isPressed = true);
              AudioFeedbackService.tap();
            },
      onTapUp: widget.onPressed == null
          ? null
          : (_) {
              setState(() => _isPressed = false);
              widget.onPressed?.call();
            },
      onTapCancel: () {
        setState(() => _isPressed = false);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 90),
        margin: EdgeInsets.only(
          top: _isPressed ? widget.elevation : 0,
          bottom: _isPressed ? 0 : widget.elevation,
        ),
        padding: widget.padding,
        decoration: BoxDecoration(
          color: widget.onPressed == null ? Colors.grey.shade400 : widget.color,
          borderRadius: BorderRadius.circular(widget.borderRadius),
          boxShadow: widget.onPressed == null || _isPressed
              ? []
              : [
                  BoxShadow(
                    color: effectiveShadow,
                    offset: Offset(0, widget.elevation),
                    blurRadius: 0,
                  ),
                ],
        ),
        child: widget.child,
      ),
    );
  }
}
