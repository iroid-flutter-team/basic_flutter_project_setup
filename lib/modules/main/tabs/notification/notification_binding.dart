import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

import 'notification_controller.dart';

class NotificationBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NotificationController>(
          () => NotificationController(
        apiRepository: Get.find(),
      ),
    );
  }
}