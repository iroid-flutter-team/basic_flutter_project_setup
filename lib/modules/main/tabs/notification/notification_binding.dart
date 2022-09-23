import 'package:get/instance_manager.dart';
import 'package:home_yogi_flutter/modules/main/tabs/notification/notification_controller.dart';

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
