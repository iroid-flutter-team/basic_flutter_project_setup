import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'add_inspect_controller.dart';

class AddInspectBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddInspectController>(() => AddInspectController(
      apiRepository: Get.find(),
    ),
    );
  }
}