import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

import 'home_view_controller.dart';

class HomeBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController(
      apiRepository: Get.find(),
    ),
    );
  }
}