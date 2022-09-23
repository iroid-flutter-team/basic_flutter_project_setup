import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants/colors.dart';
import '../utils/math_utils.dart';

class InputTextField extends StatelessWidget {
  final bool? enable;
  final String? initialValue;
  final String? labelText;
  final String? hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? Function(String?)? validator;
  final Color? textColor;
  final TextEditingController controller;
  final TextInputType? textInputType;
  final int? errorMaxLines;
  final int maxLines;
  final int? minLines;
  final EdgeInsets? contentPadding;
  final Function()? onTap;
  final TextInputAction textInputAction;
  final String? errorText;
  final bool isSecure;
  final Function(String)? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final String? prefixText;
  final int? maxLength;
  final bool readOnly;
  const InputTextField({
    Key? key,
    this.initialValue,
    this.labelText,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
    this.textColor,
    required this.controller,
    this.textInputType,
    this.errorMaxLines,
    this.maxLines = 1,
    this.contentPadding,
    this.onTap,
    this.textInputAction = TextInputAction.next,
    this.errorText,
    this.isSecure = false,
    this.enable = true,
    this.readOnly = false,
    this.onChanged,
    this.inputFormatters,
    this.prefixText,
    this.maxLength,
    this.minLines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildStackContainer();
  }

  _buildStackContainer() {
    return Stack(
      children: [
        // Container(
        //   height: maxLines > 1 ? getSize(0) : getSize(55),
        //   // width: getSize(50),
        //   alignment: Alignment.center,
        //   decoration: ShapeDecoration(
        //     shadows: [
        //       CommonBoxShadow.getBlackBackgroundBoxShadow(Offset(5, 6)),
        //     ],
        //     gradient: LinearGradient(
        //       colors: [
        //         Color.fromRGBO(255, 255, 255, 0.1),
        //         Color.fromRGBO(255, 255, 255, 0.0),
        //       ],
        //       begin: Alignment(-1.0, -4.0),
        //       end: Alignment(1.0, 4.0),
        //     ),
        //     shape: SmoothRectangleBorder(
        //       borderRadius: SmoothBorderRadius.all(
        //         SmoothRadius(
        //           cornerRadius: getSize(14),
        //           cornerSmoothing: 1,
        //         ),
        //       ),
        //     ),
        //   ),
        //   child: Container(
        //     margin: EdgeInsets.all(getSize(1.5)),
        //     alignment: Alignment.center,
        //     decoration: ShapeDecoration(
        //       color: ColorConstants.darkContainerBlack,
        //       shape: SmoothRectangleBorder(
        //         borderRadius: SmoothBorderRadius.all(
        //           SmoothRadius(
        //             cornerRadius: getSize(14),
        //             cornerSmoothing: 1,
        //           ),
        //         ),
        //       ),
        //     ),
        //   ),
        // ),
        TextFormField(
          inputFormatters: inputFormatters,
          enabled: enable,
          initialValue: initialValue,
          maxLength: maxLength,
          controller: controller,
          onTap: onTap,
          cursorColor: ColorConstants.white,
          textAlignVertical: TextAlignVertical.center,
          keyboardType: textInputType ?? TextInputType.text,
          maxLines: maxLines,
          minLines: minLines ?? 1,
          obscureText: isSecure,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          textInputAction: textInputAction,
          onChanged: onChanged,
          readOnly: readOnly,
          style: TextStyle(
            debugLabel: labelText,
            color: Colors.white,
            fontSize: getFontSize(14),
            fontWeight: FontWeight.w400,
          ),
          decoration: InputDecoration(
            //  alignLabelWithHint: true,
            labelText: labelText,
            errorText: errorText,
            focusColor: ColorConstants.white,

            contentPadding: contentPadding ??
                EdgeInsets.symmetric(
                  vertical: getSize(20),
                  horizontal: getSize(20),
                ),
            hintText: hintText,
            fillColor: ColorConstants.darkContainerBlack,
            errorMaxLines: errorMaxLines ?? 1,
            filled: true,
            //    prefixIconConstraints: BoxConstraints(maxHeight: getSize(50)),
            labelStyle: TextStyle(
                fontSize: getFontSize(12),
                fontWeight: FontWeight.normal,
                //letterSpacing: Utils.getSize(0.5),
                color: textColor ?? ColorConstants.white),
            hintStyle: TextStyle(
              //  height: maxLines == 2 ? 2 : 0,
              //fontFamily: "Lexend Deca",
              fontSize: getFontSize(14),
              fontWeight: FontWeight.w400,
              //letterSpacing: 0.5,
              color: ColorConstants.white.withOpacity(0.5),
            ),
            prefixIcon: prefixIcon,
          ),
          validator: validator,
        ),
      ],
    );
  }
}
