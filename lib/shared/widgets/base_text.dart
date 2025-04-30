import 'package:flutter/material.dart';
import 'package:grape_vender_app/shared/constants/color_constants.dart';
import 'package:grape_vender_app/shared/utils/math_utils.dart';

class BaseText extends StatelessWidget {
  final String text;
  final double fontSize;
  final bool isUpperCase;
  final bool showFullText;

  final TextAlign textAlign;
  final FontWeight? fontWeight;
  final TextStyle? style;
  final TextOverflow? overflow;
  final Color? textColor;
  final Color? decorationColor;
  final double? letterSpacing;
  final TextDecoration? textDecoration;
  final int? maxLines;
  final String? fontFamily;
  final double? lineHeight;
  final List<Shadow>? shadows;
  const BaseText({
    super.key,
    required this.text,
    this.textAlign = TextAlign.start,
    this.style,
    this.overflow = TextOverflow.ellipsis,
    this.textColor,
    this.textDecoration = TextDecoration.none,
    this.fontSize = 16,
    this.isUpperCase = false,
    this.decorationColor,
    this.fontWeight,
    this.letterSpacing,
    this.maxLines = 5,
    this.fontFamily = 'SFPro',
    this.lineHeight,
    this.shadows,
    this.showFullText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      isUpperCase ? text.toUpperCase() : text,
      textAlign: textAlign,
      textScaler: const TextScaler.linear(1),
      overflow: showFullText ? null : overflow,
      maxLines: showFullText ? null : maxLines,
      style:
          style ??
          TextStyle(
            height: lineHeight,
            shadows: shadows,
            color: textColor ?? ColorConstants.black,
            decoration: textDecoration,
            decorationColor: decorationColor ?? ColorConstants.primary,
            fontFamily: fontFamily,
            fontSize: getFontSize(fontSize),
            letterSpacing: letterSpacing ?? 0.5,
            fontWeight: fontWeight ?? FontWeight.w400,
          ),
    );
  }
}
