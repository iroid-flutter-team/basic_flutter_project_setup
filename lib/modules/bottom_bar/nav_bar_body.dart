import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../shared/utils/math_utils.dart';
import 'model/nav_bar_item.dart';
import 'nav_bar_button.dart';

typedef OnButtonPressCallback = void Function(int index);

class NavBarBody extends StatelessWidget {
  final List<dynamic> barItems;
  final int selectedIndex;
  final double iconSize;
  final Color? activeColor;
  final Color? inactiveColor;
  final OnButtonPressCallback onButtonPress;
  final Color backgroundColor;
  final FontWeight? fontWeight;
  final double? fontSize;
  final FontStyle? fontStyle;

  const NavBarBody({
    Key? key,
    required this.barItems,
    required this.selectedIndex,
    required this.iconSize,
    required this.activeColor,
    required this.inactiveColor,
    required this.onButtonPress,
    required this.backgroundColor,
    required this.fontWeight,
    required this.fontSize,
    required this.fontStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildContainer1(context);
  }

  _buildContainer1(BuildContext context) {
    final double bottomPadding = Get.bottomBarHeight;

    printInfo(info: 'bottomPadding = $bottomPadding');

    return SafeArea(
      child: Container(
        height: bottomPadding == 0 ? getSize(75) : getSize(64) /*+ bottomPadding*/,
        alignment: Alignment.center,
        child: _buildRow(),
      ),
    );
  }

  _buildRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: barItems.map(
        (dynamic item) {
          final int buttonIndex = barItems.indexOf(item);

          return item is NavBarItem
              ? NavBarButton(
                  normalIcon: item.normalIcon,
                  selectedIcon: item.selectedIcon,
                  size: iconSize,
                  index: buttonIndex,
                  isSelected: buttonIndex == selectedIndex ? true : false,
                  onTap: onButtonPress,
                  slidingCardColor: backgroundColor,
                  itemCount: barItems.length,
                  fontSize: fontSize,
                  fontWeight: fontWeight,
                  fontStyle: fontStyle,
                )
              : Padding(
                  padding: EdgeInsets.zero,
                  child: item,
                );
        },
      ).toList(),
    );
  }

  buildCenterBulbWidget() {
    //   return BottomNavigationBarItem(
    //     icon: Container(
    //       height: getSize(44),
    //       width: getSize(44),
    //       decoration: ShapeDecoration(
    //         gradient: const LinearGradient(
    //           colors: [
    //             Color.fromRGBO(255, 255, 255, 0.1),
    //             Color.fromRGBO(255, 255, 255, 0.01),
    //           ],
    //           begin: Alignment(-1.0, -2.0),
    //           end: Alignment(1.0, 2.0),
    //         ),
    //         shadows: [
    //           BoxShadow(
    //             color: ColorConstants.black,
    //             spreadRadius: 0,
    //             offset: const Offset(5, 6),
    //             blurRadius: 20,
    //           ),
    //         ],
    //         shape: SmoothRectangleBorder(
    //           borderRadius: SmoothBorderRadius.all(SmoothRadius(
    //             cornerRadius: getSize(14),
    //             cornerSmoothing: 1,
    //           )),
    //         ),
    //       ),
    //       child: Container(
    //         alignment: Alignment.center,
    //         margin: EdgeInsets.all(getSize(1.0)),
    //         decoration: ShapeDecoration(
    //           gradient: const LinearGradient(
    //             colors: [
    //               Color.fromRGBO(99, 185, 255, 1),
    //               Color.fromRGBO(16, 89, 146, 1),
    //             ],
    //             begin: Alignment(-1.0, -4.0),
    //             end: Alignment(1.0, 4.0),
    //           ),
    //           shape: SmoothRectangleBorder(
    //             borderRadius: SmoothBorderRadius.all(SmoothRadius(
    //               cornerRadius: getSize(14),
    //               cornerSmoothing: 1,
    //             )),
    //           ),
    //         ),
    //         child: SvgPicture.asset(SvgImageConstants.bulb),
    //       ),
    //     ),
    //     label: '',
    //   );
  }
}
