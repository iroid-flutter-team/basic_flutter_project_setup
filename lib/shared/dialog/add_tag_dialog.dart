import 'dart:ffi';
import 'dart:ui';
import 'package:align_flutter_app/shared/utils/focus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../constants/color_constants.dart';
import '../constants/svg_image_constant.dart';
import '../utils/math_utils.dart';
import '../widgets/base_elevated_button.dart';
import '../widgets/base_text.dart';
import '../widgets/input_field.dart';

class AddTagDialog extends StatefulWidget {
  const AddTagDialog({
    Key? key,
    // required this.continueCallBack,
  }) : super(key: key);

  // final VoidCallback continueCallBack;

  @override
  State<AddTagDialog> createState() => _AddTagDialogState();
}

class _AddTagDialogState extends State<AddTagDialog> {
  TextEditingController addTagController = TextEditingController();
  final double borderRadius = 25.0;

  RxList values = <String>[].obs;
  List<bool> selected = [];
  List<Widget> chips = [];
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
      child: Dialog(
        insetPadding: EdgeInsets.all(getSize(24.0)),
        elevation: 0,
        backgroundColor: Color(0xffffffff),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            getSize(borderRadius),
          ),
        ),
        child: Container(
          // padding: EdgeInsets.all(getSize(0.0)),
          decoration: BoxDecoration(
            color: ColorConstants.dialogBlack,
            borderRadius: BorderRadius.circular(
              getSize(borderRadius),
            ),
            border: Border.all(
              width: 1,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(right: 15, bottom: 16, left: 15),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: InkWell(
                            onTap: () {
                              Get.back();
                            },
                            child: SvgPicture.asset(
                                SvgImageConstants.close_circle)),
                      ),
                    ),
                    SizedBox(
                      height: getSize(22),
                    ),
                    BaseText(
                      text: "Add Tag",
                      fontSize: 14,
                    ),
                    SizedBox(
                      height: getSize(8),
                    ),
                    InputTextField(
                      controller: addTagController,
                      textInputType: TextInputType.text,
                      enable: true,
                      maxLength: 20,
                      counterText: "",
                      suffixIcon: InkWell(
                        onTap: () {
                          if (formKey.currentState!.validate()) {}
                          if (addTagController.text.isNotEmpty) {
                            setState(() {
                              values.add(addTagController.text);
                              // values = values;
                              selected = selected;
                            });
                          }
                          addTagController.clear();
                        },
                        child: Padding(
                          padding: EdgeInsets.all(12),
                          child: SvgPicture.asset(
                            SvgImageConstants.send,
                          ),
                        ),
                      ),
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return 'Please enter details.';
                        }
                        return null;
                      },
                    ),
                    Container(
                      child: buildChips(),
                    ),
                    SizedBox(
                      height: getSize(18),
                    ),
                    Center(
                      child: BaseElevatedButton(
                        width: getSize(214.0),
                        onPressed: () {
                          AppFocus.unfocus(context);
                          Get.back(result: values);
                          //widget.continueCallBack();
                          // values.add(addTagController.text);
                        },
                        borderRadius: BorderRadius.circular(15.0),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: BaseText(text: 'DONE'),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: getSize(10.0),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  buildChips() {
    return Obx(() {
      return Wrap(
        spacing: 16,
        children: List.generate(values.length, (index) =>
              InputChip(
                //selected: _selected[i],
                label: BaseText(
                  text: values[index],
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
                  values.removeAt(index);
                },
              ),
        ),
      );
    });
  }

// Widget buildChips() {
//   for (int i = 0; i < values.length; i++) {
//     ChipTheme actionChip = ChipTheme(
//       data: ChipTheme.of(context).copyWith(),
//       child: InputChip(
//           //selected: _selected[i],
//           label: BaseText(
//             text: values[i],
//             textColor: ColorConstants.white,
//             fontSize: 18,
//           ),
//           backgroundColor: Color(0XFF4293D4),
//           elevation: 0,
//           deleteIconColor: ColorConstants.white,
//           deleteIcon: Icon(
//             Icons.close,
//             size: 18,
//           ),
//           onPressed: () {},
//           onDeleted: () {
//             values.removeAt(i);
//             setState(() {
//               values = values;
//             });
//           },
//         ),
//     );
//     chips.add(actionChip);
//   }
//
//   return Wrap(
//     spacing: 16,
//     children: chips,
//   );
// }
}
