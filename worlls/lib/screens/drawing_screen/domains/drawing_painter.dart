import 'dart:ui' as ui;
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DrawingPainter extends CustomPainter {
  final ui.Image image;
  final List<Offset> points;

  DrawingPainter(this.image, this.points);

  var myPaint = Paint()
    ..isAntiAlias = true
    ..strokeCap = StrokeCap.round
    ..strokeWidth = 3.0
    ..color = Colors.black;

  paint(canvas, size) {
    if (image != null) {
      canvas.drawImage(image, Offset(0, 0), myPaint);
    }

    for (var i = 0; i < points.length - 1; i++) {
      if (shouldDrawLine(i)) {
        canvas.drawLine(points[i], points[i + 1], myPaint);
      } else if (shouldDrawPoint(i)) {
        canvas.drawPoints(PointMode.points, [points[i]], myPaint);
      }
    }
  }

  bool shouldDrawPoint(int i) =>
      points[i] != null && points.length > i + 1 && points[i + 1] == null;

  bool shouldDrawLine(int i) =>
      points[i] != null && points.length > i + 1 && points[i + 1] != null;

  shouldRepaint(DrawingPainter old) => true;
}
