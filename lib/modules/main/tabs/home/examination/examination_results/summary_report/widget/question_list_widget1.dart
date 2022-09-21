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

class QuestionListWidget1 extends GetView<SummaryReportController> {
  const QuestionListWidget1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: controller.questionModelList.map(
        (questionModel) {
          return Builder(
            builder: (BuildContext context) {
              return CommonContainerWithShadow(
                width: Get.width,
                margin: EdgeInsets.symmetric(
                  horizontal: getSize(10.0),
                ),
                child: _buildItem(questionModel),
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
        height: Get.height / 1.5,
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
  }

  _buildItem(QuestionModel questionModel) {
    return Padding(
      padding: EdgeInsets.all(getSize(16.0),
      ),
      child: ListView(
       // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BaseText(text: questionModel.title),
          SizedBox(
            height: getSize(20.0),
          ),
          AnimatedCard(
            questionModel: questionModel,
          ),
          SizedBox(
            height: getSize(20),
          ),
          CommonContainerWithShadow(
            backgroundColor: ColorConstants.black,
            child: Padding(
              padding: EdgeInsets.only(left: getSize(20), top: getSize(11), bottom: getSize(11), right:  getSize(11)),
              child: Row(
                children: [
                  BaseText(text: "Problem",fontSize: 12,),
                  Spacer(),
                  SvgPicture.asset(
                    controller.isMinor.value
                        ? getAssetsSVGImg('radio_circle_fill')
                        : getAssetsSVGImg('radio_circle'),
                  ),
                  SizedBox(
                    width: getSize(10),
                  ),
                  BaseText(text: "Major",fontSize: 12,),
                  Spacer(),
                  SvgPicture.asset(
                    controller.isMinor.value
                        ? getAssetsSVGImg('radio_circle_fill')
                        : getAssetsSVGImg('radio_circle'),
                  ),
                  SizedBox(
                    width: getSize(10),
                  ),
                  BaseText(text: "Minor",fontSize: 12,),
                ],
              ),
            ),
          ),
          SizedBox(
            height: getSize(10),
          ),
          _buildTagsView(),
          SizedBox(
            height: getSize(10),
          ),
          _buildRecommendationView(),
          SizedBox(
            height: getSize(10),
          ),
          InputTextField(
            fillColor: ColorConstants.black,
            controller: controller.suggestionsController,
            textInputType: TextInputType.multiline,
            textInputAction: TextInputAction.newline,
            hintText: 'Add tips or suggestions',
            maxLines: 6,
            minLines: 4,
          ),
        ],
      ),
    );
  }
  _buildTagsView() {
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
              print('isTileExpanded = ${controller.isTileExpanded.value}');
              return ExpansionTile(
                initiallyExpanded: controller.isTileExpanded.value,
                onExpansionChanged: (bool expanded) {
                  print("expanded===========${controller.isTileExpanded.value}");
                  controller.isTileExpanded.value = expanded;
                },
                key: GlobalKey(),
                iconColor: ColorConstants.white,
                childrenPadding: EdgeInsets.all(0.0),
                title: BaseText(
                  text: controller.tag.value,
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
                      _buildTagList(),
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
  _buildTagList() {
    return SizedBox(
      height: getSize(150),
      child: ListView.builder(
        //shrinkWrap: true,
        itemCount: controller.tagList.length,
        // itemCount: controller.toDoListTagsResponse.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 15.0),
            //padding: isCompleted?EdgeInsets.all(getSize(5.0)):null,
            //height: 25,

            child: ListTile(
              onTap: () {
                controller.tag.value = controller.tagList[index];
                //controller.tag.value = controller.toDoListTagsResponse[index].name.toString();
                // controller.tagValue.value.selection =
                //     TextSelection.fromPosition(
                //   TextPosition(
                //       offset: controller
                //           .textEditingTagController.value.text.length),
                // );
                controller.isTileExpanded.value = false;
                //controller.tag.value = controller.toDoListTagsResponse[index].name.toString();
                print(controller.tagList[index]);
              },
              dense: true,
              contentPadding: EdgeInsets.all(0.0),
              visualDensity: VisualDensity(horizontal: 0, vertical: -4),
              horizontalTitleGap: getSize(10.0),
              title: BaseText(
                textAlign: TextAlign.start,
                text: controller.tagList[index],
              ),
            ),
          );
        },
      ),
    );
  }

  _buildRecommendationView() {
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
              print('isTileExpanded = ${controller.isTileExpanded.value}');
              return ExpansionTile(
                initiallyExpanded: controller.isTileExpanded1.value,
                onExpansionChanged: (bool expanded) {
                  print("expanded===========${controller.isTileExpanded1.value}");
                  controller.isTileExpanded1.value = expanded;
                },
                key: GlobalKey(),
                iconColor: ColorConstants.white,
                childrenPadding: EdgeInsets.all(0.0),
                title: BaseText(
                  text: controller.recommendation.value,
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
                      _buildRecommendationList(),
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
  _buildRecommendationList(){
    return SizedBox(
      height: getSize(150),
      child: ListView.builder(
        //shrinkWrap: true,
        itemCount: controller.recommendationList.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 15.0),
            //padding: isCompleted?EdgeInsets.all(getSize(5.0)):null,
            //height: 25,
            child: ListTile(
              onTap: () {
                controller.recommendation.value = controller.recommendationList[index];
                //controller.tag.value = controller.toDoListTagsResponse[index].name.toString();
                // controller.tagValue.value.selection =
                //     TextSelection.fromPosition(
                //   TextPosition(
                //       offset: controller
                //           .textEditingTagController.value.text.length),
                // );
                controller.isTileExpanded1.value = false;
                //controller.tag.value = controller.toDoListTagsResponse[index].name.toString();
               // print(controller.tagList[index]);
              },
              dense: true,
              contentPadding: EdgeInsets.all(0.0),
              visualDensity: VisualDensity(horizontal: 0, vertical: -4),
              horizontalTitleGap: getSize(10.0),
              title: BaseText(
                textAlign: TextAlign.start,
                text: controller.recommendationList[index],
              ),
            ),
          );
        },
      ),
    );
  }
}
