// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:grape_vendor_app/shared/constants/color_constants.dart';
// import 'package:grape_vendor_app/shared/utils/focus.dart';
// import 'package:grape_vendor_app/shared/utils/image_utils.dart';
// import 'package:grape_vendor_app/shared/utils/math_utils.dart';
// import 'package:grape_vendor_app/shared/widgets/base_text.dart';

// class CommonButton extends StatefulWidget {
//   final double borderRadius;
//   final double? width;
//   final double? height;
//   final Gradient? gradient;
//   final VoidCallback onPressed;
//   final String text;
//   final Widget? customWidget;
//   final List<BoxShadow>? shadows;
//   final Widget? iconWidget;
//   final Color? backgroundColor;
//   final Color? borderColor;
//   final Color? buttonTextColor;
//   final double? buttonFontSize;
//   final FontWeight? buttonFontWeight;
//   final Widget? widget;
//   final String? svgImage;
//   final bool isSubmitting;
//   const CommonButton({
//     super.key,
//     required this.onPressed,
//     this.customWidget,
//     this.borderRadius = 10,
//     this.width,
//     this.height,
//     this.shadows,
//     this.gradient,
//     this.backgroundColor,
//     required this.text,
//     this.iconWidget,
//     this.buttonTextColor,
//     this.buttonFontSize,
//     this.buttonFontWeight,
//     this.borderColor,
//     this.widget,
//     this.isSubmitting = false,
//     this.svgImage,
//   });

//   @override
//   State<CommonButton> createState() => _CommonButtonState();
// }

// class _CommonButtonState extends State<CommonButton> {
//   bool isButtonDisabled = false;
//   Timer? buttonTimer;
//   void _handleButtonTap() {
//     if (!isButtonDisabled) {
//       setState(() {
//         isButtonDisabled = true;
//       });
//       AppFocus.unfocus(context);
//       widget.onPressed();
//       // Enable the button after a specified duration (e.g., 3 seconds).
//       buttonTimer = Timer(const Duration(seconds: 3), () {
//         setState(() {
//           isButtonDisabled = false;
//         });
//       });
//     }
//   }

//   @override
//   void dispose() {
//     buttonTimer?.cancel();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       onPressed:
//           widget.isSubmitting || isButtonDisabled ? null : _handleButtonTap,
//       style: ElevatedButton.styleFrom(
//         side: BorderSide(color: widget.borderColor ?? Colors.transparent),
//         elevation: 0,
//         shadowColor: Colors.transparent,
//         splashFactory: NoSplash.splashFactory,
//         backgroundColor: widget.backgroundColor ?? ColorConstants.kPrimary,
//         disabledBackgroundColor:
//             widget.backgroundColor ?? ColorConstants.kPrimary,
//         padding: EdgeInsets.zero,
//         fixedSize: Size(
//           getSize(widget.width ?? MediaQuery.of(context).size.width),
//           getSize(
//             widget.height ?? 42,
//           ),
//         ),
//         visualDensity: const VisualDensity(
//           vertical: VisualDensity.minimumDensity,
//           horizontal: VisualDensity.minimumDensity,
//         ),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(
//             getSize(widget.borderRadius),
//           ),
//         ),
//       ),
//       child: widget.svgImage != null
//           ? Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 SvgPicture.asset(getAssetsSVGImg(widget.svgImage!)),
//                 SizedBox(
//                   width: getSize(10),
//                 ),
//                 BaseText(
//                   text: widget.text,
//                   textColor: widget.buttonTextColor ?? Colors.white,
//                   fontSize: 16,
//                   fontWeight: FontWeight.w500,
//                 ),
//               ],
//             )
//           : widget.isSubmitting
//               ? SizedBox(
//                   height: getSize(20),
//                   width: getSize(20),
//                   child: CircularProgressIndicator(
//                     color: ColorConstants.white,
//                   ),
//                 )
//               : BaseText(
//                   text: widget.text,
//                   fontSize: widget.buttonFontSize ?? 16,
//                   textAlign: TextAlign.center,
//                   //maxLines: 1,
//                   fontWeight: widget.buttonFontWeight ?? FontWeight.w500,
//                   textColor: widget.buttonTextColor ?? Colors.white,
//                 ),
//     );
//   }
// }

// // class CommonButton extends StatelessWidget {
// //   final double borderRadius;
// //   final double? width;
// //   final double? height;
// //   final Gradient? gradient;
// //   final VoidCallback? onPressed;
// //   /* final Widget child;*/
// //   final List<BoxShadow>? shadows;
// //   final Color? textColor;
// //   final String text;
// //   final Color? backgroundColor; //Color(0xff8BC75A)
// //   final String? svgImage;

// //   const CommonButton({
// //     super.key,
// //     required this.onPressed,
// //     this.textColor,
// //     this.svgImage,
// //     /* required this.child,*/
// //     this.borderRadius = 10,
// //     this.width,
// //     this.height = 50.0,
// //     this.shadows,
// //     this.gradient,
// //     required this.text,
// //     this.backgroundColor,
// //   });

// //   @override
// //   Widget build(BuildContext context) {
// //     // final borderRadius = this.borderRadius ?? BorderRadius.circular(14);
// //     return GestureDetector(
// //       onTap: onPressed ?? () {},
// //       child: Container(
// //         height: height,
// //         padding: EdgeInsets.symmetric(
// //           vertical: getSize(12),
// //         ),
// //         alignment: Alignment.center,
// //         decoration: ShapeDecoration(
// //           color: backgroundColor ?? ColorConstants.kPrimary,
// //           shape: SmoothRectangleBorder(
// //             borderRadius: SmoothBorderRadius.all(
// //               SmoothRadius(
// //                 cornerRadius: getSize(borderRadius),
// //                 cornerSmoothing: 1,
// //               ),
// //             ),
// //           ),
// //           /*        shadows: shadows ??
// //               [
// //                 BoxShadow(
// //                   offset: Offset(0, 10),
// //                   blurRadius: 30,
// //                   color: ColorConstants.buttonShadowColor.withOpacity(0.20),
// //                 ),
// //               ],*/
// //         ),
// //         child: Row(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           crossAxisAlignment: CrossAxisAlignment.center,
// //           children: [
// //             svgImage != null
// //                 ? Row(
// //                     children: [
// //                       SvgPicture.asset(getAssetsSVGImg(svgImage!)),
// //                       SizedBox(
// //                         width: getSize(10),
// //                       )
// //                     ],
// //                   )
// //                 : const SizedBox(),
// //             BaseText(
// //               text: text,
// //               textColor: textColor ?? Colors.white,
// //               fontSize: 16,
// //               fontWeight: FontWeight.w500,
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
