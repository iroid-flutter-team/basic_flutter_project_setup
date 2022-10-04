import 'package:align_flutter_app/modules/main/tabs/setting/terms_and_condition/terms_and_condition_controller.dart';
import 'package:get/get.dart';

class TermsConditionBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<TermsConditionController>(
          () => TermsConditionController(),
    );
  }

}