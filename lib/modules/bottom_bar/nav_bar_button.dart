
import 'package:flutter/material.dart';
import '../../shared/constants/color_constants.dart';
import '../../shared/utils/math_utils.dart';
import '../../shared/widgets/base_text.dart';
import 'nav_bar_body.dart';

class NavBarButton extends StatefulWidget {
  final String title;
  final Widget normalIcon;
  final Widget selectedIcon;
  final bool isSelected;
  final double size;
  final int index;
  final Color slidingCardColor;
  final int itemCount;
  final FontWeight? fontWeight;
  final double? fontSize;
  final FontStyle? fontStyle;
  final OnButtonPressCallback onTap;

  const NavBarButton({
    Key? key,
    required this.title,
    required this.normalIcon,
    required this.selectedIcon,
    required this.size,
    required this.isSelected,
    required this.onTap,
    required this.index,
    required this.slidingCardColor,
    required this.itemCount,
    required this.fontWeight,
    required this.fontSize,
    required this.fontStyle,
  }) : super(key: key);

  @override
  _NavBarButtonState createState() => _NavBarButtonState();
}

class _NavBarButtonState extends State<NavBarButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    if (widget.isSelected) {
      _animationController.forward(from: 0.3);
    }
  }

  @override
  void didUpdateWidget(NavBarButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.isSelected != widget.isSelected && widget.isSelected) {
      _animationController.forward();
    }
    if (oldWidget.isSelected != widget.isSelected && !widget.isSelected) {
      _animationController.reverse();
    }
  }

  TextStyle getTextStyle() => TextStyle(
        fontSize: widget.fontSize ?? 16,
        fontWeight: widget.fontWeight ?? FontWeight.bold,
        fontStyle: widget.fontStyle,
      );

  // copied from here
  //https://stackoverflow.com/a/62536187/16122873
  double textHeight(String text, TextStyle textStyle) => (TextPainter(
          text: TextSpan(text: text, style: textStyle),
          maxLines: 1,
          textScaleFactor: MediaQuery.of(context).textScaleFactor,
          textDirection: Directionality.of(context))
        ..layout())
      .size
      .height;

  @override
  Widget build(BuildContext context) {
    final int index = widget.index;
    final Function(int) onTap = widget.onTap;

    return GestureDetector(
      onTap: () {
        onTap(index);
        if (_animationController.status == AnimationStatus.dismissed) {
          _animationController.forward();
        }
      },
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (_, __) => Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              color: Colors.transparent,
              padding: EdgeInsets.all(
                getSize(10),
              ),
              child:
                  widget.isSelected ? widget.selectedIcon : widget.normalIcon,
            ),
            Positioned(
              bottom: getSize(20),
              child: Transform.translate(
                offset: const Offset(
                  0,
                  25,
                ),
                child: ScaleTransition(
                  scale: Tween<double>(begin: 0.0, end: 1.0).animate(
                    CurvedAnimation(
                      parent: _animationController,
                      curve: const Interval(
                        0.3,
                        1.0,
                      ),
                    ),
                  ),
                  child: BaseText(
                    text: widget.index == 0 ? "Home" :widget.index == 1 ? "History" : widget.index == 3 ? "Notification" : widget.index == 4 ? "Setting" : "",
                    fontSize: widget.index == 3 ? 12 : 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
