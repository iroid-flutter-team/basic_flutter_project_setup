import 'package:align_flutter_app/routes/app_pages.dart';
import 'package:align_flutter_app/shared/constants/color_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
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
    return Obx(() {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: getSize(24)),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            SizedBox(
              height: getSize(20),
            ),
            BaseText(
              text: "Report",
              fontWeight: FontWeight.w600,
              fontSize: 12,
              textColor: ColorConstants.white.withOpacity(0.6),
            ),
            SizedBox(
              height: getSize(10),
            ),
            CommonContainerWithShadow(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getSize(14), vertical: getSize(22)),
                child: getAverageData(),
              ),
            ),
            SizedBox(
              height: getSize(30),
            ),
            BaseText(
              text: "Results",
              fontSize: 12,
              fontWeight: FontWeight.w600,
              textColor: ColorConstants.white.withOpacity(0.6),
            ),
            SizedBox(
              height: getSize(10),
            ),
               controller.resultsResponse.value.results?.length != null
                  ? _buildListView()
                  : Container(),

            SizedBox(
              height: getSize(20),
            ),
            BaseElevatedButton(
              onPressed: () {

                if(controller.resultsResponse.value.averageRating>3){
                  EasyLoading.showToast("Your current home condition is good, so we unable to create summary report ");
                }else{
                  Get.toNamed(Routes.SUMMARY_REPORT, arguments: controller.jobId);
                }
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
    });
  }

  Widget getAverageData() {
    var averageRating = controller.resultsResponse.value.averageRating;
    print("averageRating=====$averageRating");

    if (averageRating == null) {
      return Container();
    }

    var emojiImage = '';
    var text = '';

    if (averageRating >= 0 && averageRating <= 1) {
      emojiImage = SvgImageConstants.very_poor;
      text = "Current condition of the home is very poor";
    } else if (averageRating > 1 && averageRating <= 2) {
      emojiImage = SvgImageConstants.poor;
      text = "Current condition of the home is poor";
    } else if (averageRating > 2 && averageRating <= 3) {
      emojiImage = SvgImageConstants.average;
      text = "Current condition of the home is average";
    } else if (averageRating > 3 && averageRating <= 4) {
      emojiImage = SvgImageConstants.good;
      text = "Current condition of the home is good";
    } else if (averageRating > 4 && averageRating <= 5) {
      emojiImage = SvgImageConstants.excellent;
      text = "Current condition of the home is excellent";
    }else{
      return Container();
    }
    return Column(
      children: [
        SvgPicture.asset(emojiImage),
        SizedBox(
          height: getSize(20)
        ),
        BaseText(
          text: text,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        )
      ],
    );

  }

  _buildListView() {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      //itemCount: 5,
      itemCount: controller.resultsResponse.value.results?.length,
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
                  Container(
                    height: getSize(110),
                    width: getSize(110),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      image: DecorationImage(
                          image: NetworkImage(controller.resultsResponse.value
                                  .results?[index].images?[0].image
                                  .toString() ??
                              ""),
                          fit: BoxFit.cover),
                    ),
                  ),
                  // Image.network(
                  //   controller.resultsResponse.value.results?[index].images?[0].image.toString() ?? "",
                  //   height: getSize(110),
                  //   fit: BoxFit.cover,
                  // ),
                  // Image.asset(
                  //   PngImageConstants.bez,
                  //   height: getSize(110),
                  // ),
                  SizedBox(
                    width: getSize(12),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: Get.width - getSize(200),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            BaseText(
                              //text: "dscds",
                              text: controller.resultsResponse.value
                                      .results?[index].title
                                      .toString() ??
                                  "",
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                            ),
                            SvgPicture.asset(
                              controller.resultsResponse.value.results?[index]
                                          .rating ==
                                      0
                                  ? SvgImageConstants.very_poor
                                  : controller.resultsResponse.value
                                              .results?[index].rating ==
                                          1
                                      ? SvgImageConstants.poor
                                      : controller.resultsResponse.value
                                                  .results?[index].rating ==
                                              2
                                          ? SvgImageConstants.average
                                          : controller.resultsResponse.value
                                                      .results?[index].rating ==
                                                  3
                                              ? SvgImageConstants.good
                                              : controller
                                                              .resultsResponse
                                                              .value
                                                              .results?[index]
                                                              .rating ==
                                                          4 ||
                                                      controller
                                                              .resultsResponse
                                                              .value
                                                              .results?[index]
                                                              .rating ==
                                                          4.5
                                                  ? SvgImageConstants.excellent
                                                  : SvgImageConstants.good,
                              height: getSize(20),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: getSize(12),
                      ),
                      BaseText(
                        text: controller.resultsResponse.value.results?[index]
                                    .rating ==
                                0
                            ? "Very poor conditon"
                            : controller.resultsResponse.value.results?[index]
                                        .rating ==
                                    1
                                ? "Poor condition"
                                : controller.resultsResponse.value
                                            .results?[index].rating ==
                                        2
                                    ? "Average condition"
                                    : controller.resultsResponse.value
                                                .results?[index].rating ==
                                            3
                                        ? "Good condition"
                                        : controller
                                                        .resultsResponse
                                                        .value
                                                        .results?[index]
                                                        .rating ==
                                                    4 ||
                                                controller
                                                        .resultsResponse
                                                        .value
                                                        .results?[index]
                                                        .rating ==
                                                    4.5
                                            ? "Excellent condition"
                                            : "",
                        fontSize: 14,
                        textColor: ColorConstants.white.withOpacity(0.8),
                      ),
                      SizedBox(
                        height: getSize(30),
                      ),
                      // CommonContainerWithShadow(
                      //   borderRadius: SmoothBorderRadius.all(
                      //     SmoothRadius(
                      //       cornerRadius: getSize(8),
                      //       cornerSmoothing: 1,
                      //     ),
                      //   ),
                      //   backgroundColor: Colors.black,
                      //   height: getSize(30),
                      //   width: Get.width - getSize(200),
                      //   child: Center(
                      //     child: BaseText(
                      //       text: "CREATE TO DO LIST",
                      //       fontSize: 12,
                      //       fontWeight: FontWeight.w500,
                      //     ),
                      //   ),
                      // ),
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

  // emojiIndex({int ratingValue = -1}) {
  //   switch (ratingValue) {
  //     case (ratingValue > 0 || ratingValue < 1) :
  //       return "ghj";
  //
  //   }
  // }

  comment(String name) {
    switch (name) {
      case "DIlip": // Enter this block if mark == 0
        break;
      case "Yash": // Enter this block if mark == 0
        break;
      case "Ravi": // Enter this block if mark == 0
        break;
      case "Zenith": // Enter this block if mark == 0
        break;
      case "Gauta,": // Enter this block if mark == 0
        break;
      default:
        return "";
    }
  }
}
