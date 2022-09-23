import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:home_yogi_flutter/shared/utils/math_utils.dart';

import 'common_boxshadow.dart';

class GradiantContainerWithImage extends StatelessWidget {
  final Widget image;
  final List<Color>? gradientBorderColor;
  final List<Color> gradientContainerColor;
  final double? height;
  final double? width;
  final double borderRadius;
  const GradiantContainerWithImage({
    Key? key,
    required this.image,
    this.gradientBorderColor,
    required this.gradientContainerColor,
    this.height,
    this.width,
    this.borderRadius = 14,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        gradient: LinearGradient(
          colors: gradientBorderColor ??
              [
                Color.fromRGBO(255, 255, 255, 0.25),
                Color.fromRGBO(255, 255, 255, 0.01),
              ],
          begin: Alignment(-1.0, -4.0),
          end: Alignment(1.0, 4.0),
        ),
        shadows: [
          CommonBoxShadow.getContainerImageBoxShadow(),
        ],
        shape: SmoothRectangleBorder(
          borderRadius: SmoothBorderRadius.all(
            SmoothRadius(
              cornerRadius: getSize(borderRadius),
              cornerSmoothing: 1,
            ),
          ),
        ),
      ),
      child: Container(
        margin: EdgeInsets.all(getSize(1)),
        height: height ?? getSize(60),
        width: width ?? getSize(60),
        alignment: Alignment.center,
        decoration: ShapeDecoration(
          gradient: LinearGradient(
            colors: gradientContainerColor,
            begin: Alignment(-1.0, -1.0),
            end: Alignment(1.0, 1.0),
          ),
          shape: SmoothRectangleBorder(
            borderRadius: SmoothBorderRadius.all(
              SmoothRadius(
                cornerRadius: getSize(borderRadius),
                cornerSmoothing: 1,
              ),
            ),
          ),
        ),
        child: image,
      ),
    );
  }
}
