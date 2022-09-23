import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:home_yogi_flutter/shared/utils/math_utils.dart';
import 'package:home_yogi_flutter/shared/widgets/common_boxshadow.dart';
import 'package:home_yogi_flutter/shared/widgets/shadow_input_border.dart';

import '../shared/constants/colors.dart';

class ThemeConfig {
  static ThemeData createTheme({
    required Brightness brightness,
    required Color background,
    required Color primaryText,
    Color? secondaryText,
    required Color accentColor,
    Color? divider,
    Color? buttonBackground,
    required Color buttonText,
    Color? cardBackground,
    Color? disabled,
    required Color error,
  }) {
    return ThemeData(
      scaffoldBackgroundColor: ColorConstants.darkScaffoldBackgroundColor,
      fontFamily: 'Readex Pro',
      brightness: brightness,
      splashColor: Colors.transparent,
      inputDecorationTheme: InputDecorationTheme(
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        border: DecoratedInputBorder(
          child: GradientOutlineInputBorder(
            borderRadius: SmoothBorderRadius(
              cornerRadius: getSize(14),
              cornerSmoothing: 1,
            ),
            width: 2,
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(255, 255, 255, 0.1),
                Color.fromRGBO(255, 255, 255, 0.0),
              ],
              begin: Alignment(-1.0, -4.0),
              end: Alignment(1.0, 4.0),
            ),
          ),
          shadow: CommonBoxShadow.getBlackBackgroundBoxShadow(
            Offset(5, 6),
          ),
        ),
        errorBorder: DecoratedInputBorder(
          child: GradientOutlineInputBorder(
            borderRadius: SmoothBorderRadius(
              cornerRadius: getSize(14),
              cornerSmoothing: 1,
            ),
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(255, 78, 78, 1),
                Color.fromRGBO(255, 78, 78, 1),
              ],
              begin: Alignment(-1.0, -4.0),
              end: Alignment(1.0, 4.0),
            ),
          ),
          shadow: CommonBoxShadow.getBlackBackgroundBoxShadow(
            Offset(5, 6),
          ),
        ),
        enabledBorder: DecoratedInputBorder(
          child: GradientOutlineInputBorder(
            borderRadius: SmoothBorderRadius(
              cornerRadius: getSize(14),
              cornerSmoothing: 1,
            ),
            width: 2,
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(255, 255, 255, 0.1),
                Color.fromRGBO(255, 255, 255, 0.06),
              ],
              begin: Alignment(-1.0, -4.0),
              end: Alignment(1.0, 4.0),
            ),
          ),
          shadow: CommonBoxShadow.getBlackBackgroundBoxShadow(
            Offset(5, 6),
          ),
        ),
        disabledBorder: DecoratedInputBorder(
          child: GradientOutlineInputBorder(
            borderRadius: SmoothBorderRadius(
              cornerRadius: getSize(14),
              cornerSmoothing: 1,
            ),
            width: 2,
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(255, 255, 255, 0.1),
                Color.fromRGBO(255, 255, 255, 0.06),
              ],
              begin: Alignment(-1.0, -4.0),
              end: Alignment(1.0, 4.0),
            ),
          ),
          shadow: CommonBoxShadow.getBlackBackgroundBoxShadow(
            Offset(5, 6),
          ),
        ),
        focusedErrorBorder: DecoratedInputBorder(
          child: GradientOutlineInputBorder(
            borderRadius: SmoothBorderRadius(
              cornerRadius: getSize(14),
              cornerSmoothing: 1,
            ),
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(255, 78, 78, 1),
                Color.fromRGBO(255, 78, 78, 1),
              ],
              begin: Alignment(-1.0, -4.0),
              end: Alignment(1.0, 4.0),
            ),
          ),
          shadow: CommonBoxShadow.getBlackBackgroundBoxShadow(
            Offset(5, 6),
          ),
        ),
        focusedBorder: DecoratedInputBorder(
          child: GradientOutlineInputBorder(
            borderRadius: SmoothBorderRadius(
              cornerRadius: getSize(14),
              cornerSmoothing: 1,
            ),
            width: 2,
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(255, 255, 255, 0.1),
                Color.fromRGBO(255, 255, 255, 0.06),
              ],
              begin: Alignment(-1.0, -4.0),
              end: Alignment(1.0, 4.0),
            ),
          ),
          shadow: CommonBoxShadow.getBlackBackgroundBoxShadow(
            Offset(5, 6),
          ),
        ),
      ),
    );
  }

  static ThemeData get lightTheme => createTheme(
        brightness: Brightness.light,
        background: ColorConstants.lightScaffoldBackgroundColor,
        cardBackground: ColorConstants.secondaryAppColor,
        primaryText: Colors.black,
        secondaryText: Colors.white,
        accentColor: ColorConstants.secondaryAppColor,
        divider: ColorConstants.secondaryAppColor,
        buttonBackground: Colors.black38,
        buttonText: ColorConstants.secondaryAppColor,
        disabled: ColorConstants.secondaryAppColor,
        error: Colors.red,
      );

  static ThemeData get darkTheme => createTheme(
        brightness: Brightness.dark,
        background: ColorConstants.summerGradient1,
        cardBackground: ColorConstants.white,
        primaryText: Colors.white,
        secondaryText: Colors.black,
        accentColor: ColorConstants.white,
        divider: Colors.black45,
        buttonBackground: Colors.white,
        buttonText: ColorConstants.white,
        disabled: ColorConstants.white,
        error: Colors.red,
      );
}
