import 'package:get/get.dart';

class SplashController extends GetxController {
  RxDouble logoHeight = 200.0.obs;
  @override
  void onInit() {
    super.onInit();

    // Future.delayed(Duration(seconds: 5), () {
    //   if (DependencyInjection.prefs.getString(StorageConstants.token) == null) {
    //     Get.offAllNamed(Routes.LOGIN);
    //   } else {
    //     DependencyInjection.authUserResponse.value.aboutUs == null
    //         ? Get.offAllNamed(Routes.ABOUT_YOU)
    //         : Get.offAllNamed(Routes.MAIN);
    //   }
    // });
  }
}
