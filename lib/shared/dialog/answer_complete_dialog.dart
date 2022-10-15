import 'dart:ui';

import 'package:align_flutter_app/shared/constants/png_image_constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants/color_constants.dart';
import '../constants/svg_image_constant.dart';
import '../utils/math_utils.dart';
import '../widgets/base_elevated_button.dart';
import '../widgets/base_text.dart';

class AnswerCompleteDialog extends StatelessWidget {
  const AnswerCompleteDialog({
    Key? key,
    required this.continueCallBack,
  }) : super(key: key);

  final VoidCallback continueCallBack;

  final double borderRadius = 25.0;

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
                    topLeft: Radius.circular(borderRadius),
                    topRight: Radius.circular(borderRadius),
                  ),
                  child: Image.asset(
                    PngImageConstants.answer_done,
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
                BaseText(
                  text: "You have successfully completed examination",
                  fontWeight: FontWeight.w500,
                  textColor: Colors.white.withOpacity(0.8),
                  textAlign: TextAlign.center,
                  fontSize: 12,
                ),
                SizedBox(
                  height: getSize(33.0),
                ),
                BaseElevatedButton(
                  width: getSize(214.0),
                  onPressed: () {
                    continueCallBack();
                  },
                  borderRadius: BorderRadius.circular(15.0),
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
        ),
      ),
    );
  }
}