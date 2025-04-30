import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:grape_vender_app/modules/splash/splash_binding.dart';
import 'package:grape_vender_app/modules/splash/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: Routes.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
      children: const [],
    ),
  ];
}
