
import 'package:align_flutter_app/modules/main/tabs/home/today_jobs/today_jobs_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

class TodayJobsBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TodayJobsController>(() => TodayJobsController(
        apiRepository: Get.find(),
      ),
    );
  }
}