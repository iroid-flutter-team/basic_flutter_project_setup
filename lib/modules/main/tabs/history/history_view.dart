
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../routes/app_pages.dart';
import '../../../../shared/constants/color_constants.dart';
import '../../../../shared/constants/png_image_constant.dart';
import '../../../../shared/constants/svg_image_constant.dart';
import '../../../../shared/utils/math_utils.dart';
import '../../../../shared/widgets/base_text.dart';
import '../../../../shared/widgets/common_appbar.dart';
import '../../../../shared/widgets/common_container_shadow.dart';

class HistoryView extends StatelessWidget {
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
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 1,
      itemBuilder: (context, index) {
        return CommonContainerWithShadow(
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
                      ),
                      child: Image.asset(PngImageConstants.user),
                    ),
                    SizedBox(
                      width: getSize(20),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BaseText(
                          text: "John Andrew",
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                        BaseText(
                          text: "Los Angeles",
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
                      text: "Thursday, 12 May",
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
                      text: "11:00",
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
        );
      },
    );
  }
}
