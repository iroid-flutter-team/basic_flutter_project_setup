import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

import 'about_me_controller.dart';

class AboutMeBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AboutMeController>(() => AboutMeController(
      apiRepository: Get.find(),
    ),
    );
  }
}