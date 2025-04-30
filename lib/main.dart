import 'dart:developer';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:grape_vender_app/helper/network_listner_helper.dart';
import 'package:grape_vender_app/shared/constants/font_constants.dart';
import 'package:grape_vender_app/shared/utils/common_loader.dart';
import 'package:grape_vender_app/theme/theme_data.dart';
import 'app_binding.dart';
import 'di.dart';
import 'routes/routes.dart';
import 'shared/constants/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    // await Firebase.initializeApp()
    //     .whenComplete(() => log('Firebase Initialized'));
    await DependencyInjection.init();
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(
        // statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light,
      ),
    );
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    const fatalError = true;
    FlutterError.onError = (errorDetails) {
      if (fatalError) {
        // FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
        // ignore: dead_code
      } else {
        // FirebaseCrashlytics.instance.recordFlutterError(errorDetails);
      }
    };

    // await dotenv.load(fileName: ".env");

    runApp(App());
    configLoading();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (DependencyInjection.navigatorKey.currentContext != null) {
        NetworkListener().initialize(
          DependencyInjection.navigatorKey.currentContext!,
        );
      }
    });
  } catch (e) {
    log('Error: $e');
  }

  // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
  //   statusBarColor: Colors.cyan,
  // ));
}

//This is the root of out application
class App extends StatelessWidget {
  // static FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  // static FirebaseAnalyticsObserver observer = FirebaseAnalyticsObserver(
  //   analytics: analytics,
  // );
  final brightness = SchedulerBinding.instance.window.platformBrightness;
  App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.SPLASH,
      defaultTransition: Transition.native,
      navigatorKey: DependencyInjection.navigatorKey,
      getPages: AppPages.routes,
      initialBinding: AppBinding(),
      smartManagement: SmartManagement.keepFactory,
      title: 'Spinnin',
      supportedLocales: const [Locale('en', 'US')],
      theme: ThemeConfig.lightTheme,
      // locale: TranslationService.locale,
      // fallbackLocale: TranslationService.fallbackLocale,
      // translations: TranslationService(),
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
    ..indicatorWidget = CommonLoader()
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
    ..textStyle = TextStyle(
      fontSize: 14,
      color: ColorConstants.white,
      fontFamily: FontConstants.ALBERT_SANS,
      fontWeight: FontWeight.w500,
    )
    ..successWidget = Container(height: 100, width: 100, color: Colors.blue);
}
