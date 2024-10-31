
import 'package:flutter/material.dart';
class MediaQueryUtil {
  static late double screenWidth;
  static late double screenHeight;
  static late double defaultRadius;


  static void init(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    defaultRadius=8.0;

  }
}
