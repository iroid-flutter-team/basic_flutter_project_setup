import 'package:get/get.dart';
import '../../../../api/api_repository.dart';
import '../../../../shared/constants/color_constants.dart';
import '../../../../shared/constants/svg_image_constant.dart';
import 'model/notification_model.dart';

class NotificationController extends GetxController {
  final ApiRepository apiRepository;
  NotificationController({required this.apiRepository});
  var title = "Notification".obs;
  var notificationModel = <NotificationModel>[
    NotificationModel(
      image: SvgImageConstants.summer,
      containerGradientColor: [
        ColorConstants.summerGradient1,
        ColorConstants.summerGradient2
      ],
      notificationMainTitle: "Reminder",
      notificationTime: "15 Min ago",
      notificationTitle: "Today Jobs",
      notificationSubTitle:
      "You have until september 1st to completed summer exam. if you complete the exam by the deadline, you will receive coupons and discounts for home depot & more.",
    ),
    NotificationModel(
      image: SvgImageConstants.today,
      containerGradientColor: [
        ColorConstants.todayGradient1,
        ColorConstants.todayGradient2
      ],
      notificationMainTitle: "Completed inspection",
      notificationTime: "20 Min ago",
      notificationTitle: "John Andrew",
      notificationSubTitle: "find leaks near the chimney, around gutters, at flashing points, and close to vents or pipes.",
    ),
    NotificationModel(
      image: SvgImageConstants.summer,
      containerGradientColor: [
        ColorConstants.summerGradient1,
        ColorConstants.summerGradient2
      ],
      isNotificationSeen: true,
      notificationMainTitle: "Review",
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
}
