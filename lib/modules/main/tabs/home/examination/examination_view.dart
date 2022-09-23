import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:home_yogi_flutter/di.dart';
import 'package:home_yogi_flutter/models/response/home/examination_response.dart';
import 'package:home_yogi_flutter/modules/main/tabs/home/home_controller.dart';
import 'package:home_yogi_flutter/routes/app_pages.dart';
import 'package:home_yogi_flutter/shared/utils/math_utils.dart';
import 'package:home_yogi_flutter/shared/widgets/base_text.dart';

import '../../../../../shared/constants/colors.dart';
import '../../../../../shared/constants/png_image_constant.dart';
import '../../../../../shared/constants/string_constant.dart';
import '../../../../../shared/constants/svg_image_constant.dart';
import '../../../../../shared/widgets/common_app_bar.dart';
import '../../../../../shared/widgets/common_container_shadow.dart';
import '../../../../../shared/widgets/common_linear_progress.dart';
import '../../../../../shared/widgets/common_listtile_with_image.dart';
import '../../../../../shared/widgets/show_coin.dart';
import 'model/examination_model.dart';


class ExaminationView extends GetView<HomeController> {
  const ExaminationView({Key? key, this.isFromPlanSubscriptionScreen = false})
      : super(key: key);
  final int pageIndex = 0;
  final double percent = 0.0;
  final bool isFromPlanSubscriptionScreen;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        onPress: (){
          controller.getExamination();
          Get.back();
        },
        title: StringConstants.examinations,
        leading: IconButton(
          icon: SvgPicture.asset(
            getAssetsSVGImg('arrow_left'),
          ),
          onPressed: () => isFromPlanSubscriptionScreen ? Get.offNamedUntil(Routes.MAIN, (route) => route.isFirst) : Get.back(),
        ),
        actions: [
          ShowCoin(
            numberText: DependencyInjection.userResponse.value.points?.toInt() ?? 0,
          ),
        ],
      ),
      body: _buildMainBody(),
    );
  }

  _buildMainBody() {
    return Obx(() {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: getSize(30)),
        child: Column(
          //shrinkWrap: true,
          children: [
            SizedBox(
              height: getSize(10),
            ),
            _buildCard(),
            SizedBox(
              height: getSize(30),
            ),
            BaseText(
              textAlign: TextAlign.center,
              text: controller.currentMonthRange.value,
              fontWeight: FontWeight.w500,
              textColor: ColorConstants.white.withOpacity(0.94),
              fontSize: 18,
            ),
            SizedBox(
              height: getSize(20),
            ),
            _buildListView(),
          ],
        ),
      );
    });
  }

  _buildCard() {
    return CommonContainerWithShadow(
      height: getSize(115),
      width: Get.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            PngImageConstants.smile,
            height: getSize(46),
            width: getSize(46),
          ),
          SizedBox(
            height: getSize(8),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: getSize(46)),
            child: BaseText(
              text: "Yor are few steps ahead to unlock the rewards of level 6 ",
              fontWeight: FontWeight.w500,
              textAlign: TextAlign.center,
              textColor: ColorConstants.white.withOpacity(0.94),
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  _buildListView() {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        itemCount: controller.examinationResponse.length,
        itemBuilder: (context, index) {
          return _buildListItem(controller.examinationResponse[index]);
        },
      ),
    );
  }

  _buildListItem(ExaminationResponse examinationResponse) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: getSize(12)),
      child: CommonListTileWithImage(
        image: Image.network(
          examinationResponse.iconImage.toString(),
          height: getSize(39),
        ),
        // SvgPicture.asset(
        //   examinationModel.image,
        //   height: examinationModel.imageHeight,
        //   width: examinationModel.imageWidth,
        // ),
        titleText: examinationResponse.name.toString(),
        isLocked: examinationResponse.isLocked ??false,
        isLockedText: "${examinationResponse.startMonth} - ${examinationResponse.endMonth}",
        rowWidget: Row(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(SvgImageConstants.questions),
            SizedBox(
              width: getSize(8.0),
            ),
            BaseText(
              text: StringConstants.questions,
              fontSize: 10,
              fontWeight: FontWeight.w600,
            ),
            Spacer(),
            SizedBox(
              width: getSize(88),
            ),
            BaseText(
              text: '${examinationResponse.totalAnswered}/${examinationResponse.totalQuestions}',
              fontSize: 10,
              fontWeight: FontWeight.w600,
            ),
            Spacer(),
          ],
        ),
        height: getSize(73),
        width: getSize(68),
        percentage: examinationResponse.totalAnswered!.toDouble() / examinationResponse.totalQuestions!.toDouble(),
        gradientContainerColor: examinationResponse.gradientContainerColor,
        onClickCallback: examinationResponse.isLocked ?? false
            ? null
            : () {
          Get.toNamed(Routes.QUESTION, arguments: examinationResponse);
        },
        progressBar: getLinearProgress(examinationResponse),
      ),
    );
  }

  Widget getLinearProgress(ExaminationResponse examinationResponse) {
    return CommonLinearProgressWidget(
      width: getSize(100),
      remaining: examinationResponse.totalAnswered!.toDouble(),
      total: examinationResponse.totalQuestions!.toDouble(),
    );
  }
}


// class ExaminationView extends GetView<HomeController> {
//   const ExaminationView({Key? key, this.isFromPlanSubscriptionScreen = false})
//       : super(key: key);
//   final int pageIndex = 0;
//   final double percent = 0.0;
//   final bool isFromPlanSubscriptionScreen;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: BaseAppBar(
//         title: StringConstants.examinations,
//         leading: IconButton(
//           icon: SvgPicture.asset(
//             getAssetsSVGImg('arrow_left'),
//           ),
//           onPressed: () =>
//           isFromPlanSubscriptionScreen
//               ? Get.offNamedUntil(Routes.MAIN, (route) => route.isFirst)
//               : Get.back(),
//         ),
//         actions: [
//           ShowCoin(
//             numberText: 575,
//           ),
//         ],
//       ),
//       body: _buildMainBody(),
//     );
//   }
//
//   _buildMainBody() {
//     return Obx(() {
//       return Padding(
//         padding: EdgeInsets.symmetric(horizontal: getSize(30)),
//         child: Column(
//           //shrinkWrap: true,
//           children: [
//             SizedBox(
//               height: getSize(10),
//             ),
//             _buildCard(),
//             SizedBox(
//               height: getSize(30),
//             ),
//             BaseText(
//               textAlign: TextAlign.center,
//               text: controller.currentMonthRange.value,
//               fontWeight: FontWeight.w500,
//               textColor: ColorConstants.white.withOpacity(0.94),
//               fontSize: 18,
//             ),
//             SizedBox(
//               height: getSize(20),
//             ),
//             _buildListView(),
//           ],
//         ),
//       );
//     });
//   }
//
//   _buildCard() {
//     return CommonContainerWithShadow(
//       height: getSize(115),
//       width: Get.width,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Image.asset(
//             PngImageConstants.smile,
//             height: getSize(46),
//             width: getSize(46),
//           ),
//           SizedBox(
//             height: getSize(8),
//           ),
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: getSize(46)),
//             child: BaseText(
//               text: "Yor are few steps ahead to unlock the rewards of level 6 ",
//               fontWeight: FontWeight.w500,
//               textAlign: TextAlign.center,
//               textColor: ColorConstants.white.withOpacity(0.94),
//               fontSize: 14,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//   _buildListView() {
//     return Expanded(
//       child: ListView.builder(
//         shrinkWrap: true,
//         physics: BouncingScrollPhysics(),
//         itemCount: examinationModelList.length,
//         itemBuilder: (context, index) {
//           return _buildListItem(examinationModelList[index]);
//         },
//       ),
//     );
//   }
//
//   _buildListItem(ExaminationModel examinationModel) {
//     return Padding(
//       padding: EdgeInsets.symmetric(vertical: getSize(12)),
//       child: CommonListTileWithImage(
//         image:
//         SvgPicture.asset(
//           examinationModel.image,
//           height: examinationModel.imageHeight,
//           width: examinationModel.imageWidth,
//         ),
//         // Image.network(
//         //   examinationResponse.iconImage.toString(),
//         //   height: getSize(39),
//         // ),
//         //
//         titleText: examinationModel.titleText,
//         isLocked: examinationModel.isLocked,
//        // isLockedText: "${examinationResponse.startMonth} - ${examinationResponse.endMonth}",
//         rowWidget: Row(
//           //mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             SvgPicture.asset(SvgImageConstants.questions),
//             SizedBox(
//               width: getSize(8.0),
//             ),
//             BaseText(
//               text: StringConstants.questions,
//               fontSize: 10,
//               fontWeight: FontWeight.w600,
//             ),
//             Spacer(),
//             SizedBox(
//               width: getSize(88),
//             ),
//             BaseText(
//               text: '6/25',
//              // text: '${examinationResponse.totalAnswered}/${examinationResponse.totalQuestions}',
//               fontSize: 10,
//               fontWeight: FontWeight.w600,
//             ),
//             Spacer(),
//           ],
//         ),
//         height: getSize(73),
//         width: getSize(68),
//         percentage: 0,
//         gradientContainerColor: examinationModel.gradientContainerColor,
//         onClickCallback: examinationModel.isLocked!
//             ? null
//             : () {
//           Get.toNamed(Routes.QUESTION, arguments: examinationModel);
//         },
//         progressBar: null,
//       ),
//     );
//   }
// }

// class ExaminationView extends GetView<HomeController> {
//   const ExaminationView({Key? key, this.isFromPlanSubscriptionScreen = false})
//       : super(key: key);
//   final int pageIndex = 0;
//   final double percent = 0.0;
//   final bool isFromPlanSubscriptionScreen;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: BaseAppBar(
//         title: StringConstants.examinations,
//         leading: IconButton(
//           icon: SvgPicture.asset(
//             getAssetsSVGImg('arrow_left'),
//           ),
//           onPressed: () =>
//           isFromPlanSubscriptionScreen
//               ? Get.offNamedUntil(Routes.MAIN, (route) => route.isFirst)
//               : Get.back(),
//         ),
//         actions: [
//           ShowCoin(
//             numberText: 575,
//           ),
//         ],
//       ),
//       body: _buildMainBody(),
//     );
//   }
//
//   _buildMainBody() {
//     return Obx(() {
//       return Padding(
//         padding: EdgeInsets.symmetric(horizontal: getSize(30)),
//         child: Column(
//           //shrinkWrap: true,
//           children: [
//             SizedBox(
//               height: getSize(10),
//             ),
//             _buildCard(),
//             SizedBox(
//               height: getSize(30),
//             ),
//             BaseText(
//               textAlign: TextAlign.center,
//               text: controller.currentMonthRange.value,
//               fontWeight: FontWeight.w500,
//               textColor: ColorConstants.white.withOpacity(0.94),
//               fontSize: 18,
//             ),
//             SizedBox(
//               height: getSize(20),
//             ),
//             _buildListView(),
//           ],
//         ),
//       );
//     });
//   }
//
//   _buildCard() {
//     return CommonContainerWithShadow(
//       height: getSize(115),
//       width: Get.width,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Image.asset(
//             PngImageConstants.smile,
//             height: getSize(46),
//             width: getSize(46),
//           ),
//           SizedBox(
//             height: getSize(8),
//           ),
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: getSize(46)),
//             child: BaseText(
//               text: "Yor are few steps ahead to unlock the rewards of level 6 ",
//               fontWeight: FontWeight.w500,
//               textAlign: TextAlign.center,
//               textColor: ColorConstants.white.withOpacity(0.94),
//               fontSize: 14,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   _buildListView() {
//     return Expanded(
//       child: ListView.builder(
//         shrinkWrap: true,
//         physics: BouncingScrollPhysics(),
//         itemCount: controller.examinationResponse.length,
//         itemBuilder: (context, index) {
//           return _buildListItem(controller.examinationResponse[index]);
//         },
//       ),
//     );
//   }
//
//   _buildListItem(ExaminationResponse examinationResponse) {
//     return Padding(
//       padding: EdgeInsets.symmetric(vertical: getSize(12)),
//       child: CommonListTileWithImage(
//         image: Image.network(
//           examinationResponse.iconImage.toString(),
//           height: getSize(39),
//         ),
//         // SvgPicture.asset(
//         //   examinationModel.image,
//         //   height: examinationModel.imageHeight,
//         //   width: examinationModel.imageWidth,
//         // ),
//         titleText: examinationResponse.name.toString(),
//         isLocked: examinationResponse.isLocked!,
//         isLockedText: "${examinationResponse.startMonth} - ${examinationResponse.endMonth}",
//         rowWidget: Row(
//           //mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             SvgPicture.asset(SvgImageConstants.questions),
//             SizedBox(
//               width: getSize(8.0),
//             ),
//             BaseText(
//               text: StringConstants.questions,
//               fontSize: 10,
//               fontWeight: FontWeight.w600,
//             ),
//             Spacer(),
//             SizedBox(
//               width: getSize(88),
//             ),
//             BaseText(
//               text: '${examinationResponse.totalAnswered}/${examinationResponse.totalQuestions}',
//               fontSize: 10,
//               fontWeight: FontWeight.w600,
//             ),
//             Spacer(),
//           ],
//         ),
//         height: getSize(73),
//         width: getSize(68),
//         percentage: 0,
//         gradientContainerColor: examinationResponse.gradientContainerColor,
//         onClickCallback: examinationResponse.isLocked!
//             ? null
//             : () {
//           Get.toNamed(Routes.QUESTION, arguments: examinationResponse);
//         },
//         progressBar: null,
//       ),
//     );
//   }
// }
