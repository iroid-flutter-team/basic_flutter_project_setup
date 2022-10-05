import 'package:align_flutter_app/theme/theme_data.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app_binding.dart';
import 'di.dart';
import 'lang/lang.dart';
import 'routes/routes.dart';
import 'shared/constants/constants.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
 // Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
  await DenpendencyInjection.init();

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.light.copyWith(
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.dark,
      statusBarColor: Colors.transparent,
    ),
  );

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(App());
  configLoading();
}

//This is the root of out application
class App extends StatelessWidget {
  final brightness = SchedulerBinding.instance.window.platformBrightness;

  App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final prefs = Get.find<SharedPreferences>();

    print("Token : ${prefs.getString(StorageConstants.token)}");
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.MAIN,
      defaultTransition: Transition.native,
      getPages: AppPages.routes,
      initialBinding: AppBinding(),
      smartManagement: SmartManagement.keepFactory,
      title: 'Home Yogi Account Manager',
      theme: ThemeConfig.darkTheme,
      locale: TranslationService.locale,
      fallbackLocale: TranslationService.fallbackLocale,
      translations: TranslationService(),
      builder: EasyLoading.init(),
    );
  }
}

void configLoading() {
  EasyLoading.instance
    ..indicatorType = EasyLoadingIndicatorType.threeBounce
    ..loadingStyle = EasyLoadingStyle.custom
    // ..indicatorSize = 45.0
    ..radius = 10.0
    ..indicatorSize = 20
    // ..progressColor = Colors.yellow
    ..backgroundColor = ColorConstants.black
    ..indicatorColor = ColorConstants.white
    ..textColor = ColorConstants.white
    ..maskColor = ColorConstants.black.withOpacity(0.5)
    ..maskType = EasyLoadingMaskType.custom
    ..toastPosition = EasyLoadingToastPosition.bottom
    // ..maskColor = Colors.red
    ..userInteractions = false
    ..dismissOnTap = false
    ..animationStyle = EasyLoadingAnimationStyle.scale
    ..successWidget = Container(
      height: 100,
      width: 100,
      color: Colors.blue,
    );
}
