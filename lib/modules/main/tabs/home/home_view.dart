import 'package:align_flutter_app/modules/main/tabs/home/today_jobs/today_jobs_binding.dart';
import 'package:align_flutter_app/modules/main/tabs/home/today_jobs/today_jobs_view.dart';
import 'package:align_flutter_app/shared/constants/color_constants.dart';
import 'package:align_flutter_app/shared/constants/png_image_constant.dart';
import 'package:align_flutter_app/shared/constants/svg_image_constant.dart';
import 'package:align_flutter_app/shared/utils/math_utils.dart';
import 'package:align_flutter_app/shared/widgets/base_text.dart';
import 'package:align_flutter_app/shared/widgets/common_appbar.dart';
import 'package:align_flutter_app/shared/widgets/common_container_shadow.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../routes/app_pages.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: '',
        leadingWidth: getSize(150),
        leading: Padding(
          padding: EdgeInsets.only(left: getSize(25)),
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
              BaseText(
                text: "Albert Flores,",
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ],
          ),
        ),
        actions: [
          Padding(
            padding:  EdgeInsets.only(right: getSize(25)),
            child: SvgPicture.asset(
              SvgImageConstants.message,
              height: getSize(25),
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
              child: BaseText(
                text: "let’s help you finish your workday",
                fontSize: 14,
              ),
            ),
          ),
          SizedBox(
            height: getSize(30),
          ),
          InkWell(
            onTap: () {
              Get.toNamed(Routes.TODAY_JOBS);
              // Get.off(
              //   TodayJobsView(),
              //   binding: TodayJobsBindings(),
              // );
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
