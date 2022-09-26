


import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'login_controller.dart';

class SignInWithPhoneNumberBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignInWithPhoneNumberController>(
          () => SignInWithPhoneNumberController(
        repository: Get.find(),
      ),
    );
  }
}
