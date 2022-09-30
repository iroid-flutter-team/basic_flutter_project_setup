import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../../../../../routes/app_pages.dart';
import '../../../../../../../shared/constants/color_constants.dart';
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
        height: Get.height / 1.9,
        initialPage: 0,
        reverse: false,
        autoPlay: false,
        enableInfiniteScroll: false,
        scrollDirection: Axis.horizontal,
        scrollPhysics: BouncingScrollPhysics(),
        viewportFraction: 0.8,
      ),
      carouselController: controller.carouselController,
    );
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
            height: getSize(20.0),
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
          _buildLinearProgressView(),
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

  _buildLinearProgressView() {
    return Expanded(
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _commonRatingImageView(SvgImageConstants.unselected_very_poor),
              _commonRatingImageView(SvgImageConstants.unselected_poor),
              _commonRatingImageView(SvgImageConstants.unselected_average),
              _commonRatingImageView(SvgImageConstants.unselected_good),
              _commonRatingImageView(SvgImageConstants.unselected_excellent),
            ],
          ),
          SizedBox(
            height: getSize(12),
          ),
          CommonLinearProgressWidget(
            width: Get.width - getSize(146),
            total: 100,
            remaining: 10,
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
            height: getSize(16),
          ),
          Padding(
            padding: EdgeInsets.only(right: getSize(10), left: getSize(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(5, (index) => commonCircle(index: index)),
            ),
          ),
        ],
      ),
    );
  }

  _buildSubmitView({required QuestionModel questionModel}) {
    return questionModel.questionSubmitted
        ? CommonContainerWithShadow(
          width: getSize(186),
          height: getSize(40.0),
          backgroundColor: ColorConstants.black,
          child: Center(
            child: BaseText(
              text: StringConstants.edit,
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
            onPressed: () {
              Get.toNamed(Routes.ADD_INSPECT, arguments: questionModel.id);
            },
            child: BaseText(
              text: StringConstants.inspect,
              fontWeight: FontWeight.w500,
            ),
          );
  }

  _commonRatingImageView(String image) {
    return SvgPicture.asset(
      image,
    );
  }

  commonCircle({required int index}) {
    return Container(
      margin: EdgeInsets.only(right: 5, left: 5),
      height: 8,
      width: 8,
      decoration: BoxDecoration(
        color: ColorConstants.white.withOpacity(0.4),
        borderRadius: BorderRadius.circular(50),
        // border: Border.all(color: ColorConstants.white),
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
