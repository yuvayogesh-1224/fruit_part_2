import 'dart:math' as math;
import 'package:flutter/material.dart';

class ConfettiParticle {
  double x;
  double y;
  double vx;
  double vy;
  double rotation;
  double rotationSpeed;
  Color color;
  double size;
  int type; // 0: rect, 1: star, 2: circle

  ConfettiParticle({
    required this.x,
    required this.y,
    required this.vx,
    required this.vy,
    required this.rotation,
    required this.rotationSpeed,
    required this.color,
    required this.size,
    required this.type,
  });
}

class ConfettiParticleOverlay extends StatefulWidget {
  final bool isPlaying;

  const ConfettiParticleOverlay({
    super.key,
    required this.isPlaying,
  });

  @override
  State<ConfettiParticleOverlay> createState() => _ConfettiParticleOverlayState();
}

class _ConfettiParticleOverlayState extends State<ConfettiParticleOverlay> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  final List<ConfettiParticle> _particles = [];
  final math.Random _random = math.Random();

  final List<Color> _colors = const [
    Color(0xFFFF3B30),
    Color(0xFFFF9500),
    Color(0xFFFFCC00),
    Color(0xFF34C759),
    Color(0xFF00C7BE),
    Color(0xFF30B0C7),
    Color(0xFF007AFF),
    Color(0xFFAF52DE),
    Color(0xFFFF2D55),
    Color(0xFFFF85A1),
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3500),
    )..addListener(_updateParticles);

    if (widget.isPlaying) {
      _startBurst();
    }
  }

  @override
  void didUpdateWidget(covariant ConfettiParticleOverlay oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isPlaying && !oldWidget.isPlaying) {
      _startBurst();
    }
  }

  void _startBurst() {
    _particles.clear();
    for (int i = 0; i < 90; i++) {
      final angle = _random.nextDouble() * 2 * math.pi;
      final speed = 4.0 + _random.nextDouble() * 12.0;
      _particles.add(
        ConfettiParticle(
          x: 0.5,
          y: 0.45,
          vx: math.cos(angle) * speed * 0.0016,
          vy: (math.sin(angle) * speed * 0.0016) - 0.004, // slight upward boost
          rotation: _random.nextDouble() * 2 * math.pi,
          rotationSpeed: (_random.nextDouble() - 0.5) * 0.2,
          color: _colors[_random.nextInt(_colors.length)],
          size: 7.0 + _random.nextDouble() * 9.0,
          type: _random.nextInt(3),
        ),
      );
    }
    _controller.forward(from: 0.0);
  }

  void _updateParticles() {
    for (final p in _particles) {
      p.x += p.vx;
      p.y += p.vy;
      p.vy += 0.00022; // Gravity
      p.rotation += p.rotationSpeed;
    }
    setState(() {});
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_controller.isAnimating && _particles.isEmpty) {
      return const SizedBox.shrink();
    }

    return IgnorePointer(
      child: CustomPaint(
        size: Size.infinite,
        painter: _ConfettiPainter(
          particles: _particles,
          progress: _controller.value,
        ),
      ),
    );
  }
}

class _ConfettiPainter extends CustomPainter {
  final List<ConfettiParticle> particles;
  final double progress;

  _ConfettiPainter({required this.particles, required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final alpha = (1.0 - progress).clamp(0.0, 1.0);
    if (alpha <= 0.0) return;

    for (final p in particles) {
      final cx = p.x * size.width;
      final cy = p.y * size.height;

      if (cx < -50 || cx > size.width + 50 || cy > size.height + 50) continue;

      canvas.save();
      canvas.translate(cx, cy);
      canvas.rotate(p.rotation);

      final paint = Paint()
        ..color = p.color.withValues(alpha: alpha)
        ..style = PaintingStyle.fill;

      if (p.type == 0) {
        // Rectangle confetti
        canvas.drawRect(Rect.fromCenter(center: Offset.zero, width: p.size, height: p.size * 0.55), paint);
      } else if (p.type == 1) {
        // Star confetti
        final starPath = Path()
          ..moveTo(0, -p.size * 0.6)
          ..quadraticBezierTo(0, 0, p.size * 0.6, 0)
          ..quadraticBezierTo(0, 0, 0, p.size * 0.6)
          ..quadraticBezierTo(0, 0, -p.size * 0.6, 0)
          ..quadraticBezierTo(0, 0, 0, -p.size * 0.6)
          ..close();
        canvas.drawPath(starPath, paint);
      } else {
        // Circle confetti
        canvas.drawCircle(Offset.zero, p.size * 0.45, paint);
      }

      canvas.restore();
    }
  }

  @override
  bool shouldRepaint(covariant _ConfettiPainter oldDelegate) => true;
}
