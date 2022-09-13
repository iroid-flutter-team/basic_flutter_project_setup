import 'package:align_flutter_app/modules/main/tabs/history/history_binding.dart';
import 'package:align_flutter_app/modules/main/tabs/home/examination/examination_binding.dart';
import 'package:align_flutter_app/modules/main/tabs/home/examination/examination_view.dart';
import 'package:align_flutter_app/modules/main/tabs/home/future_jobs/future_jobs_binding.dart';
import 'package:align_flutter_app/modules/main/tabs/home/future_jobs/future_jobs_view.dart';
import 'package:align_flutter_app/modules/main/tabs/home/home_view.dart';
import 'package:align_flutter_app/modules/main/tabs/home/home_view_binding.dart';
import 'package:align_flutter_app/modules/main/tabs/home/today_jobs/today_jobs_binding.dart';
import 'package:align_flutter_app/modules/main/tabs/home/today_jobs/today_jobs_view.dart';
import 'package:align_flutter_app/modules/main/tabs/notification/notification_binding.dart';
import 'package:align_flutter_app/modules/main/tabs/notification/notification_view.dart';
import 'package:align_flutter_app/modules/main/tabs/setting/setting_view.dart';
import 'package:get/get.dart';

import '../modules/auth/login/login_binding.dart';
import '../modules/auth/login/login_view.dart';
import '../modules/auth/otp_verify/otp_verify_binding.dart';
import '../modules/auth/otp_verify/otp_verify_view.dart';
import '../modules/main/main_binding.dart';
import '../modules/main/main_tab.dart';
import '../modules/main/tabs/history/history_view.dart';
import '../modules/main/tabs/setting/setting_binding.dart';

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
      name: Routes.SIGN_IN,
      page: () => SignInWithPhoneNumberScreen(),
      binding: SignInWithPhoneNumberBindings(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => HomeView(),
      binding: HomeBindings(),
    ),
    GetPage(
      name: Routes.HISTORY,
      page: () => HistoryView(),
      binding: HistoryBindings(),
    ),
    GetPage(
      name: Routes.NOTIFICATION,
      page: () => NotificationView(),
      binding: NotificationBindings(),
    ),
    GetPage(
      name: Routes.SETTING,
      page: () => SettingView(),
      binding: SettingBindings(),
    ),
    GetPage(
      name: Routes.OTP_VERIFICATION,
      page: () => OtpVerifyView(),
      binding: OtpVerifyBindings(),
    ),
    GetPage(
      name: Routes.TODAY_JOBS,
      page: () => TodayJobsView(),
      binding: TodayJobsBindings(),
    ),
    GetPage(
      name: Routes.FUTURE_JOBS,
      page: () => FutureJobsView(),
      binding: FutureJobsBindings(),
    ),
    GetPage(
      name: Routes.EXAMINATION,
      page: () => ExaminationView(),
      binding: ExaminationBindings(),
    ),
  ];
}
