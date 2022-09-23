import 'package:flutter/material.dart';

import '../constants/colors.dart';

class CommonBoxShadow {
  static getBlackBackgroundBoxShadow(Offset offset) {
    return BoxShadow(
      color: Colors.black.withOpacity(0.6),
      offset: offset,
      blurRadius: 20,
    );
  }

  static getContainerImageBoxShadow() {
    return BoxShadow(
      color: Color.fromRGBO(0, 0, 0, 0.12),
      offset: Offset(0, 4),
      blurRadius: 24,
    );
  }

  static getWhiteBackgroundBoxShadow(Offset offset) {
    return BoxShadow(
      color: ColorConstants.white.withOpacity(0.03).withOpacity(0.05),
      offset: offset,
      blurRadius: 10,
    );
  }

  static getExaminationBackgroundBoxShadow() {
    return BoxShadow(
      color: ColorConstants.black.withOpacity(0.12),
      offset: Offset(0, 4),
      blurRadius: 24,
    );
  }

  static getImageBoxShadow() {
    return BoxShadow(
      color: ColorConstants.white.withOpacity(0.25),
      offset: Offset(0, 4),
      blurRadius: 4,
    );
  }

  static getUpgradeBoxShadow() {
    return BoxShadow(
      color: Color(0xffFFD000).withOpacity(0.5),
      offset: Offset(0, 0),
      blurRadius: 10,
    );
  }

  static getLevelBadgeBoxShadow() {
    return BoxShadow(
      color: Color.fromRGBO(255, 122, 122, 1),
      offset: Offset(0, 0),
      blurRadius: 24,
    );
  }

  static getCurrentLocationShadow() {
    return BoxShadow(
      color: Color.fromRGBO(96, 100, 112, 0.2),
      offset: Offset(0, 6.15),
      blurRadius: 25,
    );
  }

  static getLevelShadow() {
    return BoxShadow(
      color: Color.fromRGBO(0, 0, 0, 0.25),
      offset: Offset(0, 4),
      blurRadius: 4,
    );
  }
}
