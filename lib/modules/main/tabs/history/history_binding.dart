import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

import 'history_controller.dart';

class HistoryBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HistoryController>(
          () => HistoryController(
        apiRepository: Get.find(),
      ),
    );
  }
}