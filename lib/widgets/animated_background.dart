import 'dart:math';
import 'package:flutter/material.dart';

// ========== АНИМИРОВАННЫЙ ФОН ДЛЯ КАЖДОЙ СПЕЦИАЛЬНОСТИ ==========

class AnimatedSpecialtyBackground extends StatefulWidget {
  final String? specialty;
  final Widget child;

  const AnimatedSpecialtyBackground({
    super.key,
    this.specialty,
    required this.child,
  });

  @override
  State<AnimatedSpecialtyBackground> createState() => _AnimatedSpecialtyBackgroundState();
}

class _AnimatedSpecialtyBackgroundState extends State<AnimatedSpecialtyBackground>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 20),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    switch (widget.specialty) {
      case 'Пожарная безопасность':
        return _FireBackground(controller: _controller, child: widget.child);
      case 'Защита в чрезвычайных ситуациях':
        return _EmergencyBackground(controller: _controller, child: widget.child);
      case 'Организация оперативного (экстренного) реагирования в чрезвычайных ситуациях':
        return _RescueBackground(controller: _controller, child: widget.child);
      default:
        return _DefaultBackground(child: widget.child);
    }
  }
}

// ========== ПОЖАРНАЯ БЕЗОПАСНОСТЬ: Огненные частицы ==========
class _FireBackground extends StatelessWidget {
  final AnimationController controller;
  final Widget child;

  const _FireBackground({required this.controller, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Градиентный фон
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFFFFF5F0),
                Color(0xFFFFE8DC),
                Color(0xFFFFD4C0),
              ],
            ),
          ),
        ),
        // Анимированные огненные частицы
        AnimatedBuilder(
          animation: controller,
          builder: (context, _) {
            return CustomPaint(
              painter: FireParticlesPainter(controller.value),
              size: Size.infinite,
            );
          },
        ),
        // Контент
        child,
      ],
    );
  }
}

class FireParticlesPainter extends CustomPainter {
  final double animationValue;
  final Random random = Random(42);

  FireParticlesPainter(this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    final particles = <Offset>[];
    for (int i = 0; i < 30; i++) {
      final x = random.nextDouble() * size.width;
      final baseY = random.nextDouble() * size.height;
      final y = baseY - (animationValue * size.height * 2) % (size.height * 2);
      particles.add(Offset(x, y));
    }

    for (var particle in particles) {
      final colors = [
        Colors.orange.withOpacity(0.3),
        Colors.deepOrange.withOpacity(0.2),
        Colors.red.withOpacity(0.15),
      ];
      final paint = Paint()
        ..color = colors[random.nextInt(colors.length)]
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 10);

      canvas.drawCircle(particle, random.nextDouble() * 8 + 4, paint);
    }
  }

  @override
  bool shouldRepaint(FireParticlesPainter oldDelegate) => true;
}

// ========== ЗАЩИТА В ЧС: Пульсирующие предупреждающие элементы ==========
class _EmergencyBackground extends StatelessWidget {
  final AnimationController controller;
  final Widget child;

  const _EmergencyBackground({required this.controller, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFFFFF5F5),
                Color(0xFFFFF0E0),
              ],
            ),
          ),
        ),
        AnimatedBuilder(
          animation: controller,
          builder: (context, _) {
            return CustomPaint(
              painter: EmergencyPatternPainter(controller.value),
              size: Size.infinite,
            );
          },
        ),
        child,
      ],
    );
  }
}

class EmergencyPatternPainter extends CustomPainter {
  final double animationValue;
  final Random random = Random(123);

  EmergencyPatternPainter(this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    // Пульсирующие треугольники (знаки опасности)
    for (int i = 0; i < 8; i++) {
      final x = (i / 8) * size.width + (animationValue * 50);
      final y = random.nextDouble() * size.height;
      final opacity = (sin(animationValue * 2 * pi + i) + 1) / 2 * 0.15;

      final paint = Paint()
        ..color = Color(0xFFDC2626).withOpacity(opacity)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2;

      final path = Path();
      final size1 = 30.0;
      path.moveTo(x, y - size1);
      path.lineTo(x - size1, y + size1);
      path.lineTo(x + size1, y + size1);
      path.close();

      canvas.drawPath(path, paint);
    }

    // Пульсирующие круги
    for (int i = 0; i < 6; i++) {
      final x = random.nextDouble() * size.width;
      final y = random.nextDouble() * size.height;
      final opacity = (sin(animationValue * 2 * pi + i * 0.5) + 1) / 2 * 0.1;
      final radius = 40 + sin(animationValue * 2 * pi + i) * 10;

      final paint = Paint()
        ..color = Color(0xFFFBBF24).withOpacity(opacity)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 3;

      canvas.drawCircle(Offset(x, y), radius, paint);
    }
  }

  @override
  bool shouldRepaint(EmergencyPatternPainter oldDelegate) => true;
}

// ========== ТЕХНИЧЕСКОЕ ОБСЛУЖИВАНИЕ: Вращающиеся шестеренки ==========
class _TechnicalBackground extends StatelessWidget {
  final AnimationController controller;
  final Widget child;

  const _TechnicalBackground({required this.controller, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFFF8FAFC),
                Color(0xFFE2E8F0),
              ],
            ),
          ),
        ),
        AnimatedBuilder(
          animation: controller,
          builder: (context, _) {
            return CustomPaint(
              painter: TechnicalGearsPainter(controller.value),
              size: Size.infinite,
            );
          },
        ),
        child,
      ],
    );
  }
}

class TechnicalGearsPainter extends CustomPainter {
  final double animationValue;

  TechnicalGearsPainter(this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    final gears = [
      {'x': size.width * 0.15, 'y': size.height * 0.2, 'size': 60.0, 'speed': 1.0},
      {'x': size.width * 0.85, 'y': size.height * 0.3, 'size': 80.0, 'speed': -0.7},
      {'x': size.width * 0.2, 'y': size.height * 0.7, 'size': 50.0, 'speed': 1.2},
      {'x': size.width * 0.75, 'y': size.height * 0.75, 'size': 70.0, 'speed': -0.9},
    ];

    for (var gear in gears) {
      final paint = Paint()
        ..color = const Color(0xFF64748B).withOpacity(0.08)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 3;

      final center = Offset(gear['x'] as double, gear['y'] as double);
      final radius = gear['size'] as double;
      final rotation = animationValue * 2 * pi * (gear['speed'] as double);

      canvas.save();
      canvas.translate(center.dx, center.dy);
      canvas.rotate(rotation);

      // Рисуем шестеренку
      final path = Path();
      const teeth = 8;
      for (int i = 0; i < teeth; i++) {
        final angle = (i / teeth) * 2 * pi;
        final nextAngle = ((i + 1) / teeth) * 2 * pi;

        final outerX1 = cos(angle) * radius;
        final outerY1 = sin(angle) * radius;
        final outerX2 = cos(nextAngle) * radius;
        final outerY2 = sin(nextAngle) * radius;

        final innerRadius = radius * 0.7;
        final innerX1 = cos(angle + pi / teeth) * innerRadius;
        final innerY1 = sin(angle + pi / teeth) * innerRadius;

        if (i == 0) {
          path.moveTo(outerX1, outerY1);
        }
        path.lineTo(outerX2, outerY2);
        path.lineTo(innerX1, innerY1);
      }
      path.close();

      canvas.drawPath(path, paint);
      canvas.drawCircle(Offset.zero, radius * 0.3, paint);

      canvas.restore();
    }
  }

  @override
  bool shouldRepaint(TechnicalGearsPainter oldDelegate) => true;
}

// ========== АВАРИЙНО-СПАСАТЕЛЬНОЕ ДЕЛО: Волны и кресты ==========
class _RescueBackground extends StatelessWidget {
  final AnimationController controller;
  final Widget child;

  const _RescueBackground({required this.controller, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFFF0F9FF),
                Color(0xFFE0F2FE),
              ],
            ),
          ),
        ),
        AnimatedBuilder(
          animation: controller,
          builder: (context, _) {
            return CustomPaint(
              painter: RescuePatternPainter(controller.value),
              size: Size.infinite,
            );
          },
        ),
        child,
      ],
    );
  }
}

class RescuePatternPainter extends CustomPainter {
  final double animationValue;
  final Random random = Random(789);

  RescuePatternPainter(this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    // Волны
    final wavePaint = Paint()
      ..color = const Color(0xFF0EA5E9).withOpacity(0.1)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    for (int i = 0; i < 5; i++) {
      final path = Path();
      final offset = animationValue * size.width + i * 100;

      path.moveTo(-100 + offset % (size.width + 200), size.height * 0.3 + i * 30);

      for (double x = -100; x < size.width + 100; x += 50) {
        final adjustedX = (x + offset) % (size.width + 200) - 100;
        final y = size.height * 0.3 + i * 30 + sin((x + offset) / 50) * 20;
        path.lineTo(adjustedX, y);
      }

      canvas.drawPath(path, wavePaint);
    }

    // Медицинские кресты
    final crossPaint = Paint()
      ..color = const Color(0xFF06B6D4).withOpacity(0.08)
      ..style = PaintingStyle.fill;

    for (int i = 0; i < 6; i++) {
      final x = random.nextDouble() * size.width;
      final y = random.nextDouble() * size.height;
      final opacity = (sin(animationValue * 2 * pi + i) + 1) / 2 * 0.15;

      crossPaint.color = Color(0xFF06B6D4).withOpacity(opacity);

      final crossSize = 20.0;
      final thickness = 8.0;

      // Горизонтальная часть
      canvas.drawRect(
        Rect.fromLTWH(x - crossSize / 2, y - thickness / 2, crossSize, thickness),
        crossPaint,
      );

      // Вертикальная часть
      canvas.drawRect(
        Rect.fromLTWH(x - thickness / 2, y - crossSize / 2, thickness, crossSize),
        crossPaint,
      );
    }
  }

  @override
  bool shouldRepaint(RescuePatternPainter oldDelegate) => true;
}

// ========== ФОН ПО УМОЛЧАНИЮ ==========
class _DefaultBackground extends StatelessWidget {
  final Widget child;

  const _DefaultBackground({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFFFAFBFC),
            Color(0xFFF0F4F8),
          ],
        ),
      ),
      child: child,
    );
  }
}
