import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ColorService {
  // * For UI
  static Color main = Colors.deepPurpleAccent.shade700; // Color(0xFF6200EA)
  static Color lightMain1 = Colors.deepPurpleAccent.shade400;
  static Color lightMain2 = Colors.deepPurpleAccent.shade200;
  static const white = Colors.white;
  static Color lightGrey1 = Colors.grey.shade300;
  static Color green = CupertinoColors.systemGreen;
  static Color red = CupertinoColors.systemRed;

  // * For theme
  static const grey = Colors.grey;
  static const Color black = Colors.black;
  static const Color lightBlack = Colors.black54;
  static const Color backgroundDarkTheme = Color(0xff212121);
  static const Color backgroundLightTheme = Color(0xffe5e5e5);
}