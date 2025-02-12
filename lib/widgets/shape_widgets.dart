import 'package:flutter/material.dart';
import 'dart:math';

class RoundShape extends StatelessWidget {
  final Color color;
  final Size size;

  const RoundShape({
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

class WeirdShape extends StatelessWidget {
  final Color color;
  final Size size;

  const WeirdShape({
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

class TriangleShape extends StatelessWidget {
  final Color color;
  final Size size;

  const TriangleShape({
    super.key,
    required this.color,
    required this.size
  });

  @override
  Widget build(BuildContext context) {

    return CustomPaint(
      size: size,
      painter: TrianglePainter(
        color: color
      ),
    );
  }
}

class TrianglePainter extends CustomPainter {
  final Color color;
  final double strokeWidth;

  TrianglePainter({this.color = Colors.black, this.strokeWidth = 3});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..strokeJoin = StrokeJoin.round
      ..style = PaintingStyle.fill;

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
    return oldDelegate.color != color || oldDelegate.strokeWidth != strokeWidth;
  }
}

class StarShape extends StatelessWidget {
  final Color color;
  final Size size;

  const StarShape({
    super.key,
    required this.color,
    required this.size
  });

  @override
  Widget build(BuildContext context) {

    return CustomPaint(
      size: size,
      painter: StarPainter(
          color: color
      ),
    );
  }
}

class StarPainter extends CustomPainter {
  final Color color;

  const StarPainter({
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    Path path = createStarPath(size.width / 2, size.height / 2, 5, size.width / 2, size.width / 4);
    canvas.drawPath(path, paint);
  }

  Path createStarPath(double cx, double cy, int points, double outerRadius, double innerRadius) {
    Path path = Path();
    double angle = pi / points;

    for (int i = 0; i < points * 2; i++) {
      double r = (i % 2 == 0) ? outerRadius : innerRadius;
      double x = cx + r * cos(i * angle - pi / 2);
      double y = cy + r * sin(i * angle - pi / 2);

      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }
    path.close();
    return path;
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class DiamondShape extends StatelessWidget {

  final Color color;
  final Size size;

  const DiamondShape({
    super.key,
    required this.color,
    required this.size
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: size, // Adjust size as needed
      painter: DiamondPainter(color: color),
    );
  }
}

class DiamondPainter extends CustomPainter {

  final Color color;

  const DiamondPainter({
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(size.width / 2, 0);
    path.lineTo(size.width, size.height / 2);
    path.lineTo(size.width / 2, size.height);
    path.lineTo(0, size.height / 2);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}