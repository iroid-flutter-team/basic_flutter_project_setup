import 'package:get/get.dart';
import 'package:home_yogi_flutter/modules/main/tabs/home/examination/question/takephoto/take_photo_controller.dart';

class TakePhotoBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<TakePhotoController>(() => TakePhotoController(),);
  }

}