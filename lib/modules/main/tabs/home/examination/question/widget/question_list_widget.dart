import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../../../../../routes/app_pages.dart';
import '../../../../../../../shared/constants/color_constants.dart';
import '../../../../../../../shared/constants/png_image_constant.dart';
import '../../../../../../../shared/constants/string_constant.dart';
import '../../../../../../../shared/constants/svg_image_constant.dart';
import '../../../../../../../shared/utils/image_utils.dart';
import '../../../../../../../shared/utils/math_utils.dart';
import '../../../../../../../shared/widgets/base_elevated_button.dart';
import '../../../../../../../shared/widgets/base_text.dart';
import '../../../../../../../shared/widgets/common_container_shadow.dart';
import '../../../../../../../shared/widgets/common_linear_progress.dart';
import '../model/question_model.dart';
import '../question_controller.dart';
import 'animated_card.dart';

class QuestionListWidget extends GetView<QuestionController> {
  const QuestionListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(
        "questionModelList=============${controller.questionModelList.length}");
    return Obx(() => controller.questionModelList.isNotEmpty
        ? CarouselSlider(
            items: controller.questionModelList.map(
              (questionModel) {
                return Builder(
                  builder: (BuildContext context) {
                    return controller.questionModelList.indexOf(questionModel) == controller.questionModelList.length -1  && controller.managerComppleteInspection == true ? congratulationView(): CommonContainerWithShadow(
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
              height: Get.height / 1.8,
              initialPage: 0,
              reverse: false,
              autoPlay: false,
              enableInfiniteScroll: false,
              scrollDirection: Axis.horizontal,
              scrollPhysics: BouncingScrollPhysics(),
              viewportFraction: 0.8,
            ),
            carouselController: controller.carouselController,
          )
        : Container());
  }

  _buildItem(QuestionModel questionModel) {
    return Padding(
      padding: EdgeInsets.all(
        getSize(16.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BaseText(text: questionModel.title),
          SizedBox(
            height: getSize(24.0),
          ),
          AnimatedCard(
            questionModel: questionModel,
          ),
          SizedBox(
            height: getSize(20.0),
          ),
          BaseText(
            text: questionModel.question,
            fontSize: 14,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: getSize(20.0),
          ),
          _buildLinearProgressView(questionModel),
          // Obx(() {
          //   return BaseText(
          //     text: 'Total Image = ${questionModel.localImagePathList.length}',
          //     fontSize: 12,
          //     textAlign: TextAlign.center,
          //   );
          // }),
          SizedBox(
            height: getSize(20),
          ),
          _buildSubmitView(questionModel: questionModel),
        ],
      ),
    );
  }

  _buildLinearProgressView(QuestionModel questionModel) {
    return Expanded(
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // children: List.generate(5,
            //   (index) => questionModel.rating == 1
            //       ? _commonRatingImageView(SvgImageConstants.very_poor, 40)
            //       : _commonRatingImageView(SvgImageConstants.unselected_very_poor, 30) ,
            // ),
            children: [
              questionModel.rating == 0
                  ? _commonRatingImageView(SvgImageConstants.very_poor, 40)
                  : _commonRatingImageView(
                      SvgImageConstants.unselected_very_poor, 30),
              questionModel.rating == 1
                  ? _commonRatingImageView(SvgImageConstants.poor, 40)
                  : _commonRatingImageView(
                      SvgImageConstants.unselected_poor, 30),
              questionModel.rating == 2
                  ? _commonRatingImageView(SvgImageConstants.average, 40)
                  : _commonRatingImageView(
                      SvgImageConstants.unselected_average, 30),
              questionModel.rating == 3
                  ? _commonRatingImageView(SvgImageConstants.good, 40)
                  : _commonRatingImageView(
                      SvgImageConstants.unselected_good, 30),
              questionModel.rating == 4
                  ? _commonRatingImageView(SvgImageConstants.excellent, 40)
                  : _commonRatingImageView(
                      SvgImageConstants.unselected_excellent, 30),
            ],
          ),
          SizedBox(
            height: getSize(14),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.0),
            child: CommonLinearProgressWidget(
              width: Get.width - getSize(160),
              total: 100,
              remaining: questionModel.rating == 0
                  ? 1
                  : questionModel.rating == 1
                      ? 27
                      : questionModel.rating == 2
                          ? 51
                          : questionModel.rating == 3
                              ? 75
                              : questionModel.rating == 4
                                  ? 100
                                  : 0,
            ),
          ),
          // SliderTheme(
          //   data: SliderThemeData(
          //     thumbColor: Color(0XFF86E2FF),
          //     activeTrackColor: Color(0XFF86E2FF),
          //     inactiveTrackColor: Color(0XFF3D4D71),
          //     activeTickMarkColor: Colors.transparent,
          //     inactiveTickMarkColor: Colors.transparent,
          //     trackHeight: 9,
          //     overlayShape: RoundSliderOverlayShape(overlayRadius: 10.0),
          //   ),
          //   child: Obx(
          //     () {
          //       return Slider(
          //         max: 100.0,
          //         value: controller.distanceValue.value,
          //         divisions: 4,
          //         //activeColor: Color(0XFF3D4D71),
          //         onChanged: (double value) {
          //           controller.distanceValue.value = value.toDouble();
          //         },
          //       );
          //     },
          //   ),
          // ),
          SizedBox(
            height: getSize(17),
          ),
          Padding(
            padding: EdgeInsets.only(right: getSize(14), left: getSize(12),),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                  5,
                  (index) =>
                      commonCircle(index: index, questionModel: questionModel)),
            ),
          ),
        ],
      ),
    );
  }

  _buildSubmitView({required QuestionModel questionModel}) {
    return questionModel.questionSubmitted
        ? InkWell(
            onTap: () async {

             // print("questionModel========${questionModel.title}");
              var res = await Get.toNamed(Routes.ADD_INSPECT, arguments: [questionModel, controller.jobId, questionModel.answerId, questionModel.title]);
              if (res == 'success') {controller.getQuestion(controller.argumentData.examinationId ?? 0, controller.jobId);
              }

            },
            child: CommonContainerWithShadow(
              width: getSize(186),
              height: getSize(40.0),
              backgroundColor: ColorConstants.black,
              child: Center(
                child: BaseText(
                  text: StringConstants.edit,
                ),
              ),
            ),
          )
        : BaseElevatedButton(
            width: getSize(186),
            height: getSize(30.0),
            borderRadius: BorderRadius.circular(
              getSize(8.0),
            ),
            // onPressed: (){
            //   _showDialog();
            // },
            onPressed: () async {

             // print("isCheckIndex===================${controller.questionModelList.indexOf(questionModel)}");
              print("isLastIndex===================${controller.questionModelList.indexOf(questionModel) == controller.questionModelList.length -1}");
              var res = await Get.toNamed(Routes.ADD_INSPECT, arguments: [questionModel, controller.jobId, -3, questionModel.title]);
              if (res == 'success') {
                controller.getQuestion(controller.argumentData.examinationId ?? 0, controller.jobId);
              }
            },
            child: BaseText(
              text: StringConstants.inspect,
              fontWeight: FontWeight.w500,
            ),
          );
  }

  _commonRatingImageView(String image, double height) {
    return SvgPicture.asset(
      image,
      height: height,
    );
  }

  commonCircle({required int index, required QuestionModel questionModel}) {
    return Container(
      margin: EdgeInsets.only(right: 0, left: 2),
      height: 8,
      width: 8,
      decoration: BoxDecoration(
        color: questionModel.rating == index
            ? ColorConstants.white
            : ColorConstants.white.withOpacity(0.4),
        borderRadius: BorderRadius.circular(50),
        // border: Border.all(color: ColorConstants.white),
      ),
    );
  }


  congratulationView(){
    return Container(
      // padding: EdgeInsets.all(getSize(0.0)),
      decoration: BoxDecoration(
          color: ColorConstants.dialogBlack,
          borderRadius: BorderRadius.circular(
            getSize(20),
          ),
          border: Border.all(
            color: ColorConstants.dialogBorderGreen,
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 0),
              blurRadius: 25,
              color: ColorConstants.dialogBorderGreen.withOpacity(0.6),
            ),
          ]),
      child: Padding(
        padding: EdgeInsets.only(top: 40, bottom: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              child: Image.asset(
                PngImageConstants.answer_done,
                height: getSize(178),
              ),
            ),
            SizedBox(
              height: getSize(30.0),
            ),
            BaseText(
              text: 'Congratulations',
              textAlign: TextAlign.center,
              fontSize: 20,
              fontWeight: FontWeight.w600,
              textColor: ColorConstants.white.withOpacity(0.8),
            ),
            SizedBox(
              height: getSize(10.0),
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 8.0),
              child: BaseText(
                text: "You have successfully completed examination",
                fontWeight: FontWeight.w500,
                textColor: Colors.white.withOpacity(0.8),
                textAlign: TextAlign.center,
                fontSize: 12,
              ),
            ),
            SizedBox(
              height: getSize(33.0),
            ),
            BaseElevatedButton(
              width: getSize(214.0),
              onPressed: () {
                Get.back();
              },
              //borderRadius: BorderRadius.circular(20.0),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: BaseText(text: 'CONTINUE'),
              ),
            ),
            SizedBox(
              height: getSize(10.0),
            ),
          ],
        ),
      ),
    );
  }
}

// class QuestionListWidget extends GetView<QuestionController> {
//   const QuestionListWidget({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return CarouselSlider(
//       items: controller.questionModelList.map(
//             (questionModel) {
//           return Builder(
//             builder: (BuildContext context) {
//               return CommonContainerWithShadow(
//                 width: Get.width,
//                 margin: EdgeInsets.symmetric(
//                   horizontal: getSize(10.0),
//                 ),
//                 child: _buildItem(questionModel),
//               );
//             },
//           );
//         },
//       ).toList(),
//       options: CarouselOptions(
//         onPageChanged: (index, reason) {
//           controller.currentQuestion.value = index;
//         },
//         enlargeCenterPage: false,
//         height: Get.height / 1.9,
//         initialPage: 0,
//         reverse: false,
//         autoPlay: false,
//         enableInfiniteScroll: false,
//         scrollDirection: Axis.horizontal,
//         scrollPhysics: BouncingScrollPhysics(),
//         viewportFraction: 0.8,
//       ),
//       carouselController: controller.carouselController,
//     );
//   }
//
//   _buildItem(QuestionModel questionModel) {
//     return Padding(
//       padding: EdgeInsets.all(
//         getSize(16.0),
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           BaseText(text: questionModel.title),
//           SizedBox(
//             height: getSize(20.0),
//           ),
//           AnimatedCard(
//             questionModel: questionModel,
//           ),
//           SizedBox(
//             height: getSize(20.0),
//           ),
//           BaseText(
//             text: questionModel.question,
//             fontSize: 14,
//             textAlign: TextAlign.center,
//           ),
//           SizedBox(
//             height: getSize(20.0),
//           ),
//           _buildLinearProgressView(),
//           // Obx(() {
//           //   return BaseText(
//           //     text: 'Total Image = ${questionModel.localImagePathList.length}',
//           //     fontSize: 12,
//           //     textAlign: TextAlign.center,
//           //   );
//           // }),
//           SizedBox(
//             height: getSize(20),
//           ),
//           _buildSubmitView(questionModel: questionModel),
//         ],
//       ),
//     );
//   }
//
//   _buildLinearProgressView() {
//     return Expanded(
//       child: Column(
//         //mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               _commonRatingImageView(SvgImageConstants.unselected_very_poor),
//               _commonRatingImageView(SvgImageConstants.unselected_poor),
//               _commonRatingImageView(SvgImageConstants.unselected_average),
//               _commonRatingImageView(SvgImageConstants.unselected_good),
//               _commonRatingImageView(SvgImageConstants.unselected_excellent),
//             ],
//           ),
//           SizedBox(
//             height: getSize(12),
//           ),
//           CommonLinearProgressWidget(
//             width: Get.width - getSize(146),
//             total: 100,
//             remaining: 10,
//           ),
//           // SliderTheme(
//           //   data: SliderThemeData(
//           //     thumbColor: Color(0XFF86E2FF),
//           //     activeTrackColor: Color(0XFF86E2FF),
//           //     inactiveTrackColor: Color(0XFF3D4D71),
//           //     activeTickMarkColor: Colors.transparent,
//           //     inactiveTickMarkColor: Colors.transparent,
//           //     trackHeight: 9,
//           //     overlayShape: RoundSliderOverlayShape(overlayRadius: 10.0),
//           //   ),
//           //   child: Obx(
//           //     () {
//           //       return Slider(
//           //         max: 100.0,
//           //         value: controller.distanceValue.value,
//           //         divisions: 4,
//           //         //activeColor: Color(0XFF3D4D71),
//           //         onChanged: (double value) {
//           //           controller.distanceValue.value = value.toDouble();
//           //         },
//           //       );
//           //     },
//           //   ),
//           // ),
//           SizedBox(
//             height: getSize(16),
//           ),
//           Padding(
//             padding: EdgeInsets.only(right: getSize(10), left: getSize(10)),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: List.generate(5, (index) => commonCircle(index: index)),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   _buildSubmitView({required QuestionModel questionModel}) {
//     return questionModel.questionSubmitted
//         ? CommonContainerWithShadow(
//       width: getSize(186),
//       height: getSize(40.0),
//       backgroundColor: ColorConstants.black,
//       child: Center(
//         child: BaseText(
//           text: StringConstants.edit,
//         ),
//       ),
//     )
//         : BaseElevatedButton(
//       width: getSize(186),
//       height: getSize(30.0),
//       borderRadius: BorderRadius.circular(
//         getSize(8.0),
//       ),
//       // onPressed: (){
//       //   _showDialog();
//       // },
//       onPressed: () {
//         Get.toNamed(Routes.ADD_INSPECT);
//       },
//       child: BaseText(
//         text: StringConstants.inspect,
//         fontWeight: FontWeight.w500,
//       ),
//     );
//   }
//
//   _commonRatingImageView(String image) {
//     return SvgPicture.asset(
//       image,
//     );
//   }
//
//   commonCircle({required int index}) {
//     return Container(
//       margin: EdgeInsets.only(right: 5, left: 5),
//       height: 8,
//       width: 8,
//       decoration: BoxDecoration(
//         color: ColorConstants.white.withOpacity(0.4),
//         borderRadius: BorderRadius.circular(50),
//         // border: Border.all(color: ColorConstants.white),
//       ),
//     );
//   }
// }
