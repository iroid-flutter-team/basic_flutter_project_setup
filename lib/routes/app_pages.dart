import 'package:get/get.dart';

import '../modules/auth/login/login_binding.dart';
import '../modules/auth/login/login_view.dart';
import '../modules/auth/otp_verify/otp_verify_binding.dart';
import '../modules/auth/otp_verify/otp_verify_view.dart';
import '../modules/main/main_binding.dart';
import '../modules/main/main_tab.dart';

part 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: Routes.MAIN,
      page: () => MainTab(),
      binding: MainBindings(),
      children: [],
    ),
    GetPage(
      name: Routes.SIGNIN,
      page: () => SignInWithPhoneNumberScreen(),
      binding: SignInWithPhoneNumberBindings(),
    ),
    GetPage(
      name: Routes.OTP_VERIFICATION,
      page: () => OtpVerifyView(),
      binding: OtpVerifyBindings(),
    ),
  ];
}
