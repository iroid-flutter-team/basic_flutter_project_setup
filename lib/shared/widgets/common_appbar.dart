import 'package:align_flutter_app/shared/utils/math_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../constants/color_constants.dart';
import '../utils/image_utils.dart';
import 'base_text.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color backgroundColor = ColorConstants.darkScaffoldBackgroundColor;
  final Widget? leading;
  final String title;
  final List<Widget>? actions;
  final Function()? onPress;
  final double? leadingWidth;

  /// you can add more fields that meet your needs

  BaseAppBar({
    Key? key,
    required this.title,
    this.leading,
    this.actions,
    this.leadingWidth,
    this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: leadingWidth?? getSize(60),
      leading: leading ?? _buildLeadingView(),
      title: BaseText(
        text: title,
        fontSize: 22,
        fontWeight: FontWeight.w500,
      ),
      backgroundColor: backgroundColor,
      elevation: 0,
      actions: actions,
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(60);

  _buildLeadingView() {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: IconButton(
        icon: SvgPicture.asset(
          getAssetsSVGImg('arrow_left'),
        ),
        onPressed: onPress ?? () => Get.back(),
      ),
    );
  }
}

// class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
//   //final Color backgroundColor = ColorConstants.white;
//   final Color backgroundColor = Colors.transparent;
//   final Widget? leading;
//   final String title;
//   final List<Widget>? actions;
//
//   /// you can add more fields that meet your needs
//
//   const BaseAppBar({
//     Key? key,
//     required this.title,
//     this.leading,
//     this.actions,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       //  leading: leading ?? _buildLeadingView(),
//       automaticallyImplyLeading: false,
//       leadingWidth: getSize(100),
//       title: BaseText(
//         text: title,
//         fontSize: 22,
//         fontWeight: FontWeight.w500,
//       ),
//       backgroundColor: backgroundColor,
//       elevation: 0,
//       actions: actions,
//       centerTitle: true,
//     );
//   }
//
//   @override
//   Size get preferredSize => Size.fromHeight(60);
//
//   // _buildLeadingView() {
//   //   return IconButton(
//   //     onPressed: () {
//   //       Get.back();
//   //     },
//   //     icon: Container(
//   //       height: getSize(45),
//   //       width: getSize(45),
//   //       alignment: Alignment.center,
//   //       decoration: ShapeDecoration(
//   //         color: ColorConstants.grey,
//   //         shape: SmoothRectangleBorder(
//   //           borderRadius: SmoothBorderRadius.all(
//   //             SmoothRadius(
//   //               cornerRadius: getSize(12),
//   //               cornerSmoothing: 1,
//   //             ),
//   //           ),
//   //         ),
//   //       ),
//   //       child: Icon(
//   //         Icons.arrow_back_ios_new,
//   //         size: getSize(22),
//   //         color: ColorConstants.black,
//   //       ),
//   //     ),
//   //   );
//   // }
// }
