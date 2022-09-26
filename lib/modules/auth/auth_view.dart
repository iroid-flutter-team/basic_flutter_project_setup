import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../shared/widgets/base_text.dart';
import 'auth_controller.dart';

class AuthView extends GetView<AuthController> {
  const AuthView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: BaseText(text: "text")),
    );
  }
}
