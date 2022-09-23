import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:home_yogi_flutter/di.dart';
import 'package:home_yogi_flutter/models/response/home/examination_response.dart';
import 'package:home_yogi_flutter/modules/main/tabs/home/examination/question/question_controller.dart';
import 'package:home_yogi_flutter/modules/main/tabs/home/examination/question/widget/question_list_widget.dart';
import '../../../../../../shared/utils/math_utils.dart';
import '../../../../../../shared/widgets/base_text.dart';
import '../../../../../../shared/widgets/common_app_bar.dart';
import '../../../../../../shared/widgets/common_linear_progress.dart';
import '../../../../../../shared/widgets/common_linear_progress_indicator.dart';
import '../../../../../../shared/widgets/gradiant_container_with_image.dart';
import '../../../../../../shared/widgets/show_coin.dart';
import '../model/examination_model.dart';

class QuestionView extends GetView<QuestionController> {
  const QuestionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ExaminationModel examinationModel = ExaminationModel(
      imageWidth: 50,
      description: '',
      titleText: '',
      image: '',
      imageHeight: 50,
      gradientContainerColor: [Colors.white, Colors.black],
    );
    //  final Object? object = ModalRoute.of(context)?.settings.arguments;
    // if (object != null) {
    //   _examinationModel = object as ExaminationModel;
    // }

    return Scaffold(
      appBar: BaseAppBar(
        title: controller.argumentData.name ?? "",
        onPress: (){
          controller.homeController.getExamination();
          //controller.homeController.getProgressReport();
          Get.back();
        },
        actions: [
          ShowCoin(
            numberText:
                DependencyInjection.userResponse.value.points?.toInt() ?? 0,
          ),
        ],
      ),
      body: _buildMainBody(controller.argumentData),
    );
  }

  _buildMainBody(ExaminationResponse examinationResponse) {
    controller.getExaminationQuestion(examinationResponse.examinationId!);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        _buildQuestionWithProgressView(examinationResponse),
        SizedBox(
          height: getSize(20.0),
        ),
        QuestionListWidget(),
        SizedBox(
          height: getSize(20.0),
        ),
        _buildPrevNextQuestionView(),
        SizedBox(
          height: getSize(20.0),
        ),
      ],
    );
  }

  _buildQuestionWithProgressView(ExaminationResponse examinationResponse) {
    return Column(
      children: [
        Center(
          child: GradiantContainerWithImage(
            height: getSize(94),
            width: getSize(94),
            gradientContainerColor: examinationResponse.gradientContainerColor!,
            //_examinationModel.gradientContainerColor ?? [],
            //examinationModelList[0].gradientContainerColor ?? [],
            image: Image.network(
              examinationResponse.iconImage.toString(),
              height: getSize(50),
              width: getSize(66),
            ),
            // SvgPicture.asset(
            //   _examinationModel.image,
            //   //examinationModelList[0].image ?? '',
            //   height: getSize(50),
            //   width: getSize(50),
            // ),
          ),
        ),
        SizedBox(
          height: getSize(20.0),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getSize(30.0),
          ),
          child: BaseText(
            text: examinationResponse.description.toString(),
            // 'don\'t want to be stuck in the heat? Learn to keep your home in good shape with our summer examinations.',
            fontWeight: FontWeight.w500,
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          height: getSize(20.0),
        ),
        // CommonLinearProgressWidget(
        //   width: getSize(100),
        //   remaining: examinationResponse.totalAnswered!.toDouble(),
        //   total: examinationResponse.totalQuestions!.toDouble(),
        // ),
        CommonLinearProgressIndicator(),
      ],
    );
  }

  _buildPrevNextQuestionView() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: () => controller.currentQuestion.value > 0 ? controller.carouselController.previousPage() : null,
          child: Obx(() {
            return Opacity(
              opacity: controller.currentQuestion.value == 0 ? 0.5 : 1,
              child: SvgPicture.asset(
                getAssetsSVGImg('arrow_left'),
              ),
            );
          }),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getSize(10.0),
          ),
          child: Obx(() {
            return BaseText(
              text: getPageNavigationText(),
              fontSize: 18,
              fontWeight: FontWeight.w500,
            );
          }),
        ),
        GestureDetector(
          onTap: () => controller.currentQuestion.value < controller.questionModelList.length - 1 ? controller.carouselController.nextPage() : null,
          child: Obx(() {
            return Opacity(
              opacity: controller.currentQuestion.value ==
                      controller.questionModelList.length - 1
                  ? 0.5
                  : 1,
              child: SvgPicture.asset(
                getAssetsSVGImg('arrow_forward'),
              ),
            );
          }),
        ),
      ],
    );
  }

  String getPageNavigationText() {
    int currentQuestion = controller.currentQuestion.value + 1;
    int totalQuestion = controller.questionModelList.length;
    return '$currentQuestion Out of $totalQuestion';
  }
}

// class QuestionView extends GetView<QuestionController> {
//   const QuestionView({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     ExaminationModel? _examinationModel;
//     // ExaminationModel examinationModel = ExaminationModel(
//     //   imageWidth: 50,
//     //   description: '',
//     //   titleText: '',
//     //   image: '',
//     //   imageHeight: 50,
//     //   gradientContainerColor: [Colors.white, Colors.black],
//     // );
//      final Object? object = ModalRoute.of(context)?.settings.arguments;
//     if (object != null) {
//       _examinationModel = object as ExaminationModel;
//     }
//
//     return Scaffold(
//       appBar: BaseAppBar(
//         title: _examinationModel!.titleText,
//         //title: controller.argumentData.name ?? "",
//         actions: [
//           ShowCoin(
//             numberText: 575,
//           ),
//         ],
//       ),
//       body: _buildMainBody(_examinationModel),
//     );
//   }
//
//   _buildMainBody(ExaminationModel _examinationModel) {
//     controller.initQuestions();
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: <Widget>[
//         _buildQuestionWithProgressView(_examinationModel),
//         SizedBox(
//           height: getSize(20.0),
//         ),
//         QuestionListWidget(),
//         SizedBox(
//           height: getSize(20.0),
//         ),
//         _buildPrevNextQuestionView(),
//         SizedBox(
//           height: getSize(20.0),
//         ),
//       ],
//     );
//   }
//
//   _buildQuestionWithProgressView(ExaminationModel _examinationModel) {
//     return Column(
//       children: [
//         Center(
//           child: GradiantContainerWithImage(
//             height: getSize(94),
//             width: getSize(94),
//             gradientContainerColor:
//             //examinationResponse.gradientContainerColor!,
//                 _examinationModel.gradientContainerColor ?? [],
//             //examinationModelList[0].gradientContainerColor ?? [],
//             image: SvgPicture.asset(
//               _examinationModel.image,
//               //examinationModelList[0].image ?? '',
//               height: getSize(50),
//               width: getSize(50),
//             ),
//             // Image.network(
//             //   examinationResponse.iconImage.toString(),
//             //     height: getSize(50),
//             //     width: getSize(50),
//             // ),
//           ),
//         ),
//         SizedBox(
//           height: getSize(20.0),
//         ),
//         Padding(
//           padding: EdgeInsets.symmetric(
//             horizontal: getSize(30.0),
//           ),
//           child: BaseText(
//             text: _examinationModel.description,
//            // text: examinationResponse.description.toString(),
//             // 'don\'t want to be stuck in the heat? Learn to keep your home in good shape with our summer examinations.',
//             fontWeight: FontWeight.w500,
//             textAlign: TextAlign.center,
//           ),
//         ),
//         SizedBox(
//           height: getSize(20.0),
//         ),
//         CommonLinearProgressIndicator(),
//       ],
//     );
//   }
//
//   _buildPrevNextQuestionView() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: [
//         GestureDetector(
//           onTap: () => controller.currentQuestion.value > 0
//               ? controller.carouselController.previousPage()
//               : null,
//           child: Obx(() {
//             return Opacity(
//               opacity: controller.currentQuestion.value == 0 ? 0.5 : 1,
//               child: SvgPicture.asset(
//                 getAssetsSVGImg('arrow_left'),
//               ),
//             );
//           }),
//         ),
//         Padding(
//           padding: EdgeInsets.symmetric(
//             horizontal: getSize(10.0),
//           ),
//           child: Obx(() {
//             return BaseText(
//               text: getPageNavigationText(),
//               fontSize: 18,
//               fontWeight: FontWeight.w500,
//             );
//           }),
//         ),
//         GestureDetector(
//           onTap: () => controller.currentQuestion.value <
//                   controller.examinationQuestionResponse.length - 1
//               ? controller.carouselController.nextPage()
//               : null,
//           child: Obx(() {
//             return Opacity(
//               opacity: controller.currentQuestion.value ==
//                       controller.examinationQuestionResponse.length - 1
//                   ? 0.5
//                   : 1,
//               child: SvgPicture.asset(
//                 getAssetsSVGImg('arrow_forward'),
//               ),
//             );
//           }),
//         ),
//       ],
//     );
//   }
//
//   String getPageNavigationText() {
//     int currentQuestion = controller.currentQuestion.value + 1;
//     int totalQuestion = controller.examinationQuestionResponse.length;
//     return '$currentQuestion Out of $totalQuestion';
//   }
// }

// class QuestionView extends GetView<QuestionController> {
//   const QuestionView({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     ExaminationModel examinationModel = ExaminationModel(
//       imageWidth: 50,
//       description: '',
//       titleText: '',
//       image: '',
//       imageHeight: 50,
//       gradientContainerColor: [Colors.white, Colors.black],
//     );
//     //  final Object? object = ModalRoute.of(context)?.settings.arguments;
//     // if (object != null) {
//     //   _examinationModel = object as ExaminationModel;
//     // }
//
//     return Scaffold(
//       appBar: BaseAppBar(
//         title: controller.argumentData.name ?? "",
//         actions: [
//           ShowCoin(
//             numberText: 575,
//           ),
//         ],
//       ),
//       body: _buildMainBody(controller.argumentData),
//     );
//   }
//
//   _buildMainBody(ExaminationResponse examinationResponse) {
//     //controller.initQuestions();
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: <Widget>[
//         _buildQuestionWithProgressView(examinationResponse),
//         SizedBox(
//           height: getSize(20.0),
//         ),
//         QuestionListWidget(),
//         SizedBox(
//           height: getSize(20.0),
//         ),
//         _buildPrevNextQuestionView(),
//         SizedBox(
//           height: getSize(20.0),
//         ),
//       ],
//     );
//   }
//
//   _buildQuestionWithProgressView(ExaminationResponse examinationResponse) {
//     return Column(
//       children: [
//         Center(
//           child: GradiantContainerWithImage(
//             height: getSize(94),
//             width: getSize(94),
//             gradientContainerColor: examinationResponse.gradientContainerColor!,
//             //_examinationModel.gradientContainerColor ?? [],
//             //examinationModelList[0].gradientContainerColor ?? [],
//             image: Image.network(
//               examinationResponse.iconImage.toString(),
//               height: getSize(50),
//               width: getSize(50),
//             ),
//             // SvgPicture.asset(
//             //   _examinationModel.image,
//             //   //examinationModelList[0].image ?? '',
//             //   height: getSize(50),
//             //   width: getSize(50),
//             // ),
//           ),
//         ),
//         SizedBox(
//           height: getSize(20.0),
//         ),
//         Padding(
//           padding: EdgeInsets.symmetric(
//             horizontal: getSize(30.0),
//           ),
//           child: BaseText(
//             text: examinationResponse.description.toString(),
//             // 'don\'t want to be stuck in the heat? Learn to keep your home in good shape with our summer examinations.',
//             fontWeight: FontWeight.w500,
//             textAlign: TextAlign.center,
//           ),
//         ),
//         SizedBox(
//           height: getSize(20.0),
//         ),
//         CommonLinearProgressIndicator(),
//       ],
//     );
//   }
//
//   _buildPrevNextQuestionView() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: [
//         GestureDetector(
//           onTap: () => controller.currentQuestion.value > 0
//               ? controller.carouselController.previousPage()
//               : null,
//           child: Obx(() {
//             return Opacity(
//               opacity: controller.currentQuestion.value == 0 ? 0.5 : 1,
//               child: SvgPicture.asset(
//                 getAssetsSVGImg('arrow_left'),
//               ),
//             );
//           }),
//         ),
//         Padding(
//           padding: EdgeInsets.symmetric(
//             horizontal: getSize(10.0),
//           ),
//           child: Obx(() {
//             return BaseText(
//               text: getPageNavigationText(),
//               fontSize: 18,
//               fontWeight: FontWeight.w500,
//             );
//           }),
//         ),
//         GestureDetector(
//           onTap: () => controller.currentQuestion.value <
//               controller.examinationQuestionResponse.length - 1
//               ? controller.carouselController.nextPage()
//               : null,
//           child: Obx(() {
//             return Opacity(
//               opacity: controller.currentQuestion.value ==
//                   controller.examinationQuestionResponse.length - 1
//                   ? 0.5
//                   : 1,
//               child: SvgPicture.asset(
//                 getAssetsSVGImg('arrow_forward'),
//               ),
//             );
//           }),
//         ),
//       ],
//     );
//   }
//
//   String getPageNavigationText() {
//     int currentQuestion = controller.currentQuestion.value + 1;
//     int totalQuestion = controller.examinationQuestionResponse.length;
//     return '$currentQuestion Out of $totalQuestion';
//   }
// }
