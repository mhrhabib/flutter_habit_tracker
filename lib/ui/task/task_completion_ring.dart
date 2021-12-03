import 'dart:math';

import 'package:flutter/material.dart';

class TaskCompletionRing extends StatelessWidget {
  const TaskCompletionRing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.0,
      child: CustomPaint(
        painter: RingPainter(),
      ),
    );
  }
}

class RingPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final strokeWidth = size.width / 15;
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.height - strokeWidth) / 2;

    final backgroundPaint = Paint()
      ..isAntiAlias = true
      ..strokeWidth = strokeWidth
      ..color = Colors.black
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(center, radius, backgroundPaint);

    final forgroundPaint = Paint()
      ..isAntiAlias = true
      ..strokeWidth = strokeWidth
      ..color = Colors.white
      ..style = PaintingStyle.stroke;

    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), -pi / 2,
        0.5 * pi, false, forgroundPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
