import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../../shared/constants/color_constants.dart';
import '../../../../shared/constants/svg_image_constant.dart';
import '../../../../shared/utils/math_utils.dart';
import '../../../../shared/widgets/base_text.dart';
import '../../../../shared/widgets/common_appbar.dart';
import '../../../../shared/widgets/common_container_shadow.dart';
import '../../../../shared/widgets/gradiant_container_with_image.dart';
import '../home/examination/examination_view.dart';
import 'notification_controller.dart';
import 'package:timeago/timeago.dart' as timeago;

class NotificationView extends GetView<NotificationController> {
  const NotificationView({Key? key}) : super(key: key);
  final bool showText = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.darkScaffoldBackgroundColor,
      appBar: BaseAppBar(
        title: 'Notification',
        leading: Container(),
      ),
      body: SmartRefresher(
        controller: controller.refreshController,
        onRefresh: (){
          controller.getNotification();
          controller.refreshController.refreshCompleted();
        },
        child: _buildMainBody(),
      ),
    );
  }

  _buildMainBody() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: controller.notificationResponse.length,
      physics: BouncingScrollPhysics(),
      itemBuilder: ((context, index) {
        return Opacity(
          opacity: controller.notificationResponse[index].readAt == null ? 1 : 0.4,
          child: InkWell(
            onTap: () {},
            child: CommonContainerWithShadow(
              margin: EdgeInsets.symmetric(
                horizontal: getSize(30),
                vertical: getSize(12),
              ),
              child: Stack(
                alignment: Alignment.topLeft,
                children: [
                  Visibility(
                    visible: controller.notificationResponse[index].readAt == null,
                    child: Positioned(
                      child: Padding(
                        padding: EdgeInsets.only(top: 4, left: 4),
                        child: Container(
                          height: getSize(8),
                          width: getSize(8),
                          decoration: BoxDecoration(
                            color: ColorConstants.red,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: getSize(14),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: getSize(6),
                        ),
                        Row(
                          children: [
                            BaseText(
                              text: "Reminder",
                              fontSize: 12,
                            ),
                            Spacer(),
                            SvgPicture.asset(
                              SvgImageConstants.clock,
                              color: ColorConstants.white,
                              // height: getSize(10),
                              // width: getSize(10),
                            ),
                            SizedBox(
                              width: getSize(5),
                            ),
                            BaseText(
                              text: timeago.format(DateTime.fromMillisecondsSinceEpoch(
                                  controller.notificationResponse[index].createdAt ?? 0)),
                              fontSize: 12,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: getSize(10),
                        ),
                        BaseText(
                          text: controller.notificationResponse[index].title
                              .toString(),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                        SizedBox(
                          height: getSize(4),
                        ),
                        BaseText(
                          letterSpacing: 0.5,
                          lineHeight: 1.6,
                          text: controller.notificationResponse[index].message
                              .toString(),
                          fontSize: 10,
                          textColor: ColorConstants.white.withOpacity(0.7),
                        ),
                        SizedBox(
                          height: getSize(12),
                        ),
                      ],
                    ),
                  ),
                  Positioned.fill(
                    bottom: getSize(6),
                    child: Padding(
                      padding: EdgeInsets.only(right: 14),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: SvgPicture.asset(
                          SvgImageConstants.arrowRight,
                          height: getSize(10),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
