import 'package:flutter/material.dart';

/// Overlay this inside a Stack to recreate the white
/// bottom-right curved wedge seen in the banner design.
class BannerBottomRightShape extends StatelessWidget {
  const BannerBottomRightShape({
    super.key,
    this.color = Colors.white,
    this.opacity = 1.0,
  });

  /// Fill color of the shape (usually white).
  final Color color;

  /// Opacity for the shape (0.0 - 1.0).
  final double opacity;

  @override
  Widget build(BuildContext context) {
    // Expand to the parent size and paint without blocking gestures.
    return IgnorePointer(
      child: SizedBox.expand(
        child: CustomPaint(
          painter: _BannerBottomRightPainter(color.withValues(alpha: opacity)),
        ),
      ),
    );
  }
}

class _BannerBottomRightPainter extends CustomPainter {
  _BannerBottomRightPainter(this.color);
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    // Path tuned to produce a smooth wedge that rises toward the right.
    final path = Path()
      // Start from ~middle of the bottom edge
      ..moveTo(size.width * 0.2, size.height)  
      // Soft drop: ease down a little using a cubic curve
      ..cubicTo(
        size.width * 0.96, // control 1: nudges towards the right/top
        size.height * 0.80,
        size.width * 0.98, // control 2: starts the descent
        size.height * 0.88,
        size.width, // end slightly above the bottom to avoid a circular end
        size.height * 0.88,
      )
      // Finish at the bottom-right corner and close along the bottom edge
      ..lineTo(size.width, size.height)
      ..lineTo(size.width * 0.2, size.height)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant _BannerBottomRightPainter oldDelegate) {
    return oldDelegate.color != color;
  }
}
