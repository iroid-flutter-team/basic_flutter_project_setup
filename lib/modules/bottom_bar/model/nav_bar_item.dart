import 'package:flutter/material.dart';

class NavBarItem {
  final Widget normalIcon;
  final Widget selectedIcon;
  final Color? activeColor;
  final Color? inactiveColor;
  final String title;

  NavBarItem({
    required this.title,
    required this.normalIcon,
    required this.selectedIcon,
    this.activeColor,
    this.inactiveColor,
  });
}
