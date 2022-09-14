import 'package:align_flutter_app/modules/main/tabs/home/examination/question/question_controller.dart';
import 'package:get/get.dart';

class QuestionBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<QuestionController>(() => QuestionController(apiRepository: Get.find(),),);
  }

}