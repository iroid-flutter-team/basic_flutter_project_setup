import 'package:align_flutter_app/modules/main/tabs/home/examination/summary_report/summary_report_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

class SummaryReportBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SummaryReportController>(() => SummaryReportController(
      apiRepository: Get.find(),
    ),
    );
  }
}