import 'dart:math';

import 'package:flutter/material.dart';

class CircularCharPainter extends CustomPainter {
  CircularCharPainter(this.percentage, {this.size});
  final double percentage;
  final double size;

  @override
  void paint(Canvas canvas, Size size) {

    double arcAngle = 2*pi* (percentage/100) ;
    arcAngle = (arcAngle <= 0 || arcAngle > 100) ? 100 : arcAngle;

    canvas.drawArc(
      Rect.fromCircle(center: Offset(size.width/2, size.height/2), radius: this.size/2), 
        -pi/2, 
        arcAngle, 
        false, 
        Paint()
          ..color = Colors.cyan[100] 
          ..strokeWidth = 5
          ..strokeCap = StrokeCap.round
          ..style = PaintingStyle.stroke);

    arcAngle = 2*pi * ((100 - percentage).abs() / 100);

    canvas.drawArc(
      Rect.fromCircle(center: Offset(size.width/2, size.height/2), radius: this.size/2), 
        -pi/2, 
        -arcAngle, 
        false, 
        Paint()
          ..color = Color.fromARGB(255, 0, 138, 191)
          ..strokeWidth = 5
          ..strokeCap = StrokeCap.round
          ..style = PaintingStyle.stroke);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}