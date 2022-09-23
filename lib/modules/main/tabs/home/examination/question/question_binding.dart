import 'package:get/get.dart';
import 'package:home_yogi_flutter/modules/main/tabs/home/examination/question/question_controller.dart';

class QuestionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QuestionController>(
      () => QuestionController(
        apiRepository: Get.find(),
      ),
    );
  }
}
