import 'package:flutter/material.dart';

class GradientArcPainter extends CustomPainter {
  final double strokeWidth;
  final List<Color> gradientColors;
  final double startAngle;
  final double sweepAngle;

  GradientArcPainter({
    required this.strokeWidth,
    required this.gradientColors,
    required this.startAngle,
    required this.sweepAngle,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // Define the gradient
    final Rect rect = Rect.fromCircle(
      center: Offset(size.width / 2, size.height / 2),
      radius: size.width / 2,
    );
    final Gradient gradient = SweepGradient(
      startAngle: startAngle,
      endAngle: startAngle + sweepAngle,
      colors: gradientColors,
    );

    // Create the paint with gradient shader
    final Paint paint = Paint()
      ..shader = gradient.createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round // Make edges rounded
      ..strokeWidth = strokeWidth
      ..isAntiAlias = true;

    // Define the circular path (arc)
    final double radius = (size.width - strokeWidth) / 2;
    final Offset center = Offset(size.width / 2, size.height / 2);
    final Rect arcRect = Rect.fromCircle(center: center, radius: radius);

    canvas.drawArc(
      arcRect,
      startAngle, // Start angle (in radians)
      sweepAngle, // Sweep angle (in radians)
      false, // Don't fill the circle
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class TrianglePainter extends CustomPainter {
  final Color color;
  final bool isFilled;

  TrianglePainter({required this.color, this.isFilled = true});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..style = isFilled ? PaintingStyle.fill : PaintingStyle.stroke
      ..strokeWidth = 4.0;

    // Define the triangle path
    final Path path = Path()
      ..moveTo(size.width / 2, 0) // Top point of the triangle
      ..lineTo(0, size.height) // Bottom-left point
      ..lineTo(size.width, size.height) // Bottom-right point
      ..close(); // Connect back to the starting point

    // Draw the triangle
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
