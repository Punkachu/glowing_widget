import 'package:flutter/material.dart';

class RoundWidget extends StatelessWidget {
  final Color color;
  final Size size;

  const RoundWidget({
    super.key,
    required this.color,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      height: size.height,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}

class WeirdShapeWidget extends StatelessWidget {
  final Color color;
  final Size size;

  const WeirdShapeWidget({
    super.key,
    required this.color,
    required this.size
  });

  @override
  Widget build(BuildContext context) {

    return CustomPaint(
      size: size,
      painter: CustomWeirdShapePainter(color, 10.0),
    );
  }
}

class CustomWeirdShapePainter extends CustomPainter {
  final Color color;
  final double radius;

  const CustomWeirdShapePainter(
       this.color,
       this.radius,
      );

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = color
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(size.width / 2, radius);
    path.arcToPoint(Offset(size.width - radius, size.height - radius), radius: Radius.circular(radius));
    path.arcToPoint(Offset(radius, size.height - radius), radius: Radius.circular(radius));
    path.arcToPoint(Offset(size.width / 2, radius), radius: Radius.circular(radius));
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class TriangleWidget extends StatelessWidget {
  final Color color;
  final Size size;

  const TriangleWidget({
    super.key,
    required this.color,
    required this.size
  });

  @override
  Widget build(BuildContext context) {

    return CustomPaint(
      size: size,
      painter: TrianglePainter(
        strokeColor: color
      ),
    );
  }
}

class TrianglePainter extends CustomPainter {
  final Color strokeColor;
  final PaintingStyle paintingStyle;
  final double strokeWidth;

  TrianglePainter({this.strokeColor = Colors.black, this.strokeWidth = 3, this.paintingStyle = PaintingStyle.fill});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = strokeColor
      ..strokeWidth = strokeWidth
      ..strokeJoin = StrokeJoin.round
      ..style = paintingStyle;

    Path path = getTrianglePath(size.width, size.height);
    canvas.drawPath(path, paint);
  }

  Path getTrianglePath(double x, double y) {
    Path path = Path();
    double radius = 5.0; // Radius for rounded edges
    path.moveTo(0 + radius, y);
    path.quadraticBezierTo(0, y, x / 2, 0);
    path.quadraticBezierTo(x, y, x - radius, y);
    path.quadraticBezierTo(x, y, 0 + radius, y);
    path.close();
    return path;
  }

  @override
  bool shouldRepaint(TrianglePainter oldDelegate) {
    return oldDelegate.strokeColor != strokeColor ||
        oldDelegate.paintingStyle != paintingStyle ||
        oldDelegate.strokeWidth != strokeWidth;
  }
}