import 'package:flutter/material.dart';

class Slide2DesktopShape extends StatelessWidget {
  const Slide2DesktopShape({super.key});

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: SizedBox.expand(child: CustomPaint(painter: _DesktopPainter())),
    );
  }
}

class _DesktopPainter extends CustomPainter {
  _DesktopPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final gradient = LinearGradient(
      colors: const [Color(0xFFE6FFFA), Color(0xFFEBF4FF)],
      stops: const [0.0, 1.0],
      transform: const GradientRotation(104 * 3.141592653589793 / 180),
    ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    final paint = Paint()
      ..shader = gradient
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(0, size.height * .05)
      ..quadraticBezierTo(
        size.width * .2,
        size.height * .2,
        size.width * .6,
        size.height * .1,
      )
      ..quadraticBezierTo(size.width * .8, 0, size.width, size.height * .3)
      ..lineTo(size.width, size.height * .65)
      ..quadraticBezierTo(
        size.width * .75,
        size.height * .8,
        size.width * .2,
        size.height * .8,
      )
      ..lineTo(0, size.height * .77)
      ..lineTo(0, size.height * .05)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant _DesktopPainter oldDelegate) {
    return false;
  }
}

class Slide2PhoneShape extends StatelessWidget {
  const Slide2PhoneShape({super.key});

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: SizedBox.expand(child: CustomPaint(painter: _PhonePainter())),
    );
  }
}

class _PhonePainter extends CustomPainter {
  _PhonePainter();

  @override
  void paint(Canvas canvas, Size size) {
    final gradient = LinearGradient(
      colors: const [Color(0xFFE6FFFA), Color(0xFFEBF4FF)],
      stops: const [0.0, 1.0],
      transform: const GradientRotation(104 * 3.141592653589793 / 180),
    ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    final paint = Paint()
      ..shader = gradient
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(0, 0)
      ..cubicTo(
        size.width * .4,
        size.height * .3,
        size.width * .6,
        size.height * -.01,
        size.width,
        size.height * .1,
      )
      ..lineTo(size.width, size.height * .8)
      ..quadraticBezierTo(
        size.width * .85,
        size.height * .9,
        size.width * .65,
        size.height * .88,
      )
      ..cubicTo(
        size.width * .5,
        size.height * .85,
        size.width * .3,
        size.height * .82,
        0,
        size.height * .95,
      )
      ..lineTo(0, size.height * .05)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant _DesktopPainter oldDelegate) {
    return false;
  }
}
