import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grape_vender_app/modules/splash/splash_controller.dart';
import 'package:grape_vender_app/shared/utils/math_utils.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: FlutterLogo(size: getSize(150))));
  }
}
