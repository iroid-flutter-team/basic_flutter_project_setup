import 'package:align_flutter_app/modules/main/tabs/home/home_view_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../routes/app_pages.dart';
import '../../../../shared/constants/color_constants.dart';
import '../../../../shared/constants/svg_image_constant.dart';
import '../../../../shared/utils/math_utils.dart';
import '../../../../shared/widgets/base_text.dart';
import '../../../../shared/widgets/common_appbar.dart';
import '../../../../shared/widgets/common_container_shadow.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: '',
        leadingWidth: getSize(150),
        leading: Padding(
          padding: EdgeInsets.only(left: getSize(20)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BaseText(
                text: "Good morning",
                fontSize: 12,
                fontWeight: FontWeight.w500,
                textColor: ColorConstants.white.withOpacity(0.6),
              ),
              SizedBox(
                height: getSize(4),
              ),
              Expanded(
                child: BaseText(
                  text: "Albert Flores,",
                  fontSize: 18,
                  maxLines: 1,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: getSize(25), bottom: getSize(10)),
            child: SvgPicture.asset(
              SvgImageConstants.message1,
              height: getSize(30),
            ),
          ),
        ],
      ),
      body: _buildMainBody(),
    );
  }

  _buildMainBody() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getSize(25),
      ),
      child: Column(
        children: [
          SizedBox(
            height: getSize(25),
          ),
          CommonContainerWithShadow(
            width: Get.width,
            height: getSize(38),
            child: Center(
              child: Obx(
                () {
                  return BaseText(
                    text: controller.jobsResponse.value.futureJobs == null
                        ? "let’s help you finish your workday"
                        : controller.jobsResponse.value.futureJobs![0].user
                            .toString(),
                    fontSize: 14,
                  );
                },
              ),
            ),
          ),
          SizedBox(
            height: getSize(30),
          ),
          InkWell(
            onTap: () {
              Get.toNamed(Routes.TODAY_JOBS);
            },
            child: CommonContainerWithShadow(
              height: getSize(74),
              child: Padding(
                padding: EdgeInsets.only(right: getSize(30), left: getSize(12)),
                child: Row(
                  children: [
                    BaseText(
                      text: "Today jobs",
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                    SizedBox(
                      width: getSize(10),
                    ),
                    BaseText(
                      text: "2",
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                    Spacer(),
                    SvgPicture.asset(
                      SvgImageConstants.arrowRight1,
                      height: getSize(20),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: getSize(20),
          ),
          CommonContainerWithShadow(
            height: getSize(74),
            child: Padding(
              padding: EdgeInsets.only(right: getSize(30), left: getSize(12)),
              child: Row(
                children: [
                  BaseText(
                    text: "Future jobs",
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                  SizedBox(
                    width: getSize(10),
                  ),
                  BaseText(
                    text: "0",
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                  Spacer(),
                  SvgPicture.asset(
                    SvgImageConstants.arrowRight1,
                    height: getSize(20),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
