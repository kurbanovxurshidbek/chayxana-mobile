import 'package:flutter/material.dart';

class AppFonts {
  static const String poppins = "Poppins";

  static TextStyle poppinsBlackItalic(
      {double? fontSize, Color? color, FontStyle? fontStyle}) {
    return TextStyle(
      fontWeight: FontWeight.w900,
      fontFamily: poppins,
      fontStyle: fontStyle,
      color: color,
      fontSize: fontSize,
    );
  }

  static TextStyle chayxanaItemHour() {
    return TextStyle(
      fontFamily: poppins,
      color: Colors.white,
      fontSize: 16,
    );
  }

  static TextStyle chayxanaItemTitle() {
    return TextStyle(
      fontWeight: FontWeight.bold,
      fontFamily: poppins,
      color: Colors.black,
      fontSize: 20,
    );
  }

  static TextStyle chayxanaItemTContent() {
    return TextStyle(
      fontWeight: FontWeight.bold,
      fontFamily: poppins,
      color: Colors.grey,
      fontSize: 16,
    );
  }

  static TextStyle chayxanaItemDistance() {
    return TextStyle(
      fontWeight: FontWeight.bold,
      fontFamily: poppins,
      color: Colors.grey.shade600,
      fontSize: 16,
    );
  }
}
