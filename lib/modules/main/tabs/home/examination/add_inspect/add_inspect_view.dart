import 'package:align_flutter_app/modules/main/tabs/home/examination/add_inspect/add_inspect_controller.dart';
import 'package:align_flutter_app/modules/main/tabs/home/examination/question/model/question_model.dart';
import 'package:align_flutter_app/shared/constants/png_image_constant.dart';
import 'package:align_flutter_app/shared/widgets/base_elevated_button.dart';
import 'package:align_flutter_app/shared/widgets/base_text.dart';
import 'package:align_flutter_app/shared/widgets/common_appbar.dart';
import 'package:align_flutter_app/shared/widgets/common_container_shadow.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../../../shared/constants/color_constants.dart';
import '../../../../../../shared/constants/svg_image_constant.dart';
import '../../../../../../shared/utils/image_utils.dart';
import '../../../../../../shared/utils/math_utils.dart';
import '../../../../../../shared/widgets/input_field.dart';
import '../question/widget/animated_card.dart';

class AddInspectView extends GetView<AddInspectController> {
  const AddInspectView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: 'Windows',
      ),
      body: _buildMainBody(),
    );
  }

  _buildMainBody() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getSize(30),
      ),
      child: ListView(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        children: [
          Obx(() {
            return Row(
              children: [
                InkWell(
                  onTap: () {
                    controller.isCheck.value = !controller.isCheck.value;
                  },
                  child: SvgPicture.asset(
                    controller.isCheck.value
                        ? SvgImageConstants.check
                        : SvgImageConstants.square,
                  ),
                ),
                SizedBox(
                  width: getSize(20),
                ),
                BaseText(
                  text: "A. Examine your window caulking",
                  fontSize: 14,
                ),
              ],
            );
          }),
          SizedBox(
            height: getSize(10),
          ),
          Obx(() {
            return Row(
              children: [
                InkWell(
                  onTap: () {
                    controller.isCheck1.value = !controller.isCheck1.value;
                  },
                  child: SvgPicture.asset(
                    controller.isCheck1.value
                        ? SvgImageConstants.check
                        : SvgImageConstants.square,
                  ),
                ),
                SizedBox(
                  width: getSize(20),
                ),
                BaseText(
                  text: "B. Examine your window seals",
                  fontSize: 14,
                ),
              ],
            );
          }),
          SizedBox(
            height: getSize(30),
          ),
          DottedBorder(
            borderType: BorderType.RRect,
            dashPattern: [8, 8],
            color: Color(0xffB7B7B7).withOpacity(0.75),
            radius: Radius.circular(getSize(24)),
            child: Container(
              height: getSize(140),
              width: Get.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    SvgImageConstants.add_photo,
                  ),
                  BaseText(
                    text: "Take Photo",
                    fontSize: 16,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: getSize(30),
          ),
          BaseText(
            text: "Add note",
            fontSize: 14,
          ),
          SizedBox(
            height: getSize(6),
          ),
          InputTextField(
            controller: controller.addNoteController,
            textInputType: TextInputType.multiline,
            textInputAction: TextInputAction.newline,
            maxLines: 8,
            minLines: 7,
            // validator: (value) {
            //   if (value == null || value.isEmpty) {
            //     return 'Please enter details.';
            //   }
            //   return null;
            // },
          ),
          SizedBox(
            height: getSize(20),
          ),
          // CommonContainerWithShadow(
          //   height: getSize(30),
          //   width: getSize(80),
          //   child: Padding(
          //     padding: EdgeInsets.symmetric(
          //       horizontal: getSize(14),
          //       vertical: getSize(6),
          //     ),
          //     child: Row(
          //       children: [
          //         SvgPicture.asset(SvgImageConstants.add),
          //         BaseText(
          //           text: "Add Tag",
          //           fontSize: 14,
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          SizedBox(
            height: getSize(30),
          ),
          BaseText(
            text: "Assign room / location",
            fontSize: 14,
          ),
          SizedBox(
            height: getSize(6),
          ),
          InputTextField(
            controller: controller.locationController,
            textInputType: TextInputType.multiline,
            textInputAction: TextInputAction.newline,
            maxLines: 3,
            minLines: 2,
            // validator: (value) {
            //   if (value == null || value.isEmpty) {
            //     return 'Please enter details.';
            //   }
            //   return null;
            // },
          ),
          SizedBox(
            height: getSize(30),
          ),
          _buildReviewSliderView(),
          SizedBox(
            height: getSize(30),
          ),
          BaseElevatedButton(
            onPressed: () {},
            child: BaseText(
              text: "ADD",
            ),
          ),
        ],
      ),
    );
  }

  _buildReviewSliderView() {
    return Column(
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
        SliderTheme(
          data: SliderThemeData(
            thumbColor: Color(0XFF86E2FF),
            activeTrackColor: Color(0XFF86E2FF),
            inactiveTrackColor: Color(0XFF3D4D71),
            activeTickMarkColor: Colors.transparent,
            inactiveTickMarkColor: Colors.transparent,
            trackHeight: 9,
            overlayShape: RoundSliderOverlayShape(overlayRadius: 10.0),
          ),
          child: Obx(
            () {
              return Slider(
                max: 100.0,
                value: controller.distanceValue.value,
                divisions: 4,
                //activeColor: Color(0XFF3D4D71),
                onChanged: (double value) {
                  controller.distanceValue.value = value.toDouble();
                },
              );
            },
          ),
        ),
        SizedBox(
          height: getSize(16),
        ),
        Padding(
          padding: EdgeInsets.only(left: 6, right: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(5, (index) => commonCircle(index: index)),
          ),
        ),
      ],
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
