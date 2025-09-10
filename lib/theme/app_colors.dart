import 'package:flutter/material.dart';

class AppColors {
  static const Color blackColor = Color.fromARGB(255, 0, 0, 0);
  static const Color whiteColor = Color.fromARGB(255, 255, 255, 255);
  static const Color appWhiteColor = Color.fromRGBO(246, 244, 244, 1);
  static const Color navBackgroundColor = Color.fromRGBO(24, 24, 24, 1);
  static const Color basicBorderColor = Color.fromRGBO(57, 55, 55, 1);
  static const Color navActiveIconColor = Color.fromRGBO(242, 201, 76, 1);
  static const Color navIconColor = Color.fromRGBO(116, 70, 172, 1);
  static const Color basicBackgroundColor = Color.fromRGBO(33, 32, 32, 1);
  static const Color temptationBackgroundColor =
      Color.fromRGBO(116, 70, 172, 1);
  static const Color missedAD = Color.fromRGBO(217, 217, 217, 1);
  static const Color appGrayColor = Color.fromRGBO(141, 141, 141, 1);
  static const Color appPurpleColor = Color.fromRGBO(31, 9, 58, 1);
  static const Color adBackgroundColor = Color.fromRGBO(13, 19, 51, 1);
  static const Color adTextColor = Color.fromRGBO(188, 179, 179, 1);
  static const Color adItemBackgroundColor = Color.fromRGBO(33, 32, 32, 1);
  static const Color adButtonActiveColor = Color.fromRGBO(170, 4, 74, 1);
  static const Color adButtonColor = Color.fromRGBO(95, 37, 61, 1);
  static const Color adItemSelectedBackgroundColor =
      Color.fromRGBO(58, 56, 56, 1);
  static const RadialGradient adItemSpecialGradient = RadialGradient(
    colors: [
      Color.fromARGB(255, 255, 229, 157),
      Color.fromARGB(255, 255, 136, 0),
      Color.fromARGB(255, 255, 72, 0),
      Color.fromARGB(255, 255, 38, 0),
    ],
    center: Alignment(0, 0),
    radius: 1.0,
  );
  static Color adItemSpecialShadowColor1 = Colors.red.withOpacity(0.5);
  static Color adItemSpecialShadowColor2 = Colors.orange.withOpacity(0.1);
  static Color adItemSpecialTextShadowColor = Colors.orange;
}
