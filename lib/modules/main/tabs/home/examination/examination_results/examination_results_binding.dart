import 'package:get/get.dart';

import 'examination_results_controller.dart';

class ExaminationResultsBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ExaminationResultsController>(() => ExaminationResultsController(apiRepository:  Get.find()));
  }

}