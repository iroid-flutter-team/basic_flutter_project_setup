import 'package:align_flutter_app/modules/main/tabs/history/history_controller.dart';
import 'package:align_flutter_app/modules/main/tabs/home/home_view_controller.dart';
import 'package:align_flutter_app/modules/main/tabs/notification/notification_controller.dart';
import 'package:align_flutter_app/modules/main/tabs/setting/setting_controller.dart';
import 'package:get/instance_manager.dart';

import 'main_controller.dart';

class MainBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainController>(
      () => MainController(
        apiRepository: Get.find(),
      ),
    );
    Get.lazyPut<HomeController>(
          () => HomeController(
        apiRepository: Get.find(),
      ),
    );
    Get.lazyPut<HistoryController>(
          () => HistoryController(
        apiRepository: Get.find(),
      ),
    );
    Get.lazyPut<NotificationController>(
          () => NotificationController(
        apiRepository: Get.find(),
      ),
    );
    Get.lazyPut<SettingController>(
          () => SettingController(
        apiRepository: Get.find(),
      ),
    );
  }
}
