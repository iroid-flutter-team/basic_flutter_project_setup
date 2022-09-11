import 'package:align_flutter_app/modules/auth/otp_verify/otp_verify_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

class OtpVerifyBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OtpVerifyController>(
          () => OtpVerifyController(
        repository: Get.find(),
      ),
    );
  }
}