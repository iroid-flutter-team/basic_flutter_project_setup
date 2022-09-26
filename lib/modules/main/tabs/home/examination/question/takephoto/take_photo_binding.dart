
import 'package:align_flutter_app/modules/main/tabs/home/examination/question/takephoto/take_photo_controller.dart';
import 'package:get/get.dart';


class TakePhotoBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<TakePhotoController>(() => TakePhotoController(),);
  }

}
