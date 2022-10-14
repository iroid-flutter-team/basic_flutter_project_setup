import 'package:align_flutter_app/modules/main/tabs/home/examination/add_inspect/widget/inspect_animated_card.dart';
import 'package:align_flutter_app/routes/app_pages.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../../../shared/constants/color_constants.dart';
import '../../../../../../shared/constants/svg_image_constant.dart';
import '../../../../../../shared/dialog/add_tag_dialog.dart';
import '../../../../../../shared/utils/focus.dart';
import '../../../../../../shared/utils/image_utils.dart';
import '../../../../../../shared/utils/math_utils.dart';
import '../../../../../../shared/widgets/base_elevated_button.dart';
import '../../../../../../shared/widgets/base_text.dart';
import '../../../../../../shared/widgets/common_appbar.dart';
import '../../../../../../shared/widgets/common_container_shadow.dart';
import '../../../../../../shared/widgets/input_field.dart';
import '../question/widget/animated_card.dart';
import 'add_inspect_controller.dart';

class AddInspectView extends GetView<AddInspectController> {
  const AddInspectView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        onPress: () {
          Get.back();
          Get.delete<AddInspectController>();
        },
        title: controller.questionModel?.title ?? "",
      ),
      body: _buildMainBody(context),
    );
  }

  _buildMainBody(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getSize(30),
      ),
      child: ListView(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        children: [
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: controller.questionModel?.checkList?.length,
            itemBuilder: (context, index) {
              return Obx(() {
                return ListTile(
                  dense: true,
                  visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                  contentPadding: EdgeInsets.zero,
                  minLeadingWidth: getSize(20),
                  onTap: () {
                    controller.questionModel?.checkList?[index].isChecked?.value = !(controller.questionModel!.checkList![index].isChecked!.value);
                  },
                  title: BaseText(
                    text: controller.questionModel?.checkList?[index].option ??
                        "",
                    fontSize: 14,
                  ),
                  leading: SizedBox(
                    height: double.infinity,
                    child: SvgPicture.asset(
                      controller.questionModel!.checkList![index].isChecked!.value
                          ? SvgImageConstants.check
                          : SvgImageConstants.square,
                    ),
                  ),
                );
              });
            },),
          // Obx(
          //   () {
          //     return ListTile(
          //       dense: true,
          //       visualDensity: VisualDensity(horizontal: 0, vertical: -4),
          //       contentPadding: EdgeInsets.zero,
          //       minLeadingWidth: getSize(20),
          //       onTap: () {
          //         controller.isCheck.value = !controller.isCheck.value;
          //       },
          //       title: BaseText(
          //         text: "A. Examine your window caulking",
          //         fontSize: 14,
          //       ),
          //       leading: SizedBox(
          //         height: double.infinity,
          //         child: SvgPicture.asset(
          //           controller.isCheck.value
          //               ? SvgImageConstants.check
          //               : SvgImageConstants.square,
          //         ),
          //       ),
          //     );
          //   },
          // ),
          // Obx(
          //   () {
          //     return ListTile(
          //       dense: true,
          //       visualDensity: VisualDensity(horizontal: 0, vertical: -4),
          //       contentPadding: EdgeInsets.zero,
          //       minLeadingWidth: getSize(20),
          //       onTap: () {
          //         controller.isCheck1.value = !controller.isCheck1.value;
          //       },
          //       title: BaseText(
          //         text: "B. Examine your window seals",
          //         fontSize: 14,
          //       ),
          //       leading: SizedBox(
          //         height: double.infinity,
          //         child: SvgPicture.asset(
          //           controller.isCheck1.value
          //               ? SvgImageConstants.check
          //               : SvgImageConstants.square,
          //         ),
          //       ),
          //     );
          //   },
          // ),
          SizedBox(
            height: getSize(30),
          ),
          controller.localImagePathList.isNotEmpty
              ? InspectAnimatedCard()
              : DottedBorder(
              borderType: BorderType.RRect,
              dashPattern: [8, 8],
              color: Color(0xffB7B7B7).withOpacity(0.75),
              radius: Radius.circular(getSize(24)),
              child: InspectAnimatedCard()
            // Container(
            //   height: getSize(140),
            //   width: Get.width,
            //   child: InkWell(
            //     onTap: (){
            //
            //     },
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       children: [
            //         SvgPicture.asset(
            //           SvgImageConstants.add_photo,
            //         ),
            //         BaseText(
            //           text: "Take Photo",
            //           fontSize: 16,
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
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
            textInputAction: TextInputAction.done,
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
          Align(
            alignment: Alignment.centerLeft,
            child: InkWell(
              onTap: () async {
                var res = await Get.dialog(
                  AddTagDialog(),
                );
                if (res != null) {
                  try {
                    printInfo(info: 'res.length ==> ${res.length}');
                    //var oldList = controller.chipsList;
                    // controller.chipsList = res;
                    controller.chipsList.addAll(res);
                    printInfo(info: ' controller.chipsList ==> ${controller
                        .chipsList}');
                  }catch(ex){
                    print("ex========${ex.toString()}");
                  }
                }
                //showAddTagDialog();
              },
              child: CommonContainerWithShadow(
                height: getSize(30),
                width: getSize(112),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: getSize(14),
                    vertical: getSize(6),
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset(SvgImageConstants.add),
                      SizedBox(
                        width: getSize(9),
                      ),
                      BaseText(
                        text: "Add Tag",
                        fontSize: 14,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: getSize(10),
          ),
          controller.chipsList.isEmpty
              ? Container()
              : Obx(
                () {
              print(
                  "chipsList================${controller.chipsList.length}");
              return Wrap(
                spacing: 16,
                children: List.generate(
                  controller.chipsList.length,
                      (index) =>
                      InputChip(
                        //selected: _selected[i],
                        label: BaseText(
                          text: controller.chipsList[index],
                          textColor: ColorConstants.white,
                          fontSize: 18,
                        ),
                        backgroundColor: Color(0XFF4293D4),
                        elevation: 0,
                        deleteIconColor: ColorConstants.white,
                        deleteIcon: Icon(
                          Icons.close,
                          size: 18,
                        ),
                        onPressed: () {},
                        onDeleted: () {
                          controller.chipsList.removeAt(index);
                        },
                      ),
                ),
              );
            },
          ),
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
            textInputAction: TextInputAction.done,
            maxLines: 3,
            minLines: 1,
            onTap: () {
              AppFocus.unfocus(context);
            },
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
            onPressed: () async {
              // print("QuestionModel123====${controller.questionModel?.notes}");
              controller.questionModel!.questionSubmitted ? controller
                  .updateAnswer(controller.answerId) : controller.getAnswer(
                  controller.questionModel?.id ?? 0);

              // controller.answerId == null
              //     ?  controller.getAnswer(controller.questionModel?.id ?? 0)
              //     : controller.updateAnswer(controller.answerId);
              // controller.questionController.getQuestion( controller.examinationId ,controller.jobId, );
              //Get.toNamed(Routes.EXAMINATION_RESULT);
              // List<String> imageUrlList = await  controller.getAnswer(controller.questionModel?.id ?? 0);
              // controller.questionModel?.imagePathList.addAll(imageUrlList);
            },
            child: BaseText(
              text: controller.questionModel!.questionSubmitted
                  ? "EDIT"
                  : "ADD",
            ),
          ),
          SizedBox(
            height: getSize(20),
          ),
        ],
      ),
    );
  }

  _buildReviewSliderView() {
    return Column(
      children: [
        Obx(
              () {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                controller.distanceValue.value == 0.0
                    ? _commonRatingImageView(SvgImageConstants.very_poor, 40)
                    : _commonRatingImageView(
                    SvgImageConstants.unselected_very_poor, 30),
                controller.distanceValue.value == 1.0
                    ? _commonRatingImageView(SvgImageConstants.poor, 40)
                    : _commonRatingImageView(
                    SvgImageConstants.unselected_poor, 30),
                controller.distanceValue.value == 2.0
                    ? _commonRatingImageView(SvgImageConstants.average, 40)
                    : _commonRatingImageView(
                    SvgImageConstants.unselected_average, 30),
                controller.distanceValue.value == 3.0
                    ? _commonRatingImageView(SvgImageConstants.good, 40)
                    : _commonRatingImageView(
                    SvgImageConstants.unselected_good, 30),
                controller.distanceValue.value == 4.0
                    ? _commonRatingImageView(SvgImageConstants.excellent, 40)
                    : _commonRatingImageView(
                    SvgImageConstants.unselected_excellent, 30),
              ],
            );
          },
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
                min: 0,
                max: controller.values.length - 1,
                value: controller.distanceValue.value.toDouble(),
                divisions: controller.values.length - 1,
                //activeColor: Color(0XFF3D4D71),
                onChanged: (double value) {
                  controller.distanceValue.value = value.toDouble();
                  print("distanceValue ======== ${controller.distanceValue}");
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

  _commonRatingImageView(String image, double height) {
    return SvgPicture.asset(
      image,
      height: height,
    );
  }

  commonCircle({required int index}) {
    return Obx(() {
      return Container(
        margin: EdgeInsets.only(right: 5, left: 5),
        height: 8,
        width: 8,
        decoration: BoxDecoration(
          color: controller.distanceValue.value == index
              ? ColorConstants.white
              : ColorConstants.white.withOpacity(0.4),
          // controller.distanceValue.value == 0.5
          //     ? ColorConstants.white
          //     : controller.distanceValue.value == 1.0
          //         ? ColorConstants.white
          //         : controller.distanceValue.value == 2.0
          //             ? ColorConstants.white
          //             : controller.distanceValue.value == 3.0
          //                 ? ColorConstants.white
          //                 : controller.distanceValue.value == 4.0
          //                     ? ColorConstants.white
          //                     : ColorConstants.white.withOpacity(0.4),
          borderRadius: BorderRadius.circular(50),
          // border: Border.all(color: ColorConstants.white),
        ),
      );
    });
  }

  Widget buildChips(BuildContext context) {
    for (int i = 0; i < controller.chipsList.length; i++) {
      ChipTheme actionChip = ChipTheme(
        data: ChipTheme.of(context).copyWith(),
        child: Obx(() {
          return InputChip(
            //selected: _selected[i],
            label: BaseText(
              text: controller.chipsList[i],
              textColor: ColorConstants.white,
              fontSize: 18,
            ),
            backgroundColor: Color(0XFF4293D4),
            elevation: 0,
            deleteIconColor: ColorConstants.white,
            deleteIcon: Icon(
              Icons.close,
              size: 18,
            ),
            onPressed: () {},
            onDeleted: () {
              controller.chipsList.removeAt(i);
              controller.chipsList = controller.chipsList;
            },
          );
        }),
      );
      controller.chips.add(actionChip);
    }

    return Wrap(
      spacing: 16,
      children: controller.chips,
    );
  }
// showAddTagDialog() async {
//   var res = await Get.dialog(
//     AddTagDialog(
//         // continueCallBack: () {
//         //   Get.back();
//         //   // Get.offAll(
//         //   //   UserDetailScreen(),
//         //   //   binding: UserDetailBindings(),
//         //   // );
//         // },
//         ),
//     barrierDismissible: false,
//   );
// }
}
