import 'dart:math' as math;
import 'package:flutter/widgets.dart';
import 'card_item.dart';

typedef AnimTransform = Transform Function(
    Widget item,
    double fraction,
    double curveFraction,
    double cardHeight,
    double cardWidth,
    int fromPosition,
    int toPosition);

typedef ZIndexTransform = void Function(
    CardItem card,
    double fraction,
    double curveFraction,
    double cardWidth,
    double cardHeight,
    int fromPosition,
    int toPosition);

const AnimTransform DefaultCommonTransform = _defaultCommonTransform,
    DefaultToBackTransform = _defaultToBackTransform;

const ZIndexTransform DefaultCommonZIndexTransform = _defaultCommonZIndexTransform;


const Curve DefaultCurve = _DefaultCurve();

Transform _defaultCommonTransform(
    Widget item,
    double fraction,
    double curveFraction,
    double cardHeight,
    double cardWidth,
    int fromPosition,
    int toPosition) {
  int positionCount = fromPosition - toPosition;
  double scale = (1 - 0.015 * fromPosition) + (0.1 * fraction * positionCount);
  double translationY = -cardHeight * (1 - scale) * 0.5 -
      cardHeight * (0.02 * fromPosition - 0.02 * fraction * positionCount);

  //print('_defaultCommonTransform() called.. $fromPosition');

  return Transform.translate(
    offset: Offset(0, translationY),
    child: Transform.scale(
      scale: scale,
      child: item,
    ),
  );
}



Transform _defaultToBackTransform(
    Widget item,
    double fraction,
    double curveFraction,
    double cardHeight,
    double cardWidth,
    int fromPosition,
    int toPosition) {
  int positionCount = fromPosition - toPosition;
  double scale = (1 - 0.1 * fromPosition) + (0.1 * fraction * positionCount);
  double rotateX;
  if (fraction < 0.5) {
    rotateX = -math.pi * fraction;
  } else {
    rotateX = -math.pi * (1 - fraction);
  }
  double interpolatorScale =
      1 - 0.1 * fromPosition + (0.1 * curveFraction * positionCount);
  double translationY = -cardHeight * (1 - interpolatorScale) * 0.5 -
      cardHeight * (0.02 * fromPosition - 0.02 * curveFraction * positionCount);

  //print('_defaultToBackTransform() called.. $fromPosition');

  return Transform.translate(
    offset: Offset(0, translationY),
    child: Transform.scale(
      scale: scale,
      child: Transform(
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.002)
          ..rotateX(rotateX),
        alignment: Alignment.center,
        child: item,
      ),
    ),
  );
}


void _defaultCommonZIndexTransform(
    CardItem card,
    double fraction,
    double curveFraction,
    double cardWidth,
    double cardHeight,
    int fromPosition,
    int toPosition) {
  card.zIndex =
      1 + 0.01 * fromPosition + 0.01 * (toPosition - fromPosition) * fraction;
}


class _DefaultCurve extends Curve {
  const _DefaultCurve();

  @override
  double transform(double t) {
    t -= 1.0;
    return t * t * ((-18 + 1) * t + -18) + 1.0;
  }
}
