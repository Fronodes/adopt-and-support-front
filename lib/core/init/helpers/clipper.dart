import 'package:flutter/cupertino.dart';

class QuadraticClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var radius = 15.0;
    var controlPoint = Offset(0, size.height / 1.5);
    var endPoint = Offset(size.width, size.height);
    var p1 = Offset(size.width, 0);
    var p2 = Offset(size.width / 4, 0);
    var p3 = Offset(size.width / 4, size.height);

    var path = Path()
      ..moveTo(p1.dx - radius, p1.dy)
      ..lineTo(p2.dx, p2.dy)
      ..quadraticBezierTo(controlPoint.dx, controlPoint.dy, p3.dx, p3.dy)
      ..lineTo(endPoint.dx - radius, endPoint.dy)
      ..arcToPoint(Offset(size.width, size.height - radius),
          radius: Radius.circular(radius), clockwise: false)
      ..lineTo(p1.dx, p1.dy + radius)
      ..arcToPoint(Offset(size.width - radius, 0),
          radius: Radius.circular(radius), clockwise: false)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
