import 'package:flutter/material.dart';
import 'package:home_yogi_flutter/shared/shared.dart';
import 'package:home_yogi_flutter/shared/utils/math_utils.dart';

class BaseText extends StatelessWidget {
  final String text;
  final double fontSize;
  final bool isUpperCase;
  final TextAlign textAlign;
  final FontWeight? fontWeight;
  final TextStyle? style;
  final TextOverflow? overflow;
  final Color? textColor;
  final double? letterSpacing;
  final TextDecoration? textDecoration;
  final int? maxLines;
  final String? fontFamily;
  final double? lineHeight;
  final List<Shadow>? shadows;
  const BaseText({
    Key? key,
    required this.text,
    this.textAlign = TextAlign.start,
    this.style,
    this.overflow = TextOverflow.ellipsis,
    this.textColor,
    this.textDecoration = TextDecoration.none,
    this.fontSize = 16,
    this.isUpperCase = false,
    this.fontWeight,
    this.letterSpacing,
    this.maxLines = 5,
    this.fontFamily = 'Readex Pro',
    this.lineHeight,
    this.shadows,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      isUpperCase ? text.toUpperCase() : text,
      textAlign: textAlign,
      textScaleFactor: 1.0,
      overflow: overflow,
      maxLines: maxLines,
      style: style ??
          TextStyle(
            height: lineHeight,
            shadows: shadows,
            color: textColor ?? ColorConstants.white,
            decoration: textDecoration,
            fontFamily: fontFamily,
            fontSize: getFontSize(fontSize),
            letterSpacing: letterSpacing ?? 0.0,
            fontWeight: fontWeight ?? FontWeight.w400,
          ),
    );
  }
}
