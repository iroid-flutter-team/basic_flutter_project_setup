
import 'package:align_flutter_app/modules/main/tabs/setting/setting_controller.dart';
import 'package:get/get.dart';

class SettingBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SettingController>(() => SettingController(
      apiRepository: Get.find(),
      ),
    );
  }
}