import 'package:get/instance_manager.dart';
import 'package:home_yogi_flutter/modules/main/main_controller.dart';
import 'package:home_yogi_flutter/modules/main/tabs/checklist/checklist_controller.dart';
import 'package:home_yogi_flutter/modules/main/tabs/home/home_controller.dart';
import 'package:home_yogi_flutter/modules/main/tabs/notification/notification_controller.dart';
import 'package:home_yogi_flutter/modules/main/tabs/setting/setting_controller.dart';
import 'package:home_yogi_flutter/modules/splash/splash_controller.dart';

import '../../helper/push_notification_helper.dart';

class MainBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(
      () => SplashController(
        apiRepository: Get.find(),
      ),
    );
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
    Get.lazyPut<SettingController>(
      () => SettingController(
        repository: Get.find(),
      ),
    );
    Get.lazyPut<NotificationController>(
      () => NotificationController(
        apiRepository: Get.find(),
      ),
    );

    Get.lazyPut<CheckListController>(
      () => CheckListController(
        apiRepository: Get.find(),
      ),
    );
    Get.put(
      PushNotificationService(apiRepository: Get.find()).setupInteractedMessage(),
      permanent: true,
    );
  }
}
