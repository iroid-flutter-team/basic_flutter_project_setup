import 'package:flutter/material.dart';

class ColorConstants {
  static Color lightScaffoldBackgroundColor = fromHex('#F9F9F9');

  ///Dark Theme
  static Color darkScaffoldBackgroundColor = fromHex('#0E0F13');
  static Color secondaryAppColor = fromHex('#22DDA6');
  static Color white = fromHex('#FFFFFF');
  static Color tipColor = fromHex('#B6B6B6');
  static Color lightGray = Color(0xFFF6F6F6);
  static Color darkGray = Color(0xFF9F9F9F);
  static Color black = Color(0xFF000000);
  static Color blueShadow = fromHex('#86E2FF');
  static Color gradiantBlack1 = Color(0xFF2A2D37);
  static Color gradiantBlack2 = Color(0xFF1D1E24);
  static Color gradiantBlack3 = Color(0xFF0E0F13);
  static Color gradiantShadow = Color(0xCC000000);

  static Color gradiantBlack4 = Color(0xFF191A21);
  static Color gradiantBlack5 = Color(0xFF0E0F13);
  static Color gradiantWhite1 = Color(0x4DFFFFFF);
  static Color gradiantWhite2 = Color(0xFF0E0F13);
  static Color todayGradient1 = Color(0xFFEA5EFF);
  static Color todayGradient2 = Color(0xFF9A00B0);
  static Color gradiantBlue1 = Color(0xFF63B9FF);
  static Color gradiantBlue2 = Color(0xFF105992);
  //static Color gradiantShadow = Color(0x00FFFFFF);
  static Color toListBlack = Color(0xFF1A1C24);
  static Color swipeRedColor = Color(0xFF940000);
  static Color swipeGreenColor = Color(0xFF039400);
  static Color greenColor = Color(0xFF039400);

  static Color darkContainerBlack = Color(0xFF131418);

  static Color gradiantRed1 = Color(0xFFFF6363);
  static Color gradiantRed2 = Color(0xFFFF6363);
  static Color gradiantRed3 = Color(0xFF921010);
  static Color red = Color(0xFFFF0000);
  static Color red1 = Color(0xFFFF6363);
  static Color red2 = Color(0xFFFF6363);
  static Color red3 = Color(0xFF921010);
  static Color red4 = Color(0xFFB00000);
  static Color circleBlue = Color(0xFF33DAFF);
  static Color switchBlack = Color(0xFF787878);
  static Color lightYellow = Color(0xFFD7B481);
  static Color lightOrange = Color(0xFFED7024);
  static Color yellow = Color(0xFFF9E47C);
  static Color dialogBorderYellow = Color(0xFFFFE500);

  static final gradientPinkStart = Color(0xffEA5EFF);
  static final gradientPinkEnd = Color(0xff9A00B0);

  static final gradientPurpleStart = Color(0xff6E6CE2);
  static final gradientPurpleEnd = Color(0xff3331A9);

  static final gradientGreenStart = Color(0xff8CE485);
  static final gradientGreenEnd = Color(0xff1B6815);

  static final dialogBlack = Color(0xff111111);
  static final silverRankColor = Color(0xffCCCCCC);

  static final bronzeRankColor = Color(0xffFDBC76);

  //random

  static final backgroundColor = Color(0xFF2c3135);
  static final highlightColor = Colors.white.withOpacity(0.05);
  static const shadowColor = Colors.black87;

  static final softHighlightColor =
  ColorConstants.highlightColor.withOpacity(0.03);
  static final softShadowColor = ColorConstants.shadowColor.withOpacity(0.3);

  static final gradientStart = Color(0xFFf1da95);
  static final gradientMiddle = Color(0xFFfe948a);
  static final gradientEnd = Color(0xFFb24fce);
  static Color progressColor = Color(0xFF86E2FF);
  static Color progressBackGroundColor = Color(0xFF3D4D71);

  // Examination
  static Color summerGradient1 = Color(0xFFFFC876);
  static Color summerGradient2 = Color(0xFFAE6902);
  static Color fallGradiant1 = Color(0xFFFB737E);
  static Color fallGradiant2 = Color(0xFF97000D);
  static Color winterGradiant1 = Color(0xFF8DE4FF);
  static Color winterGradiant2 = Color(0xFF005F7C);
  static Color springGradiant1 = Color(0xFFFE83DC);
  static Color springlGradiant2 = Color(0xFF900068);

  static Color deleteColorRed = Color(0xff940000);
  static Color editColorGreen = Color(0xff039400);

  // To Do list
  static Color indoorGradiant1 = Color(0xFF6E6CE2);
  static Color indoorGradiant2 = Color(0xFF3331A9);
  static Color outdoorGradiant1 = Color(0xFF8CE485);
  static Color outdoorGradiant2 = Color(0xFF1B6815);
  static Color dialogBorderGreen = Color(0xFF6CC644);
  // static Color gradiantRed3 = Color(0xFF921010);
  // static Color gradiantRed3 = Color(0xFF921010);
  // static Color gradiantRed3 = Color(0xFF921010);
  // static Color gradiantRed3 = Color(0xFF921010);
  // static Color red1 = Color(0xFFFF6363);
  // static Color red2 = Color(0xFFFF6363);
  // static Color red3 = Color(0xFF921010);

  // static final gradientPinkStart = Color(0xffEA5EFF);
  // static final gradientPinkEnd = Color(0xff9A00B0);

  // static final gradientPurpleStart = Color(0xff6E6CE2);
  // static final gradientPurpleEnd = Color(0xff3331A9);

  // static final gradientGreenStart = Color(0xff8CE485);
  // static final gradientGreenEnd = Color(0xff1B6815);

  // static final dialogBlack = Color(0xff111111);

  static final gradientPurpleLightStart = Color(0xffE1E2F6);
  static final gradientPurpleLightEnd = Color(0xff3C3A8F);

  static final gradientOrangeLightStart = Color(0xffF8EFE2);
  static final gradientOrangeLightEnd = Color(0xffB78040);

  static final buttonSubmittedStart = Color(0xff279500);
  static final buttonSubmittedEnd = Color(0xff266400);

  // Premium Services
  static final bookInspectionGradientStart = Color(0xFFFF76D0);
  static final bookInspectionGradientEnd = Color(0xFF870059);

  static final accountManagerGradientStart = Color(0xFF80E3FF);
  static final accountManagerGradientEnd = Color(0xFF005168);

  static final examinationGradientStart = Color(0xFFAEFF79);
  static final examinationGradientEnd = Color(0xFF2D7200);

  static final summaryGradientStart = Color(0xFFFFAC77);
  static final summaryGradientEnd = Color(0xFF8C3700);
}

Color fromHex(String hexString) {
  final buffer = StringBuffer();
  if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
  buffer.write(hexString.replaceFirst('#', ''));
  return Color(int.parse(buffer.toString(), radix: 16));
}

// Color fromHex(String hex) {
//   assert(RegExp(r'^#([0-9a-fA-F]{6})|([0-9a-fA-F]{8})$').hasMatch(hex),
//       'hex color must be #rrggbb or #rrggbbaa');

//   return Color(
//     int.parse(hex.substring(1), radix: 16) +
//         (hex.length == 7 ? 0xff000000 : 0x00000000),
//   );
// }
