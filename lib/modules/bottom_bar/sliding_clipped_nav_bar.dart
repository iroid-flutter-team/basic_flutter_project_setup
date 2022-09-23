library sliding_clipped_nav_bar;

import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import '../../shared/constants/colors.dart';
import '../../shared/utils/math_utils.dart';
import '../../shared/widgets/common_boxshadow.dart';
import 'nav_bar_body.dart';

class SlidingClippedNavBar extends StatelessWidget {
  /// List of bar items shown horizontally, Minimum 2 and maximum 4 items.
  final List<dynamic> barItems;

  /// Selected index of the bar items.
  final int selectedIndex;

  /// Size of all icons (inactive items), don't make it too big or will be clipped.
  final double iconSize;

  /// FontSize of the text.
  final double? fontSize;

  /// FontWeight of the text.
  final FontWeight? fontWeight;

  /// FontStyle of the text.
  final FontStyle? fontStyle;

  /// Color of the selected item which indicate selected.
  final Color? _activeColor;

  /// Inactive color of item, which actually color icons.
  final Color? _inactiveColor;

  /// Callback when item is pressed.
  final OnButtonPressCallback onButtonPressed;

  /// background color of the bar.
  final Color backgroundColor;

  /// User when you want to set global active and inactive color.
  SlidingClippedNavBar({
    Key? key,
    required this.barItems,
    required this.selectedIndex,
    required this.onButtonPressed,
    required Color activeColor,
    Color? inactiveColor,
    this.fontSize,
    this.fontWeight,
    this.fontStyle,
    this.iconSize = 30,
    this.backgroundColor = Colors.white,
  })  : _activeColor = activeColor,
        _inactiveColor = inactiveColor ?? activeColor.withOpacity(0.3),
        //assert(barItems.length > 1, 'You must provide minimum 2 Menu items'),
        //assert(barItems.length < 6, 'Maximum menu item count is 4'),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        gradient: const LinearGradient(
          colors: [
            Color.fromRGBO(255, 255, 255, 0.30),
            Color.fromRGBO(255, 255, 255, 0.1),
            Color.fromRGBO(255, 255, 255, 0.1)
          ],
          begin: Alignment(-1.0, -2.0),
          end: Alignment(1.0, 2.0),
        ),
        shadows: [
          CommonBoxShadow.getBlackBackgroundBoxShadow(Offset(5, -6)),
        ],
        shape: SmoothRectangleBorder(
          borderRadius: SmoothBorderRadius.only(
            topLeft: SmoothRadius(
              cornerRadius: getSize(22),
              cornerSmoothing: 1,
            ),
            topRight: SmoothRadius(
              cornerRadius: getSize(22),
              cornerSmoothing: 1,
            ),
          ),
        ),
      ),
      child: Container(
        margin: EdgeInsets.only(
          top: getSize(1.8),
        ),
        decoration: ShapeDecoration(
          gradient: LinearGradient(
            colors: [
              ColorConstants.toListBlack,
              ColorConstants.darkScaffoldBackgroundColor
            ],
            begin: const Alignment(-1.0, -4.0),
            end: const Alignment(1.0, 4.0),
          ),
          shape: SmoothRectangleBorder(
            borderRadius: SmoothBorderRadius.only(
              topLeft: SmoothRadius(
                cornerRadius: getSize(22),
                cornerSmoothing: 1,
              ),
              topRight: SmoothRadius(
                cornerRadius: getSize(22),
                cornerSmoothing: 1,
              ),
            ),
          ),
        ),
        child: NavBarBody(
          barItems: barItems,
          iconSize: iconSize,
          activeColor: _activeColor,
          inactiveColor: _inactiveColor,
          backgroundColor: backgroundColor,
          onButtonPress: onButtonPressed,
          selectedIndex: selectedIndex,
          fontSize: fontSize,
          fontWeight: fontWeight,
          fontStyle: fontStyle,
        ),
      ),
    );
  }
}
