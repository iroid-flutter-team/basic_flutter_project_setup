import 'package:get/instance_manager.dart';
import 'package:home_yogi_flutter/modules/main/tabs/setting/setting_controller.dart';

class SettingBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SettingController>(
      () => SettingController(
        repository: Get.find(),
      ),
    );
  }
}
