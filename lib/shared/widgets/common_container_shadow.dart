import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:home_yogi_flutter/shared/shared.dart';
import 'package:home_yogi_flutter/shared/utils/math_utils.dart';
import 'package:home_yogi_flutter/shared/widgets/common_boxshadow.dart';

class CommonContainerWithShadow extends StatelessWidget {
  final double? height;
  final double? width;
  final Widget child;
  final List<BoxShadow>? shadows;
  final Color? backgroundColor;
  final double cornerRadius;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final SmoothBorderRadius? borderRadius;
  final Gradient? borderGradient;

  const CommonContainerWithShadow({
    Key? key,
    this.height,
    this.width,
    this.shadows,
    required this.child,
    this.backgroundColor,
    this.padding,
    this.margin,
    this.cornerRadius = 14,
    this.borderRadius,
    this.borderGradient,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: margin,
      decoration: ShapeDecoration(
        shadows: shadows ??
            [
              CommonBoxShadow.getBlackBackgroundBoxShadow(Offset(5, 6)),
            ],
        gradient: borderGradient ??
            LinearGradient(
              colors: [
                Color.fromRGBO(255, 255, 255, 0.1),
                Color.fromRGBO(255, 255, 255, 0.06),
              ],
              begin: Alignment(-1.0, -4.0),
              end: Alignment(1.0, 4.0),
            ),
        shape: SmoothRectangleBorder(
          borderRadius: borderRadius ??
              SmoothBorderRadius.all(
                SmoothRadius(
                  cornerRadius: getSize(cornerRadius),
                  cornerSmoothing: 1,
                ),
              ),
        ),
      ),
      child: Container(
        padding: padding,
        margin: EdgeInsets.all(getSize(1.3)),
        decoration: ShapeDecoration(
          color: backgroundColor ?? ColorConstants.darkContainerBlack,
          shape: SmoothRectangleBorder(
            borderRadius: borderRadius ??
                SmoothBorderRadius.all(
                  SmoothRadius(
                    cornerRadius: getSize(cornerRadius),
                    cornerSmoothing: 1,
                  ),
                ),
          ),
        ),
        child: child,
      ),
    );
  }
}

class CommonCircleContainerWithShadow extends StatelessWidget {
  final double? height;
  final double? width;
  final Widget child;
  final List<BoxShadow>? shadows;
  final Color? backgroundColor;
  final double cornerRadius;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  const CommonCircleContainerWithShadow({
    Key? key,
    this.height,
    this.width,
    this.shadows,
    required this.child,
    this.backgroundColor,
    this.padding,
    this.margin,
    this.cornerRadius = 14,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          CommonBoxShadow.getBlackBackgroundBoxShadow(
            Offset(5, 6),
          ),
        ],
        border: GradientBoxBorder(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(255, 255, 255, 0.17),
              Color.fromRGBO(255, 255, 255, 0.0),
              // Color.fromRGBO(255, 255, 255, 1),
            ],
            begin: Alignment(-1.0, -4.0),
            end: Alignment(1.0, 4.0),
          ),
          width: 1.3,
        ),
        gradient: LinearGradient(
          colors: [
            Color.fromRGBO(255, 255, 255, 0.15),
            Color.fromRGBO(255, 255, 255, 0.0),
            //  Color.fromRGBO(255, 255, 255, 0.0),
          ],
          begin: Alignment(-1.0, -4.0),
          end: Alignment(1.0, 4.0),
        ),
      ),
      child: child,
    );
  }
}

class CommonSelectedContainerWithShadow extends StatelessWidget {
  final double? height;
  final double? width;
  final Widget child;
  final List<BoxShadow>? shadows;
  final Color? backgroundColor;
  final double cornerRadius;
  final bool showBorder;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Gradient? borderGradient;
  final Gradient? backgroundGradient;

  const CommonSelectedContainerWithShadow({
    Key? key,
    this.height,
    this.width,
    this.shadows,
    required this.child,
    this.backgroundColor,
    this.padding,
    this.margin,
    this.cornerRadius = 14,
    this.borderGradient,
    this.backgroundGradient,
    this.showBorder = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      height: height,
      width: width,
      decoration: ShapeDecoration(
        shadows: showBorder
            ? [
                CommonBoxShadow.getBlackBackgroundBoxShadow(Offset(5, 6)),
              ]
            : [],
        gradient: showBorder
            ? borderGradient ??
                LinearGradient(
                  colors: [
                    Color.fromRGBO(255, 255, 255, 0.1),
                    Color.fromRGBO(255, 255, 255, 0.06),
                    //Color.fromRGBO(99, 185, 255, 1),
                    //Color.fromRGBO(16, 89, 146, 1),
                  ],
                  begin: Alignment(-1.0, -4.0),
                  end: Alignment(1.0, 4.0),
                )
            : null,
        shape: SmoothRectangleBorder(
          borderRadius: SmoothBorderRadius.all(
            SmoothRadius(
              cornerRadius: showBorder ? getSize(cornerRadius) : 0,
              cornerSmoothing: 1,
            ),
          ),
        ),
      ),
      child: Container(
        margin: EdgeInsets.all(getSize(2)),
        padding: padding,
        decoration: ShapeDecoration(
          gradient: showBorder
              ? backgroundGradient ??
                  LinearGradient(
                    colors: [
                      ColorConstants.darkContainerBlack,
                      ColorConstants.darkContainerBlack,
                    ],
                    begin: Alignment(-1.0, -4.0),
                    end: Alignment(1.0, 4.0),
                  )
              : null,
          shape: SmoothRectangleBorder(
            borderRadius: SmoothBorderRadius.all(
              SmoothRadius(
                cornerRadius: showBorder ? getSize(cornerRadius) : 0,
                cornerSmoothing: 1,
              ),
            ),
          ),
        ),
        child: child,
      ),
    );
  }
}
