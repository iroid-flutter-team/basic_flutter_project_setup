import 'dart:math';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../helper/injector.dart';
import '../../models/response/common_response.dart';
import '../constants/gradiant_color.dart';

Size size = WidgetsBinding.instance.window.physicalSize /
    WidgetsBinding.instance.window.devicePixelRatio;

///This method is used to set padding/margin (for the left and Right side) & width of the screen or widget according to the Viewport width.
double getHorizontalSize(double px) {
  return px * (size.width / 375);
}

///This method is used to set padding/margin (for the top and bottom side) & height of the screen or widget according to the Viewport height.
double getVerticalSize(double px) {
  num statusBar =
      MediaQueryData.fromWindow(WidgetsBinding.instance.window).viewPadding.top;
  num screenHeight = size.height - statusBar;
  return px * (screenHeight / 812);
}

///This method is used to set text font size according to Viewport
double getFontSize(double px) {
  var height = getVerticalSize(px);
  var width = getHorizontalSize(px);
  if (height < width) {
    return height.toInt().toDouble();
  } else {
    return width.toInt().toDouble();
  }
}

///This method is used to set smallest px in image height and width
double getSize(double px) {
  var height = getVerticalSize(px);
  var width = getHorizontalSize(px);
  if (height < width) {
    return height.toInt().toDouble();
  } else {
    return width.toInt().toDouble();
  }
}

getAssetsPNGImg(String name) {
  return "assets/images/png/" + name + ".png";
}

getAssetsSVGImg(String name) {
  return "assets/images/svg/" + name + ".svg";
}

getAssetsGif(String name) {
  return "assets/images/gif/" + name + ".gif";
}

int getRandomIndex() {
  Random random = Random();
  int randomIndex = random.nextInt(GradientColor().colorsList.length);
  return randomIndex;
}



class MathUtils{

  static hideKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  static showToast(String? message) {
    if (message != null && message != "") {
      Fluttertoast.showToast(
          msg: message, toastLength: Toast.LENGTH_SHORT, timeInSecForIosWeb: 3, gravity: ToastGravity.BOTTOM, backgroundColor: Colors.black, textColor: Colors.white);
    }
  }

  static showInfoToast(String? message) {
    if (message != null && message != "") {
      Fluttertoast.showToast(msg: message, toastLength: Toast.LENGTH_SHORT, timeInSecForIosWeb: 3, gravity: ToastGravity.BOTTOM, backgroundColor: Colors.blue, textColor: Colors.white);
    }
  }

  static showErrToast(String? message) {
    if (message != null && message != "") {
      Fluttertoast.showToast(msg: message, toastLength: Toast.LENGTH_SHORT, timeInSecForIosWeb: 3, gravity: ToastGravity.BOTTOM, backgroundColor: Colors.redAccent, textColor: Colors.white);
    }
  }

  static showSuccessToast(String? message) {
    if (message != null && message != "") {
      Fluttertoast.showToast(msg: message, toastLength: Toast.LENGTH_SHORT, timeInSecForIosWeb: 3, gravity: ToastGravity.BOTTOM, backgroundColor: Colors.green, textColor: Colors.white);
    }
  }

  static showNormalToast(String? message) {
    if (message != null && message != "") {
      Fluttertoast.showToast(msg: message, toastLength: Toast.LENGTH_SHORT, timeInSecForIosWeb: 3, gravity: ToastGravity.BOTTOM, backgroundColor: Colors.green, textColor: Colors.white);
    }
  }

  static bool validatePassword(String value) {
    String pattern = r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,30}$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value);
  }

  static bool validateName(String value) {
    //Alphanumeric characters
    String pattern = r'^[A-Za-z][A-Za-z0-9]*$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value);
  }

  static String? validateEmail(String value) {
    //Alphanumeric characters
    String pattern = r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value) ? null : "Enter valid email.";
    // return regExp.hasMatch(value);
  }

  static String? validateMobileNumber(String value) {
    // String pattern = r'^[0-9]{10}$';
    // RegExp regExp = new RegExp(pattern);
    // return regExp.hasMatch(value) ? null : "Enter valid mobile number.";

    if (value.length != 10) {
      return 'Mobile Number must be of 10 digit';
    } else {
      return null;
    }
  }

  static showCircularProgressLottie(bool isLoading) {
    AlertDialog dialog = AlertDialog(
      backgroundColor: Colors.transparent,
      contentPadding: EdgeInsets.zero,
      elevation: 0.0,
      content: Container(
          height: 60.0,
          color: Colors.transparent,
          child: Center(
            child: Image.asset('assets/lottie/loader.json'),
          )),
    );
    if (!isLoading) {
      Get.back();
    } else {
      Get.dialog(dialog, barrierDismissible: true);
    }
  }

  // static performLogout() async {
  //   // String deviceId;
  //   // deviceId = await Injector.getDeviceId();
  //   // if (kDebugMode) {
  //   //   print("DEVICE ID ==== $deviceId");
  //   // }
  //   // CommonResponse? commonResponse = await DataSource.instance.logout({"device_id": deviceId});
  //   Injector.storage.erase();
  //   //Get.offAll(LoginView());
  // }
}
