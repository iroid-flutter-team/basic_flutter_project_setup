import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../api/api_repository.dart';

class AuthController extends GetxController {
  final ApiRepository repository;
  final formKey = GlobalKey<FormState>();

  AuthController({required this.repository});
}
