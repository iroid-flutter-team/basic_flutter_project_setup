import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

import '../utils/math_utils.dart';
import 'common_boxshadow.dart';

class BaseElevatedButton extends StatelessWidget {
  final BorderRadiusGeometry? borderRadius;
  final double? width;
  final double height;
  final Gradient? gradient;
  final VoidCallback? onPressed;
  final Widget child;
  final List<BoxShadow>? shadows;

  const BaseElevatedButton({
    Key? key,
    required this.onPressed,
    required this.child,
    this.borderRadius,
    this.width,
    this.height = 44.0,
    this.shadows,
    this.gradient,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final borderRadius = this.borderRadius ?? BorderRadius.circular(14);
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        gradient: gradient ??
            LinearGradient(
              colors: [
                Color.fromRGBO(99, 185, 255, 1),
                Color.fromRGBO(16, 89, 146, 1),
                // Color.fromRGBO(16, 89, 146, 1),
              ],
              begin: Alignment(-1.0, -4.0),
              end: Alignment(1.0, 4.0),
            ),
        boxShadow: shadows ??
            [
              CommonBoxShadow.getBlackBackgroundBoxShadow(
                Offset(5, 6),
              ),
            ],
        borderRadius: borderRadius,
        border: GradientBoxBorder(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(255, 255, 255, 0.25),
              Color.fromRGBO(255, 255, 255, 0.01),
            ],
            begin: Alignment(-1.0, -4.0),
            end: Alignment(1.0, 4.0),
            // begin: Alignment.topLeft,
            // end: Alignment.bottomRight,
          ),
          width: getSize(1.3),
        ),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          primary: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(borderRadius: borderRadius),
        ),
        child: child,
      ),
    );
  }
}
