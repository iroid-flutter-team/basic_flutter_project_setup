import 'package:align_flutter_app/modules/main/tabs/home/examination/examination_results/summary_report/summary_report_controller.dart';
import 'package:align_flutter_app/modules/main/tabs/home/examination/examination_results/summary_report/widget/question_list_widget1.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../../../../../../shared/utils/image_utils.dart';
import '../../../../../../../shared/utils/math_utils.dart';
import '../../../../../../../shared/widgets/base_text.dart';
import '../../../../../../../shared/widgets/common_appbar.dart';
import '../../../../../../../shared/widgets/common_container_shadow.dart';
import '../../model/examination_model.dart';


class SummaryReportView extends GetView<SummaryReportController> {
  const SummaryReportView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ExaminationModel? _examinationModel;
    final Object? object = ModalRoute.of(context)?.settings.arguments;
    if (object != null) {
      _examinationModel = object as ExaminationModel;
    }

    return Scaffold(
      appBar: BaseAppBar(
        title: "Summary report",
        actions: [],
      ),
      body: _buildMainBody(),
    );
  }

  _buildMainBody() {
    controller.initQuestions();
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: CommonContainerWithShadow(
            width: Get.width,
            child: Padding(
              padding: EdgeInsets.all(18.0),
              child: BaseText(
                textAlign: TextAlign.center,
                text: "Add your suggestions on problems\nyou find in the Inspection",
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        SizedBox(
          height: getSize(20.0),
        ),
        QuestionListWidget1(),
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

  _buildPrevNextQuestionView() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: () => controller.currentQuestion.value > 0
              ? controller.carouselController.previousPage()
              : null,
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
          onTap: () => controller.currentQuestion.value <
                  controller.questionModelList.length - 1
              ? controller.carouselController.nextPage()
              : null,
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
