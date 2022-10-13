import 'package:align_flutter_app/modules/main/tabs/home/examination/examination_results/summary_report/model/summary_report_model.dart';
import 'package:align_flutter_app/modules/main/tabs/home/examination/examination_results/summary_report/widget/summary_animated_card.dart';
import 'package:align_flutter_app/shared/widgets/base_elevated_button.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import '../../../../../../../../shared/constants/color_constants.dart';
import '../../../../../../../../shared/utils/image_utils.dart';
import '../../../../../../../../shared/utils/math_utils.dart';
import '../../../../../../../../shared/widgets/base_text.dart';
import '../../../../../../../../shared/widgets/common_container_shadow.dart';
import '../../../../../../../../shared/widgets/input_field.dart';
import '../../../question/model/question_model.dart';
import '../../../question/widget/animated_card.dart';
import '../summary_report_controller.dart';

class SummaryReportListWidget extends GetView<SummaryReportController> {
  const SummaryReportListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return CarouselSlider(
        items: controller.summaryReportModelList.map(
          (summaryReportModel) {
            return Builder(
              builder: (BuildContext context) {
                return CommonContainerWithShadow(
                  width: Get.width,
                  margin: EdgeInsets.symmetric(
                    horizontal: getSize(10.0),
                  ),
                  child: _buildItem(summaryReportModel),
                );
              },
            );
          },
        ).toList(),
        options: CarouselOptions(
          onPageChanged: (index, reason) {
            controller.currentQuestion.value = index;
          },
          enlargeCenterPage: false,
          height: Get.height / 1.4,
          initialPage: 0,
          reverse: false,
          autoPlay: false,
          enableInfiniteScroll: false,
          scrollDirection: Axis.horizontal,
          scrollPhysics: BouncingScrollPhysics(),
          viewportFraction: 0.9,
        ),
        carouselController: controller.carouselController,
      );
    });
  }

  _buildItem(SummaryReportModel summaryReportModel) {
    return Padding(
      padding: EdgeInsets.all(
        getSize(16.0),
      ),
      child: ListView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Center(
            child: BaseText(text: summaryReportModel.title),
          ),
          SizedBox(
            height: getSize(20.0),
          ),
          SummaryAnimatedCard(
            summaryReportModel: summaryReportModel,
          ),
          SizedBox(
            height: getSize(20),
          ),
          CommonContainerWithShadow(
            backgroundColor: ColorConstants.black,
            child: Padding(
              padding: EdgeInsets.only(
                  left: getSize(20),
                  top: getSize(11),
                  bottom: getSize(11),
                  right: getSize(11)),
              child: Row(
                children: [
                  BaseText(
                    text: "Problem",
                    fontSize: 12,
                  ),
                  Spacer(),
                  Obx(() {
                    return InkWell(
                      onTap: () {
                        summaryReportModel.isMajor.value =
                            !summaryReportModel.isMajor.value;
                        summaryReportModel.isMinor.value = false;
                      },
                      child: SvgPicture.asset(
                        summaryReportModel.isMajor.value
                            ? getAssetsSVGImg('radio_circle_fill')
                            : getAssetsSVGImg('radio_circle'),
                      ),
                    );
                  }),
                  SizedBox(
                    width: getSize(10),
                  ),
                  BaseText(
                    text: "Major",
                    fontSize: 12,
                  ),
                  Spacer(),
                  Obx(() {
                    return InkWell(
                      onTap: () {
                        summaryReportModel.isMinor.value = !summaryReportModel.isMinor.value;
                        summaryReportModel.isMajor.value = false;
                      },
                      child: SvgPicture.asset(
                        summaryReportModel.isMinor.value
                            ? getAssetsSVGImg('radio_circle_fill')
                            : getAssetsSVGImg('radio_circle'),
                      ),
                    );
                  }),
                  SizedBox(
                    width: getSize(10),
                  ),
                  BaseText(
                    text: "Minor",
                    fontSize: 12,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: getSize(10),
          ),
          _buildTagsView(summaryReportModel),
          SizedBox(
            height: getSize(10),
          ),
          _buildRecommendationView(summaryReportModel),
          SizedBox(
            height: getSize(10),
          ),
          InputTextField(
            fillColor: ColorConstants.black,
            controller: summaryReportModel.suggestionsController,
            textInputType: TextInputType.multiline,
            textInputAction: TextInputAction.newline,
            hintText: 'Add tips or suggestions',
            maxLines: 6,
            minLines: 4,
          ),
          SizedBox(
            height: getSize(18),
          ),
          Center(
            child: BaseElevatedButton(
              width: getSize(186),
              height: getSize(30.0),
              borderRadius: BorderRadius.circular(
                getSize(8.0),
              ),
              onPressed: () {
                controller.updateSummaryReport(18, summaryReportModel);
                //controller.updateSummaryReport(18,summaryReportModel.id, summaryReportModel.recommendationValue.value, summaryReportModel.conditionValue.value, summaryReportModel.suggestionsController, summaryReportModel.isMinor.value);
              },
              child: BaseText(text: "SUBMIT"),
            ),
          ),
        ],
      ),
    );
  }

  _buildTagsView(SummaryReportModel summaryReportModel) {
    final theme = Get.theme.copyWith(
      dividerColor: Colors.transparent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
    );

    return CommonContainerWithShadow(
      backgroundColor: ColorConstants.black,
      child: ListTileTheme(
        horizontalTitleGap: 0.0,
        minLeadingWidth: 0,
        dense: true,
        child: Theme(
          data: theme,
          child: Obx(
            () {
              // print('isTileExpanded = ${controller.isConditionExpanded.value}');
              return ExpansionTile(
                initiallyExpanded: summaryReportModel.isConditionExpanded.value,
                onExpansionChanged: (bool expanded) {
                  //  print("expanded===========${controller.isConditionExpanded.value}");
                  summaryReportModel.isConditionExpanded.value = expanded;
                },
                key: GlobalKey(),
                iconColor: ColorConstants.white,
                childrenPadding: EdgeInsets.all(0.0),
                title: BaseText(
                  text: summaryReportModel.conditionValue.value,
                ),
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          left: getSize(10.0),
                          right: getSize(10.0),
                          top: getSize(10.0),
                        ),
                        child: Divider(
                          height: 1,
                          color: ColorConstants.white.withOpacity(0.3),
                        ),
                      ),
                      _buildTagList(summaryReportModel),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  _buildTagList(SummaryReportModel summaryReportModel) {
    return SizedBox(
      height: getSize(120),
      child: ListView.builder(
        //shrinkWrap: true,
        itemCount: summaryReportModel.condition.length,
        // itemCount: controller.toDoListTagsResponse.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 15.0),
            //padding: isCompleted?EdgeInsets.all(getSize(5.0)):null,
            //height: 25,

            child: ListTile(
              onTap: () {
                summaryReportModel.conditionValue.value =
                    summaryReportModel.condition[index];
                //controller.tag.value = controller.toDoListTagsResponse[index].name.toString();
                // controller.tagValue.value.selection =
                //     TextSelection.fromPosition(
                //   TextPosition(
                //       offset: controller
                //           .textEditingTagController.value.text.length),
                // );
                summaryReportModel.isConditionExpanded.value = false;
                //controller.tag.value = controller.toDoListTagsResponse[index].name.toString();
                //print(summaryReportModel.condition[index]);
              },
              dense: true,
              contentPadding: EdgeInsets.all(0.0),
              visualDensity: VisualDensity(horizontal: 0, vertical: -4),
              horizontalTitleGap: getSize(10.0),
              title: BaseText(
                textAlign: TextAlign.start,
                text: summaryReportModel.condition[index],
              ),
            ),
          );
        },
      ),
    );
  }

  _buildRecommendationView(SummaryReportModel summaryReportModel) {
    final theme = Get.theme.copyWith(
      dividerColor: Colors.transparent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
    );

    return CommonContainerWithShadow(
      backgroundColor: ColorConstants.black,
      child: ListTileTheme(
        horizontalTitleGap: 0.0,
        minLeadingWidth: 0,
        dense: true,
        child: Theme(
          data: theme,
          child: Obx(
            () {
              return ExpansionTile(
                initiallyExpanded:
                    summaryReportModel.isRecommendationExpanded.value,
                onExpansionChanged: (bool expanded) {
                  //   print("expanded===========${controller.isRecommendationExpanded.value}");
                  summaryReportModel.isRecommendationExpanded.value = expanded;
                },
                key: GlobalKey(),
                iconColor: ColorConstants.white,
                childrenPadding: EdgeInsets.all(0.0),
                title: BaseText(
                  text: summaryReportModel.recommendationValue.value,
                ),
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          left: getSize(10.0),
                          right: getSize(10.0),
                          top: getSize(10.0),
                        ),
                        child: Divider(
                          height: 1,
                          color: ColorConstants.white.withOpacity(0.3),
                        ),
                      ),
                      _buildRecommendationList(summaryReportModel),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  _buildRecommendationList(SummaryReportModel summaryReportModel) {
    return SizedBox(
      height: getSize(120),
      child: ListView.builder(
        //shrinkWrap: true,
        itemCount: summaryReportModel.recommendation.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 15.0),
            //padding: isCompleted?EdgeInsets.all(getSize(5.0)):null,
            //height: 25,
            child: ListTile(
              onTap: () {
                summaryReportModel.recommendationValue.value =
                    summaryReportModel.recommendation[index];
                //controller.tag.value = controller.toDoListTagsResponse[index].name.toString();
                // controller.tagValue.value.selection =
                //     TextSelection.fromPosition(
                //   TextPosition(
                //       offset: controller
                //           .textEditingTagController.value.text.length),
                // );
                summaryReportModel.isRecommendationExpanded.value = false;
                //controller.tag.value = controller.toDoListTagsResponse[index].name.toString();
                // print(controller.tagList[index]);
              },
              dense: true,
              contentPadding: EdgeInsets.all(0.0),
              visualDensity: VisualDensity(horizontal: 0, vertical: -4),
              horizontalTitleGap: getSize(10.0),
              title: BaseText(
                textAlign: TextAlign.start,
                text: summaryReportModel.recommendation[index],
              ),
            ),
          );
        },
      ),
    );
  }
}
