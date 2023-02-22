import 'package:flutter/material.dart';

class TriangleClipper extends CustomClipper<Path> {
  final double sweepAngle;
  TriangleClipper(this.sweepAngle);
  @override
  Path getClip(Size size) {
    final width = size.width;
    final height = size.height;
    final centreWidth = width / 2;
    final centreHeight = height / 2;
    final centre = Offset(centreWidth, centreHeight);
    Path path = Path();

    //THIS IS FOR addPolygon TO DRAW A SHAPE LIKE path.moveTo & lineTo WORK
    // final polygonPoint = [
    //   Offset(centreWidth, centreHeight),
    //   Offset(0, height),
    //   Offset(width, height),
    //   Offset(width, 0),
    //   Offset.zero
    // ];
    // path.addPolygon(polygonPoint, true);

    // THIS IS FOR RECT USE IN DIFFERENT METHOD LIKE arcTO OR OTHER
    // path.addRect(Rect.fromCenter(
    // //     center: centre, width: width * 0.5, height: height * 0.5));
    // path.addRect(Rect.fromCircle(center: centre, radius: 100));
    // path.addRect(Rect.fromLTRB(20, 20, width - 40, height - 40));
    // path.addRect(Rect.fromLTWH(20, 20, width, height));

    //THIS IS USE FOR arcTo
    // path.arcTo(Rect.fromCircle(center: centre, radius: 100), 90, 180, false);
    // path.arcTo(Rect.fromCircle(center: centre, radius: 100), degRadian(0),
    //     degRadian(sweepAngle), false);
    path.close();
    return path;
    //THIS IS FOR conicTo.THIS IS SINGLE CONTROLLER METHOD TO DRAW A CURVE AND ALSO A WEIGHT
    // path.moveTo(0, 0);
    // path.lineTo(0, 0.4);
    // path.lineTo(width, 0);
    // path.conicTo(width * 0.9, height * 0.3, width, height * 0.42, 1);
    // path.lineTo(0, height * 0.4);

    // path.close();
    // return path;

    //THOS IS USE FOR  quadraticBezierTo. THIS IS SINGLE CONTROLLER METHOD TO DRAW A CURVE
    // path.moveTo(0, 0);
    // path.lineTo(0, height * 0.4);
    // path.quadraticBezierTo(width * 0.1, height * 0.0001, width, height * 0.5);
    // path.lineTo(width, 0);
    // path.close();
    // return path;

    //WAVE CLIPPER THROUGH cubicTO THIS IS A DOUBLE CONTROLLER TO DRAW A CURVE
    // path.moveTo(0, height * 0.5);
    // path.cubicTo(width * 0.4, height * 0.3, width * 0.6, height * 0.4, width,
    //     height * 0.3);
    // path.lineTo(width, height);
    // path.lineTo(0, height);
    // path.close();
    // return path;

    //CENTRE TRIANGLE
    // path.moveTo(centreWidth, centreHeight);
    // path.lineTo(0, height);
    // path.lineTo(width, height);
    // path.close();
    // return path;
  }

  double degRadian(double deg) => deg * 3.14 / 180;
//THIS OVERRIDE FUNCTION IS CHANGE WHEN YOU CAN PERFORM ANY ACTION THROUGH arcTo METHOD OTHERWISE DONT NOT CHANGE THE OVERRIDE FUNCTION
  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) =>
      (oldClipper as TriangleClipper).sweepAngle != sweepAngle;
}
