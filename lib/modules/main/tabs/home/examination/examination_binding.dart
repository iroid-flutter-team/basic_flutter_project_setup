import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

import 'examination_controller.dart';

class ExaminationBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ExaminationController>(() => ExaminationController());
  }

}