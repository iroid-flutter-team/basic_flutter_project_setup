import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'future_jobs_controller.dart';

class FutureJobsBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FutureJobsController>(() => FutureJobsController(
      apiRepository: Get.find(),
    ),
    );
  }
}