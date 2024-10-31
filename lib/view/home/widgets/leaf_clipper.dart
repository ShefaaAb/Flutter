import 'package:flutter/material.dart';

class LeafClipper extends CustomClipper<Path> {
  Path getClip(Size size) {
    Path path = Path();

    path.moveTo(0, 20);
    path.quadraticBezierTo(0, 0, 20, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height - 20);
    path.quadraticBezierTo(size.width, size.height, size.width - 20, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}