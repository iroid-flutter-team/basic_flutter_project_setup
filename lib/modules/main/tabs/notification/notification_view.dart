import 'package:align_flutter_app/modules/main/tabs/notification/notification_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../shared/constants/color_constants.dart';
import '../../../../shared/constants/svg_image_constant.dart';
import '../../../../shared/utils/math_utils.dart';
import '../../../../shared/widgets/base_text.dart';
import '../../../../shared/widgets/common_appbar.dart';
import '../../../../shared/widgets/common_container_shadow.dart';
import '../../../../shared/widgets/gradiant_container_with_image.dart';
import '../home/examination/examination_view.dart';

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
      body: _buildMainBody(),
    );
  }

  _buildMainBody() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: controller.notificationModel.length,
      physics: BouncingScrollPhysics(),
      itemBuilder: ((context, index) {
        return InkWell(
          onTap: () {},
          child: CommonContainerWithShadow(
            margin: EdgeInsets.symmetric(
              horizontal: getSize(30),
              vertical: getSize(12),
            ),
            child: Stack(
              alignment: Alignment.topLeft,
              children: [
                Positioned(
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
                            text: controller
                                .notificationModel[index].notificationMainTitle,
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
                            text: controller
                                .notificationModel[index].notificationTime,
                            fontSize: 12,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: getSize(10),
                      ),
                      BaseText(
                        text: controller
                            .notificationModel[index].notificationTitle,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                      SizedBox(
                        height: getSize(4),
                      ),
                      BaseText(
                        letterSpacing: 0.5,
                        lineHeight: 1.6,
                        text: controller
                            .notificationModel[index].notificationSubTitle,
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
        );
      }),
    );
  }
}
