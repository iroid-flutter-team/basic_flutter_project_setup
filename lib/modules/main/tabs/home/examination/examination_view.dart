import 'package:align_flutter_app/modules/main/tabs/home/examination/examination_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../../models/response/home/inspection/examination_response.dart';
import '../../../../../routes/app_pages.dart';
import '../../../../../shared/constants/color_constants.dart';
import '../../../../../shared/constants/png_image_constant.dart';
import '../../../../../shared/constants/string_constant.dart';
import '../../../../../shared/constants/svg_image_constant.dart';
import '../../../../../shared/utils/image_utils.dart';
import '../../../../../shared/utils/math_utils.dart';
import '../../../../../shared/widgets/base_text.dart';
import '../../../../../shared/widgets/common_appbar.dart';
import '../../../../../shared/widgets/common_container_shadow.dart';
import '../../../../../shared/widgets/common_listtile_with_image.dart';
import 'model/examination_model.dart';

class ExaminationView extends GetView<ExaminationController> {
  const ExaminationView({Key? key}) : super(key: key);
  final int pageIndex = 0;
  final double percent = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: StringConstants.examinations,
        leading: IconButton(
          icon: SvgPicture.asset(
            getAssetsSVGImg('arrow_left'),
          ),
          onPressed: () {
            Get.back();
          },
        ),
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
              height: getSize(20),
            ),
            _buildListView(),
          ],
        ),
      );
    });
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
        total: 100,
        image:
        Image.network(
          examinationResponse.iconImage.toString(),
          height: getSize(39),
        ),

        // SvgPicture.asset(
        //   examinationModel.image,
        //   height: examinationModel.imageHeight,
        //   width: examinationModel.imageWidth,
        // ),
        titleText: examinationResponse.name.toString(),
        isLocked: examinationResponse.isLocked ?? false,
        rowWidget: Row(
          //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
              text: '6/25',
              fontSize: 10,
              fontWeight: FontWeight.w600,
            ),
            Spacer(),
          ],
        ),
        height: getSize(73),
        width: getSize(66),
        percentage: 10.0,
        gradientContainerColor: examinationResponse.gradientContainerColor,
        onClickCallback: examinationResponse.isLocked ?? false
            ? null
            : () {
          Get.toNamed(Routes.QUESTION, arguments: examinationResponse);
        },
        progressBar: null,
      ),
    );
  }
}
