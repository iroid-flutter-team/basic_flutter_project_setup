import 'package:flutter/material.dart';

class ColorConstants {
  static Color black = Color(0xFF000000);
  static Color white = Color(0xFFFFFFFF);
  static Color redBorder = Color(0xFFE74C3C);
  //FF0000
  static Color red = Color(0xFFFF0000);
  static Color primary = Color(0xFFFF2E6A);
  static Color green = Color(0xFF2ECC71);
  static Color offWhite = Color(0xffF1F1F1);
  static Color blueGradient = Color(0xff110612);
  static Color greay = Color(0xff999999);
  static Color streamingGrey = Color(0xff121212);
}

Color fromHex(String hexString) {
  final buffer = StringBuffer();
  if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
  buffer.write(hexString.replaceFirst('#', ''));
  return Color(int.parse(buffer.toString(), radix: 16));
}
