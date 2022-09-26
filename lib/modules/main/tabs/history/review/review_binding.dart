

import 'package:align_flutter_app/modules/main/tabs/history/review/review_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

class ReviewBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReviewController>(
          () => ReviewController(
        apiRepository: Get.find(),
      ),
    );
  }
}