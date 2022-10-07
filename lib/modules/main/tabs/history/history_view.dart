import 'package:align_flutter_app/modules/main/tabs/history/history_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../../routes/app_pages.dart';
import '../../../../shared/constants/color_constants.dart';
import '../../../../shared/constants/png_image_constant.dart';
import '../../../../shared/constants/svg_image_constant.dart';
import '../../../../shared/utils/math_utils.dart';
import '../../../../shared/widgets/base_text.dart';
import '../../../../shared/widgets/common_appbar.dart';
import '../../../../shared/widgets/common_container_shadow.dart';

class HistoryView extends GetView<HistoryController> {
  const HistoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: 'History',
        leading: Container(),
        actions: [
          InkWell(
            onTap: () {
              Get.toNamed(Routes.REVIEW);
            },
            child: Padding(
              padding: EdgeInsets.only(
                right: getSize(22),
              ),
              child: SvgPicture.asset(
                SvgImageConstants.review,
              ),
            ),
          ),
        ],
      ),
      body: _buildMainBody(),
    );
  }

  _buildMainBody() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getSize(25)),
      child: ListView(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        children: [
          BaseText(
            text: "Today",
            fontSize: 12,
            fontWeight: FontWeight.w600,
            textColor: ColorConstants.white.withOpacity(0.6),
          ),
          SizedBox(
            height: getSize(10),
          ),
          _buildTodayListView(),
          SizedBox(
            height: getSize(30),
          ),
          BaseText(
            text: "Yesterday",
            fontSize: 12,
            fontWeight: FontWeight.w600,
            textColor: ColorConstants.white.withOpacity(0.6),
          ),
          SizedBox(
            height: getSize(10),
          ),
          _buildTodayListView(),
        ],
      ),
    );
  }

  _buildTodayListView() {
    return Obx(() {
      return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: controller.historyResponse.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: CommonContainerWithShadow(
              child: Padding(
                padding: EdgeInsets.only(
                    top: getSize(10),
                    right: getSize(18),
                    left: getSize(18),
                    bottom: getSize(16)),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          height: getSize(35),
                          width: getSize(35),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: NetworkImage(controller.historyResponse[index].profileImage.toString()),
                                fit: BoxFit.cover
                            ),
                          ),
                        ),
                        SizedBox(
                          width: getSize(20),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BaseText(
                              text: controller.historyResponse[index].fullname.toString(),
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                            BaseText(
                              text: controller.historyResponse[index].address.toString(),
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              textColor: ColorConstants.white.withOpacity(0.6),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: getSize(14),
                    ),
                    Divider(
                      thickness: 1.0,
                    ),
                    SizedBox(
                      height: getSize(16),
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(
                          SvgImageConstants.calendar,
                          height: 20,
                        ),
                        SizedBox(
                          width: getSize(8),
                        ),
                        BaseText(
                          text: DateFormat.MMMEd().format(DateTime.fromMillisecondsSinceEpoch(controller.historyResponse[index].inspectionDate?.toInt() ?? 0)),
                          fontSize: 14,
                          textColor: ColorConstants.white.withOpacity(0.8),
                          fontWeight: FontWeight.w500,
                        ),
                        SizedBox(
                          width: getSize(36),
                        ),
                        SvgPicture.asset(
                          SvgImageConstants.clock,
                          height: 20,
                        ),
                        SizedBox(
                          width: getSize(8),
                        ),
                        BaseText(
                          text: DateFormat('hh:mm').format(DateTime.fromMillisecondsSinceEpoch(controller.historyResponse[index].inspectionDate?.toInt() ?? 0),),
                          textColor: ColorConstants.white.withOpacity(0.8),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: getSize(20),
                    ),
                    CommonContainerWithShadow(
                      height: getSize(40),
                      width: getSize(288),
                      backgroundColor: ColorConstants.black,
                      child: Center(
                        child: BaseText(
                          text: "current condition of the home is good",
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    });
  }
}
