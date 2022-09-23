import 'package:get/get.dart';
import 'package:home_yogi_flutter/api/api_repository.dart';
import 'package:home_yogi_flutter/models/response/home/notification_response.dart';
import 'package:home_yogi_flutter/modules/main/tabs/notification/model/notification_model.dart';
import 'package:home_yogi_flutter/shared/constants/colors.dart';
import 'package:home_yogi_flutter/shared/constants/constants.dart';
import 'package:home_yogi_flutter/shared/constants/svg_image_constant.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../setting/edit_profile/edit_profile_controller.dart';

class NotificationController extends GetxController {
  final ApiRepository apiRepository;
  NotificationController({required this.apiRepository});
  EditProfileController editProfileController = Get.put(EditProfileController(repository: Get.find()));
  final RefreshController refreshController = RefreshController();
  var notificationResponse = <NotificationResponse>[].obs;
  var title = "Notification".obs;
  final page = 1.obs;
  final perPage = 25.obs;
  var notificationModel = <NotificationModel>[
    NotificationModel(
      image: SvgImageConstants.summer,
      containerGradientColor: [
        ColorConstants.summerGradient1,
        ColorConstants.summerGradient2
      ],
      notificationMainTitle: "Examination",
      notificationTime: "15 Min ago",
      notificationTitle: "Summer Examination",
      notificationSubTitle:
          "You have until september 1st to completed summer exam. if you complete the exam by the deadline, you will receive coupons and discounts for home depot & more.",
    ),
    NotificationModel(
      image: SvgImageConstants.today,
      containerGradientColor: [
        ColorConstants.todayGradient1,
        ColorConstants.todayGradient2
      ],
      notificationMainTitle: "Reminder",
      notificationTime: "20 Min ago",
      notificationTitle: "Roof leaks",
      notificationSubTitle:
          "find leaks near the chimney, around gutters, at flashing points, and close to vents or pipes.",
    ),
    NotificationModel(
      image: SvgImageConstants.summer,
      containerGradientColor: [
        ColorConstants.summerGradient1,
        ColorConstants.summerGradient2
      ],
      isNotificationSeen: true,
      notificationMainTitle: "Examination",
      notificationTime: "1 Hr ago",
      notificationTitle: "Summer Examination",
      notificationSubTitle:
          "You have until september 1st to completed summer exam. if you complete the exam by the deadline, you will receive coupons and discounts for home depot & more.",
    ),
    NotificationModel(
      image: SvgImageConstants.today,
      containerGradientColor: [
        ColorConstants.todayGradient1,
        ColorConstants.todayGradient2
      ],
      isNotificationSeen: true,
      notificationMainTitle: "Reminder",
      notificationTime: "1 Hr ago",
      notificationTitle: "Roof leaks",
      notificationSubTitle:
          "find leaks near the chimney, around gutters, at flashing points, and close to vents or pipes.",
    ),
  ].obs;

  getNotification() async {
    var res = await apiRepository.getNotification(page.value,perPage.value);
    if (res != null && res.isNotEmpty) {
      notificationResponse.value = res;
    }
    print("notificationResponseList===============${notificationResponse.map((e) => e.toJson())}");
  }

  readNotification(int id) async{
     var get = await apiRepository.readNotification({}, id);
     print(" readNotification===========${get?.dioMessage}");
  }

  @override
  void onInit() {
     getNotification();
    super.onInit();
  }
}
