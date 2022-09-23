import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:home_yogi_flutter/modules/main/tabs/home/examination/question/model/question_model.dart';
import 'package:home_yogi_flutter/modules/main/tabs/home/examination/question/widget/animated_card.dart';
import 'package:home_yogi_flutter/shared/constants/colors.dart';
import 'package:home_yogi_flutter/shared/constants/string_constant.dart';
import 'package:home_yogi_flutter/shared/widgets/base_elevated_button.dart';
import 'package:home_yogi_flutter/shared/widgets/base_text.dart';
import 'package:home_yogi_flutter/shared/widgets/common_container_shadow.dart';
import '../../../../../../../models/response/home/examination_question_response.dart';
import '../../../../../../../shared/dialog/answer_completed_dialog.dart';
import '../../../../../../../shared/dialog/congrats_dialog.dart';
import '../../../../../../../shared/utils/math_utils.dart';
import '../question_controller.dart';

class QuestionListWidget extends GetView<QuestionController> {
  const QuestionListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return CarouselSlider(
        items: controller.questionModelList.map((questionModel) {
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
        }).toList(),
        options: CarouselOptions(
          onPageChanged: (index, reason) {
            controller.currentQuestion.value = index;
          },
          enlargeCenterPage: false,
          height: Get.height / 2,
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
    });
  }

  _buildItem(QuestionModel questionModel) {
    return Padding(
      padding: EdgeInsets.all(
        getSize(20.0),
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
          Opacity(
            opacity: 0.7,
            child: BaseText(
              text: questionModel.tip,
              fontSize: 12,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: getSize(20.0),
          ),
          _buildCoinView(coin: questionModel.coin),
          // Obx(() {
          //   return BaseText(
          //     text: 'Total Image = ${questionModel.localImagePathList.length}',
          //     fontSize: 12,
          //     textAlign: TextAlign.center,
          //   );
          // }),
          _buildSubmitView(questionModel: questionModel),
        ],
      ),
    );
  }

  _buildCoinView({required int coin}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          getAssetsPNGImg('coin'),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: BaseText(
            text: '+$coin',
            fontSize: 14,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  _buildSubmitView({required QuestionModel questionModel}) {
    return Obx(() {
      return questionModel.questionSubmitted.value
          ? BaseElevatedButton(
              //width: 40,
              height: 30,
              borderRadius: BorderRadius.circular(
                getSize(8.0),
              ),
              onPressed: null,
              gradient: LinearGradient(
                colors: [
                  ColorConstants.buttonSubmittedStart,
                  ColorConstants.buttonSubmittedEnd,
                  // Color.fromRGBO(16, 89, 146, 1),
                ],
                begin: Alignment(93.75, 15),
                end: Alignment(31.25, 15),
                //begin: Alignment.topCenter,
                //end: Alignment.bottomCenter,
              ),
              child: Opacity(
                opacity: 0.5,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      getAssetsSVGImg('tick_circle'),
                      color: ColorConstants.white,
                    ),
                    SizedBox(
                      width: getSize(5.0),
                    ),
                    BaseText(
                      text: StringConstants.buttonSubmitted,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
              ),
            )
          : Obx(() {
              return Opacity(
                opacity: questionModel.localImagePathList.isEmpty ? 0.3 : 1,
                child: BaseElevatedButton(
                  //width: 40,
                  height: getSize(30.0),
                  borderRadius: BorderRadius.circular(
                    getSize(8.0),
                  ),
                  // onPressed: (){
                  //   _showDialog();
                  // },
                  onPressed: questionModel.localImagePathList.isEmpty
                      ? null
                      : () async{
                          List<String> imageUrlList = await controller.examinationAnswer(questionModel.id);
                          _showDialog();
                          questionModel.imagePathList.addAll(imageUrlList);
                          questionModel.questionSubmitted.value = true;

                        },
                  child: BaseText(
                    text: StringConstants.buttonSubmit,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              );
            });
    });
  }

  // _showDialog() {
  //   Get.dialog(
  //     AnswerCompletedDialog(
  //       coin: 5,
  //       offerText: 'You have successfully completed task',
  //       continueCallBack: () {
  //         Get.back();
  //       },
  //     ),
  //   );
  // }
  _showDialog() {
    Get.dialog(
      CongratsDialog(
        coin: 5,
        offerText: 'You have successfully completed task',
        continueCallBack: () {
          Get.back();
        },
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
//       items: controller.questionModelList.map((questionModel) {
//         return Builder(
//           builder: (BuildContext context) {
//             return CommonContainerWithShadow(
//               width: Get.width,
//               margin: EdgeInsets.symmetric(
//                 horizontal: getSize(10.0),
//               ),
//               child: _buildItem(questionModel),
//             );
//           },
//         );
//       }).toList(),
//       options: CarouselOptions(
//         onPageChanged: (index, reason) {
//           controller.currentQuestion.value = index;
//         },
//         enlargeCenterPage: false,
//         height: Get.height / 2,
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
//         getSize(20.0),
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           BaseText(text: questionModel.title),
//           SizedBox(
//             height: getSize(20.0),
//           ),
//
//           AnimatedCard(
//             questionModel: questionModel,
//           ),
//
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
//           Opacity(
//             opacity: 0.7,
//             child: BaseText(
//               text: questionModel.tip,
//               fontSize: 12,
//               textAlign: TextAlign.center,
//             ),
//           ),
//           SizedBox(
//             height: getSize(20.0),
//           ),
//           _buildCoinView(coin: questionModel.coin),
//
//           // Obx(() {
//           //   return BaseText(
//           //     text: 'Total Image = ${questionModel.localImagePathList.length}',
//           //     fontSize: 12,
//           //     textAlign: TextAlign.center,
//           //   );
//           // }),
//
//           _buildSubmitView(questionModel: questionModel),
//         ],
//       ),
//     );
//   }
//
//   _buildCoinView({required int coin}) {
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Image.asset(
//           getAssetsPNGImg('coin'),
//         ),
//         Padding(
//           padding: const EdgeInsets.only(bottom: 8.0),
//           child: BaseText(
//             text: '+$coin',
//             fontSize: 14,
//             textAlign: TextAlign.center,
//           ),
//         ),
//       ],
//     );
//   }
//
//   _buildSubmitView({required QuestionModel questionModel}) {
//     return questionModel.questionSubmitted
//         ? BaseElevatedButton(
//       //width: 40,
//       height: 30,
//       borderRadius: BorderRadius.circular(getSize(8.0),),
//       onPressed: null,
//       gradient: LinearGradient(
//         colors: [
//           ColorConstants.buttonSubmittedStart,
//           ColorConstants.buttonSubmittedEnd,
//           // Color.fromRGBO(16, 89, 146, 1),
//         ],
//         begin: Alignment(93.75, 15),
//         end: Alignment(31.25, 15),
//         //begin: Alignment.topCenter,
//         //end: Alignment.bottomCenter,
//       ),
//       child: Opacity(
//         opacity: 0.5,
//         child: Row(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             SvgPicture.asset(
//               getAssetsSVGImg('tick_circle'),
//               color: ColorConstants.white,
//             ),
//             SizedBox(
//               width: getSize(5.0),
//             ),
//             BaseText(
//               text: StringConstants.buttonSubmitted,
//               fontWeight: FontWeight.w500,
//             ),
//           ],
//         ),
//       ),
//
//     )
//         : Obx(() {
//       return Opacity(
//         opacity: questionModel.localImagePathList.isEmpty ? 0.3 : 1,
//         child: BaseElevatedButton(
//           //width: 40,
//           height: getSize(30.0),
//           borderRadius: BorderRadius.circular(getSize(8.0),),
//           // onPressed: (){
//           //   _showDialog();
//           // },
//           onPressed: questionModel.localImagePathList.isEmpty
//               ? null
//               : () {
//             _showDialog();
//           },
//           child: BaseText(
//             text: StringConstants.buttonSubmit,
//             fontWeight: FontWeight.w500,
//           ),
//         ),
//       );
//     });
//   }
//
//   _showDialog() {
//     Get.dialog(
//       CongratsDialog(
//         coin: 5,
//         offerText: 'You have successfully completed task',
//         continueCallBack: () {
//           Get.back();
//         },
//       ),
//     );
//   }
// }

// class QuestionListWidget extends GetView<QuestionController> {
//   const QuestionListWidget({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//       return CarouselSlider(
//         items: controller.examinationQuestionResponse.map((
//             examinationQuestionModel) {
//           return Builder(
//             builder: (BuildContext context) {
//               return CommonContainerWithShadow(
//                 width: Get.width,
//                 margin: EdgeInsets.symmetric(
//                   horizontal: getSize(10.0),
//                 ),
//                 child: _buildItem(examinationQuestionModel),
//               );
//             },
//           );
//         }).toList(),
//         options: CarouselOptions(
//           onPageChanged: (index, reason) {
//             controller.currentQuestion.value = index;
//           },
//           enlargeCenterPage: false,
//           height: Get.height / 2,
//           initialPage: 0,
//           reverse: false,
//           autoPlay: false,
//           enableInfiniteScroll: false,
//           scrollDirection: Axis.horizontal,
//           scrollPhysics: BouncingScrollPhysics(),
//           viewportFraction: 0.8,
//         ),
//         carouselController: controller.carouselController,
//       );
//   }
//
//   _buildItem(ExaminationQuestionResponse examinationQuestionModel) {
//     return Padding(
//       padding: EdgeInsets.all(
//         getSize(20.0),
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           BaseText(text: examinationQuestionModel.title.toString()),
//           SizedBox(
//             height: getSize(20.0),
//           ),
//           AnimatedCard(
//             questionModel: examinationQuestionModel,
//           ),
//           SizedBox(
//             height: getSize(20.0),
//           ),
//           BaseText(
//             text: examinationQuestionModel.description.toString(),
//             fontSize: 14,
//             textAlign: TextAlign.center,
//           ),
//           SizedBox(
//             height: getSize(20.0),
//           ),
//           Opacity(
//             opacity: 0.7,
//             child: BaseText(
//               text: examinationQuestionModel.tip.toString(),
//               fontSize: 12,
//               textAlign: TextAlign.center,
//             ),
//           ),
//           SizedBox(
//             height: getSize(20.0),
//           ),
//           _buildCoinView(coin: examinationQuestionModel.points!),
//           // Obx(() {
//           //   return BaseText(
//           //     text: 'Total Image = ${questionModel.localImagePathList.length}',
//           //     fontSize: 12,
//           //     textAlign: TextAlign.center,
//           //   );
//           // }),
//
//           _buildSubmitView(examinationQuestionModel: examinationQuestionModel),
//         ],
//       ),
//     );
//   }
//
//   _buildCoinView({required int coin}) {
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Image.asset(
//           getAssetsPNGImg('coin'),
//         ),
//         Padding(
//           padding: const EdgeInsets.only(bottom: 8.0),
//           child: BaseText(
//             text: '+$coin',
//             fontSize: 14,
//             textAlign: TextAlign.center,
//           ),
//         ),
//       ],
//     );
//   }
//
//   _buildSubmitView(
//       {required ExaminationQuestionResponse examinationQuestionModel}) {
//     return examinationQuestionModel.answer!.isNotEmpty
//         ? BaseElevatedButton(
//       //width: 40,
//       height: 30,
//       borderRadius: BorderRadius.circular(getSize(8.0),),
//       onPressed: () {
//         controller.examinationAnswer(examinationQuestionModel.questionId??0);
//       },
//       gradient: LinearGradient(
//         colors: [
//           ColorConstants.buttonSubmittedStart,
//           ColorConstants.buttonSubmittedEnd,
//           // Color.fromRGBO(16, 89, 146, 1),
//         ],
//         begin: Alignment(93.75, 15),
//         end: Alignment(31.25, 15),
//         //begin: Alignment.topCenter,
//         //end: Alignment.bottomCenter,
//       ),
//       child: Opacity(
//         opacity: 0.5,
//         child: Row(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             SvgPicture.asset(
//               getAssetsSVGImg('tick_circle'),
//               color: ColorConstants.white,
//             ),
//             SizedBox(
//               width: getSize(5.0),
//             ),
//             BaseText(
//               text: StringConstants.buttonSubmitted,
//               fontWeight: FontWeight.w500,
//             ),
//           ],
//         ),
//       ),
//     )
//         :
//     Opacity(
//       opacity: examinationQuestionModel.answer!.isEmpty ? 0.3 : 1,
//       child: BaseElevatedButton(
//         //width: 40,
//         height: getSize(30.0),
//         borderRadius: BorderRadius.circular(getSize(8.0),),
//         // onPressed: (){
//         //   _showDialog();
//         // },
//         onPressed: examinationQuestionModel.answer!.isEmpty
//             ? null
//             : () {
//           _showDialog();
//           // controller.examinationAnswer(examinationQuestionModel.questionId ?? 0);
//         },
//         child: BaseText(
//           text: StringConstants.buttonSubmit,
//           fontWeight: FontWeight.w500,
//         ),
//       ),
//     );
//   }
//
//   _showDialog() {
//     Get.dialog(
//       CongratsDialog(
//         coin: 5,
//         continueCallBack: () {
//           Get.back();
//         }, offerText: 'You have successfully completed task',
//       ),
//     );
//   }
// }
