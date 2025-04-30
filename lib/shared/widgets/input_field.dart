// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:get/route_manager.dart';
// import 'package:grape_vendor_app/shared/constants/color_constants.dart';

// import '../utils/math_utils.dart';

// class InputTextField extends StatelessWidget {
//   final bool? enable;
//   final String? initialValue;
//   final String? labelText;
//   final String? hintText;
//   final Widget? suffixIcon;
//   final Widget? prefixIcon;
//   final String? Function(String?)? validator;
//   final Color? textColor;
//   final Color? borderColor;
//   final TextEditingController controller;
//   final TextInputType? textInputType;
//   final TextAlign? textAlign;
//   final int? errorMaxLines;
//   final FocusNode? focusNode;
//   final int? maxLines;
//   final int? minLines;
//   final int? maxLength;
//   final TextCapitalization? textCapitalization;
//   final EdgeInsets? contentPadding;
//   final Function()? onTap;
//   final TextInputAction? textInputAction;
//   final String? errorText;
//   final bool isSecure;
//   final Function(String)? onFieldSubmitted;
//   final Function(String)? onChanged;
//   final List<TextInputFormatter>? inputFormatters;
//   final String? prefixText;
//   final double? fontSize;
//   final double? borderWidth;
//   const InputTextField(
//       {super.key,
//       this.initialValue,
//       this.labelText,
//       this.hintText,
//       this.prefixIcon,
//       this.suffixIcon,
//       this.validator,
//       this.textColor,
//       required this.controller,
//       this.textInputType,
//       this.errorMaxLines,
//       // this.maxLines = 1,
//       this.maxLines,
//       this.minLines,
//       this.maxLength,
//       this.contentPadding,
//       this.onTap,
//       this.textInputAction,
//       this.borderColor,
//       this.errorText,
//       this.isSecure = false,
//       this.enable = true,
//       this.onChanged,
//       this.fontSize,
//       this.inputFormatters,
//       this.prefixText,
//       this.focusNode,
//       this.onFieldSubmitted,
//       this.textCapitalization,
//       this.borderWidth,
//       this.textAlign});

//   @override
//   Widget build(BuildContext context) {
//     return _buildStackContainer();
//   }

//   _buildStackContainer() {
//     return MediaQuery(
//       data: MediaQuery.of(Get.context!).copyWith(textScaler: const TextScaler.linear(1.0)),
//       child: TextFormField(
//         inputFormatters: inputFormatters ?? [FilteringTextInputFormatter.deny(RegExp(r'^\s'))],
//         enabled: enable,
//         initialValue: initialValue,
//         controller: controller,
//         onTap: onTap,
//         cursorColor: ColorConstants.kPrimary,
//         textAlignVertical: TextAlignVertical.center,
//         textAlign: textAlign ?? TextAlign.start,
//         keyboardType: textInputType ?? TextInputType.text,
//         autocorrect: false,
//         enableSuggestions: false,
//         maxLines: maxLines ?? 1,
//         minLines: minLines ?? 1,
//         maxLength: maxLength,
//         focusNode: focusNode,
//         obscureText: isSecure,
//         obscuringCharacter: '●',
//         textCapitalization: textCapitalization ?? TextCapitalization.none,
//         autovalidateMode: AutovalidateMode.onUserInteraction,
//         textInputAction: textInputAction ?? TextInputAction.next,
//         onChanged: onChanged,
//         style: TextStyle(
//           debugLabel: labelText,
//           fontFamily: 'SFPro',
//           letterSpacing: 0.5,
//           color: ColorConstants.black,
//           fontSize: fontSize ?? getFontSize(14),
//           fontWeight: FontWeight.w400,
//         ),
//         decoration: InputDecoration(
//           alignLabelWithHint: true,
//           counterText: '',
//           isDense: true,
//           filled: true,
//           labelText: labelText,
//           errorText: errorText,
//           focusColor: ColorConstants.white,

//           contentPadding: contentPadding ??
//               EdgeInsets.symmetric(
//                 vertical: getSize(14),
//                 horizontal: getSize(18),
//               ),
//           hintText: hintText,
//           fillColor: ColorConstants.white,
//           errorMaxLines: errorMaxLines ?? 1,
//           border: OutlineInputBorder(
//             borderSide: BorderSide(
//                 color: borderColor ?? ColorConstants.black.withOpacity(0.2), width: borderWidth ?? getSize(1.5)),
//             borderRadius: BorderRadius.circular(14),
//           ),
//           enabledBorder: OutlineInputBorder(
//             borderSide: BorderSide(
//                 color: borderColor ?? ColorConstants.black.withOpacity(0.2), width: borderWidth ?? getSize(1.5)),
//             borderRadius: BorderRadius.circular(14),
//           ),
//           focusedBorder: OutlineInputBorder(
//             borderSide: BorderSide(color: borderColor ?? ColorConstants.black, width: borderWidth ?? getSize(1.5)),
//             borderRadius: BorderRadius.circular(14),
//           ),
//           focusedErrorBorder: OutlineInputBorder(
//             borderSide: BorderSide(
//                 color: borderColor ?? ColorConstants.black.withOpacity(0.2), width: borderWidth ?? getSize(1.5)),
//             borderRadius: BorderRadius.circular(14),
//           ),

//           errorStyle: TextStyle(
//             fontSize: getFontSize(12),
//             fontWeight: FontWeight.normal, fontFamily: 'Poppins',
//             letterSpacing: 0.5,
//             //letterSpacing: Utils.getSize(0.5),
//             color: ColorConstants.redErrorColor,
//           ),
//           //    prefixIconConstraints: BoxConstraints(maxHeight: getSize(50)),
//           labelStyle: TextStyle(
//             fontSize: getFontSize(12),
//             fontWeight: FontWeight.normal, fontFamily: 'Poppins',
//             letterSpacing: 0.5,
//             //letterSpacing: Utils.getSize(0.5),
//             color: textColor ?? ColorConstants.black,
//           ),
//           hintStyle: TextStyle(
//             //  height: maxLines == 2 ? 2 : 0,
//             //fontFamily: "Lexend Deca",
//             fontSize: getFontSize(12), fontFamily: 'SFPro',
//             fontWeight: FontWeight.w500,
//             letterSpacing: 0.5,
//             color: ColorConstants.black1,
//           ),
//           suffixIcon: suffixIcon,

//           suffixIconConstraints: BoxConstraints(
//             maxHeight: getSize(50),
//             minWidth: getSize(80),
//           ),
//           prefixIcon: prefixIcon,
//         ),
//         onFieldSubmitted: onFieldSubmitted,
//         validator: validator,
//       ),
//     );
//   }
// }

// InputTextField getTextField(
//     {required String hintText,
//     required TextEditingController controller,
//     required String? Function(String?) validator,
//     dynamic Function(String)? onChanged,
//     Widget? suffix,
//     bool isSecure = false,
//     FocusNode? focusNode,
//     Function(String)? onFieldSubmitted,
//     TextInputAction? textInputAction,
//     TextInputType? textInputType,
//     TextCapitalization? textCapitalization}) {
//   return InputTextField(
//     controller: controller,
//     hintText: hintText,
//     validator: validator,
//     onChanged: onChanged,
//     suffixIcon: suffix,
//     focusNode: focusNode,
//     onFieldSubmitted: onFieldSubmitted,
//     isSecure: isSecure,
//     textCapitalization: textCapitalization,
//     textInputAction: textInputAction ?? TextInputAction.next,
//     textInputType: textInputType,
//   );
// }
