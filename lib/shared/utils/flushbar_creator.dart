import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:grape_vender_app/shared/constants/color_constants.dart';

Flushbar showError({
  required String message,
  String? title,
  Duration duration = const Duration(seconds: 3),
}) {
  return Flushbar(
    title: title,
    message: message,
    icon: Icon(Icons.warning, size: 28.0, color: Colors.white),
    leftBarIndicatorColor: Colors.red[300],
    backgroundColor: ColorConstants.redBorder,
    duration: duration,
    flushbarPosition: FlushbarPosition.TOP,
  );
}

Flushbar showSuccess({
  required String message,
  String? title,
  Duration duration = const Duration(seconds: 2),
}) {
  return Flushbar(
    title: title,
    message: message,
    icon: Icon(Icons.check_circle, color: ColorConstants.white),
    leftBarIndicatorColor: ColorConstants.green,
    backgroundColor: ColorConstants.green,
    flushbarPosition: FlushbarPosition.TOP,
    duration: duration,
    flushbarStyle: FlushbarStyle.FLOATING,
  );
}
