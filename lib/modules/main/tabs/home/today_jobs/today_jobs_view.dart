import 'package:align_flutter_app/modules/main/tabs/home/examination/examination_binding.dart';
import 'package:align_flutter_app/modules/main/tabs/home/examination/examination_view.dart';
import 'package:align_flutter_app/shared/constants/color_constants.dart';
import 'package:align_flutter_app/shared/constants/png_image_constant.dart';
import 'package:align_flutter_app/shared/constants/svg_image_constant.dart';
import 'package:align_flutter_app/shared/widgets/base_elevated_button.dart';
import 'package:align_flutter_app/shared/widgets/base_text.dart';
import 'package:align_flutter_app/shared/widgets/common_appbar.dart';
import 'package:align_flutter_app/shared/widgets/common_container_shadow.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../routes/app_pages.dart';
import '../../../../../shared/utils/math_utils.dart';

class TodayJobsView extends StatelessWidget {
  const TodayJobsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: 'Today jobs',
      ),
      body: _buildMainBody(),
    );
  }

  _buildMainBody() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getSize(25)),
      child: ListView(
        children: [
          BaseText(
            textAlign: TextAlign.center,
            text: "29/04/2022",
            fontSize: 10,
            fontWeight: FontWeight.w600,
            textColor: ColorConstants.white.withOpacity(0.8),
          ),
          _buildListView(),
        ],
      ),
    );
  }
  _buildListView(){
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 2,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(top: getSize(30)),
          child: CommonContainerWithShadow(
            child: Padding(
              padding: EdgeInsets.only(
                left: getSize(20),
                right: getSize(20),
                top: getSize(14),
                bottom: getSize(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        PngImageConstants.user,
                        height: getSize(24),
                      ),
                      SizedBox(
                        width: getSize(20),
                      ),
                      BaseText(
                        text: "John Andrew",
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                      Spacer(),
                      SvgPicture.asset(
                        SvgImageConstants.message,
                        height: getSize(24),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: getSize(30),
                  ),
                  Row(
                    children: [
                      BaseText(
                        text: "Date",
                        fontWeight: FontWeight.w500,
                        fontSize: 10,
                        textColor: ColorConstants.white.withOpacity(0.8),
                      ),
                      SizedBox(
                        width: getSize(74),
                      ),
                      BaseText(
                        text: "Time",
                        fontWeight: FontWeight.w500,
                        fontSize: 10,
                        textColor: ColorConstants.white.withOpacity(0.8),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: getSize(4),
                  ),
                  Row(
                    children: [
                      BaseText(
                        text: "29/04/2022",
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      ),
                      SizedBox(
                        width: getSize(32),
                      ),
                      BaseText(
                        text: "09:00 AM",
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: getSize(10),
                  ),
                  BaseText(
                    text: "Place",
                    fontWeight: FontWeight.w500,
                    fontSize: 10,
                    textColor: ColorConstants.white.withOpacity(0.8),
                  ),
                  SizedBox(
                    height: getSize(4),
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                        SvgImageConstants.location,
                      ),
                      SizedBox(
                        width: getSize(7),
                      ),
                      BaseText(
                        text:
                        "2873 Mulberry Lane, Fort Lauderdale,\nFlorida, 33301",
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: getSize(40),
                  ),
                  BaseElevatedButton(
                    width: Get.width,
                    height: getSize(32),
                    onPressed: () {
                      Get.toNamed(Routes.EXAMINATION);
                      // Get.off(
                      //   ExaminationView(),
                      //   binding: ExaminationBindings(),
                      // );
                    },
                    child: BaseText(
                      text: "Start Examination",
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
