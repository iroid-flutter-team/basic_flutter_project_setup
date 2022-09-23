import 'package:home_yogi_flutter/modules/auth/login/user_detail/user_detail_binding.dart';
import 'package:home_yogi_flutter/modules/auth/login/user_detail/user_detail_screen.dart';
import 'package:home_yogi_flutter/modules/main/main_binding.dart';
import 'package:get/get.dart';
import 'package:home_yogi_flutter/modules/auth/login/plan_subscription/plan_subscription_binding.dart';
import 'package:home_yogi_flutter/modules/auth/login/plan_subscription/plan_subscription_screen.dart';
import 'package:home_yogi_flutter/modules/auth/login/sign_in_with_email/sign_in_with_email.dart';
import 'package:home_yogi_flutter/modules/auth/login/sign_in_with_email/sign_in_with_email_binding.dart';
import 'package:home_yogi_flutter/modules/main/main_binding.dart';
import 'package:home_yogi_flutter/modules/main/tabs/checklist/category/category_binding.dart';
import 'package:home_yogi_flutter/modules/main/tabs/checklist/category/category_view.dart';
import 'package:home_yogi_flutter/modules/main/tabs/home/examination/examination_view.dart';
import 'package:home_yogi_flutter/modules/main/tabs/home/examination/question/question_binding.dart';
import 'package:home_yogi_flutter/modules/main/tabs/home/examination/question/question_view.dart';
import 'package:home_yogi_flutter/modules/main/tabs/home/premium/account_manager/account_manager_binding.dart';
import 'package:home_yogi_flutter/modules/main/tabs/home/premium/account_manager/account_manager_view.dart';
import 'package:home_yogi_flutter/modules/main/tabs/home/premium/book_inspection/book_inspection_binding.dart';
import 'package:home_yogi_flutter/modules/main/tabs/home/premium/book_inspection/book_inspection_view.dart';
import 'package:home_yogi_flutter/modules/main/tabs/home/level/level_screen/level_binding.dart';
import 'package:home_yogi_flutter/modules/main/tabs/home/level/level_screen/level_screen.dart';
import 'package:home_yogi_flutter/modules/main/tabs/home/level/show_level_rank/show_level_binging.dart';
import 'package:home_yogi_flutter/modules/main/tabs/home/level/show_level_rank/show_level_rank_screen.dart';
import 'package:home_yogi_flutter/modules/main/tabs/home/progress_report/progress_report_binding.dart';
import 'package:home_yogi_flutter/modules/main/tabs/home/progress_report/progress_report_view.dart';
import 'package:home_yogi_flutter/modules/main/tabs/home/todolist/addtask/add_task_binding.dart';
import 'package:home_yogi_flutter/modules/main/tabs/home/todolist/addtask/add_task_view.dart';
import 'package:home_yogi_flutter/modules/main/tabs/home/todolist/category/task_category_binding.dart';
import 'package:home_yogi_flutter/modules/main/tabs/home/todolist/category/task_category_view.dart';
import 'package:home_yogi_flutter/modules/main/tabs/home/todolist/todolist_binding.dart';
import 'package:home_yogi_flutter/modules/main/tabs/home/todolist/todolist_view.dart';
import 'package:home_yogi_flutter/modules/main/tabs/setting/edit_profile/edit_profile_binding.dart';
import 'package:home_yogi_flutter/modules/main/tabs/setting/edit_profile/edit_profile_view.dart';
import 'package:home_yogi_flutter/modules/main/tabs/setting/refer_and_earn/refer_view.dart';
import 'package:home_yogi_flutter/modules/main/tabs/setting/terms_and_condition/terms_and_condition_view.dart';
import 'package:home_yogi_flutter/modules/main/tabs/setting/voice_assistants/voice_assistants_binding.dart';
import 'package:home_yogi_flutter/modules/main/tabs/setting/voice_assistants/voice_assistants_view.dart';
import 'package:home_yogi_flutter/modules/map/google_map_binding.dart';
import 'package:home_yogi_flutter/modules/map/google_map_view.dart';
import 'package:home_yogi_flutter/modules/onboarding/onboarding_binding.dart';
import 'package:home_yogi_flutter/modules/onboarding/onboarding_view.dart';
import 'package:home_yogi_flutter/modules/splash/splash_binding.dart';
import 'package:home_yogi_flutter/modules/splash/splash_screen.dart';

import '../modules/main/main_tab.dart';
import '../modules/main/tabs/checklist/category/category_binding.dart';
import '../modules/main/tabs/checklist/category/category_view.dart';
import '../modules/main/tabs/home/premium/book_inspection/book_inspection_detail/book_inspection_detail_binding.dart';
import '../modules/main/tabs/home/premium/book_inspection/book_inspection_detail/book_inspection_detail_view.dart';
import '../modules/main/tabs/home/premium/examination_results/examination_results_binding.dart';
import '../modules/main/tabs/home/premium/examination_results/examination_results_view.dart';
import '../modules/main/tabs/home/premium/summary_report/summary_report_binding.dart';
import '../modules/main/tabs/home/premium/summary_report/summary_report_view.dart';
import '../modules/main/tabs/setting/plan_and_billing/plan_and_billing_binding.dart';
import '../modules/main/tabs/setting/plan_and_billing/plan_and_billing_view.dart';
import '../modules/main/tabs/setting/refer_and_earn/refer_binding.dart';
import '../modules/main/tabs/setting/terms_and_condition/terms_and_condition_binding.dart';
import 'routes.dart';

part 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: Routes.SPLASH,
      page: () => SplashScreen(),
      binding: SplashBindings(),
    ),
    GetPage(
      name: Routes.MAIN,
      page: () => MainTab(),
      binding: MainBindings(),
      children: [],
    ),
    GetPage(
      name: Routes.EDIT_PROFILE,
      page: () => EditProfileScreen(),
      binding: EditProfileBinding(),
    ),
    GetPage(
      name: Routes.PLAN_AND_BILLING,
      page: () => PlanAndBillingScreen(
        appBarText: 'Plan & Billing',
      ),
      binding: PlanAndBillingBinding(),
    ),
    GetPage(
      name: Routes.REFER_AND_EARN,
      page: () => ReferScreen(),
      binding: ReferBinding(),
    ),
    GetPage(
      name: Routes.VOICE_ASSISTANTS,
      page: () => VoiceAssistantsScreen(),
      binding: VoiceAssistantsBinding(),
    ),
    GetPage(
      name: Routes.TERMS_CONDITION,
      page: () => TermsConditionScreen(),
      binding: TermsConditionBinding(),
    ),
    GetPage(
      name: Routes.CHECKLIST_CATEGORY,
      page: () => CheckListCategoryView(),
      binding: CheckListCategoryBinding(),
    ),
    GetPage(
      name: Routes.TO_DO_LIST,
      page: () => ToDoListView(),
      binding: ToDoListBinding(),
    ),
    GetPage(
      name: Routes.TASK_CATEGORY,
      page: () => TaskCategoryView(),
      binding: TaskCategoryBinding(),
    ),
    GetPage(
      name: Routes.ADD_TASK,
      page: () => AddTaskView(),
      binding: AddTaskBinding(),
    ),
    GetPage(
      name: Routes.QUESTION,
      page: () => QuestionView(),
      binding: QuestionBinding(),
    ),
    GetPage(
      name: Routes.PROGRESS_REPORT,
      page: () => ProgressReportView(),
      binding: ProgressReportBinding(),
    ),
    GetPage(
      name: Routes.SIGNIN,
      page: () => SignInWithEmailScreen(),
      binding: SignInWithEmailBindings(),
    ),
    GetPage(
      name: Routes.googleMap,
      page: () => GoogleMapView(),
      binding: GoogleMapBinding(),
    ),
    GetPage(
      name: Routes.EXAMINATION,
      page: () => ExaminationView(),
    ),
    GetPage(
      name: Routes.PLAN_SUBSCRIPTION,
      page: () => PlanSubscriptionScreen(),
      binding: PlanAndSubscriptionBindings(),
    ),
    GetPage(
      name: Routes.BOOK_INSPECTION,
      page: () => BookInspectionView(),
      binding: BookInspectionBinding(),
    ),
    GetPage(
      name: Routes.ACCOUNT_MANAGER,
      page: () => AccountManagerView(),
      binding: AccountManagerBinding(),
    ),
    GetPage(
      name: Routes.SHOW_LEVEL,
      page: () => ShowLevelRankScreen(),
      binding: ShowLevelBinding(),
    ),
    GetPage(
      name: Routes.LEVEL,
      page: () => LevelScreen(),
      binding: LevelBinding(),
    ),
    GetPage(
      name: Routes.ON_BOARDING,
      page: () => OnboardingView(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: Routes.USER_DETAIL,
      page: () => UserDetailScreen(),
      binding: UserDetailBindings(),
    ),
    GetPage(
      name: Routes.EXAMINATION_RESULTS,
      page: () => ExaminationResultsView(),
      binding: ExaminationResultsBinding(),
    ),
    GetPage(
      name: Routes.SUMMARY_REPORT,
      page: () => SummaryReportView(),
      binding: SummaryReportBinding(),
    ),
  ];
}
