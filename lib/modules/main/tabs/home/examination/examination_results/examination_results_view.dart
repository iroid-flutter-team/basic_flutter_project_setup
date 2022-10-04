import 'package:align_flutter_app/routes/app_pages.dart';
import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../../../../shared/utils/math_utils.dart';
import '../../../../../../shared/constants/svg_image_constant.dart';
import '../../../../../../shared/widgets/base_elevated_button.dart';
import '../../../../../../shared/widgets/base_text.dart';
import '../../../../../../shared/widgets/common_appbar.dart';
import '../../../../../../shared/widgets/common_container_shadow.dart';
import 'examination_results_controller.dart';

class ExaminationResultsView extends GetView<ExaminationResultsController> {
  const ExaminationResultsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: "Examination results",
      ),
      body: _buildMainBody(),
    );
  }

  _buildMainBody() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getSize(24)),
      child: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          BaseText(
            text: "Report",
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
          SizedBox(
            height: getSize(20),
          ),
          CommonContainerWithShadow(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getSize(14), vertical: getSize(22)),
              child: Column(
                children: [
                  SvgPicture.asset(
                    SvgImageConstants.good,
                  ),
                  SizedBox(
                    height: getSize(20),
                  ),
                  BaseText(
                    text: "current condition of the home is good",
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: getSize(30),
          ),
          BaseText(
            text: "Results",
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
          SizedBox(
            height: getSize(10),
          ),
          _buildListView(),
          SizedBox(
            height: getSize(20),
          ),
          BaseElevatedButton(
            onPressed: () {
              Get.toNamed(Routes.SUMMARY_REPORT);
            },
            child: BaseText(
              text: "GO TO SUMMARY REPORT",
            ),
          ),
          SizedBox(
            height: getSize(20),
          ),
        ],
      ),
    );
  }

  _buildListView(){
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: controller.examinationResultsModel.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: getSize(20),
          ),
          child: CommonContainerWithShadow(
            child: Padding(
              padding: EdgeInsets.all(
                getSize(12),
              ),
              child: Row(
                children: [
                  Image.asset(
                    controller.examinationResultsModel[index].image,
                    height: getSize(110),
                  ),
                  SizedBox(
                    width: getSize(12),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: Get.width - getSize(200),
                        child: Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: [
                            BaseText(
                              text: controller
                                  .examinationResultsModel[index]
                                  .titleText,
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                            ),
                            SvgPicture.asset(
                              controller.examinationResultsModel[index]
                                  .reactionImage,
                              height: getSize(20),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: getSize(12),
                      ),
                      BaseText(
                        text: controller
                            .examinationResultsModel[index].reactionText,
                        fontSize: 14,
                      ),
                      SizedBox(
                        height: getSize(30),
                      ),
                      CommonContainerWithShadow(
                        borderRadius: SmoothBorderRadius.all(
                          SmoothRadius(
                            cornerRadius: getSize(8),
                            cornerSmoothing: 1,
                          ),
                        ),
                        backgroundColor: Colors.black,
                        height: getSize(30),
                        width: Get.width - getSize(200),
                        child: Center(
                          child: BaseText(
                            text: "CREATE TO DO LIST",
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
