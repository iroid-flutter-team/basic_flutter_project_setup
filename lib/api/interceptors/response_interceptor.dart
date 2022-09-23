import 'dart:async';

import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:home_yogi_flutter/models/models.dart';
import 'package:home_yogi_flutter/shared/utils/utils.dart';

import '../../models/response/common_response.dart';

FutureOr<dynamic> responseInterceptor(
    Request request, Response response) async {
  CommonResponse commonResponse = CommonResponse();
  EasyLoading.dismiss();
  // print("Response:$response");
  if (response.statusCode == 200 && response.body != null) {
    commonResponse = CommonResponse.fromJson(response.body);
    if (commonResponse.dioMessage != null) {
      await EasyLoading.showToast(commonResponse.dioMessage!);
    }
  } else if (response.hasError) {
    // if (response.status.isUnauthorized) await logout();
    String error = response.body['message'];
    try {
      EasyLoading.showToast(error);
      error = '$error - ${response.body}';
    } catch (e) {
      print("ERERERE:${e.toString()}");
    }
    throw error;
  }
  return response;
}

// void handleErrorStatus(Response response) {
//   print(response.body);
//   switch (response.statusCode) {
//     case 400:
//       final message = ErrorResponse.fromJson(response.body);
//       CommonWidget.toast(message.error);
//       break;
//     default:
//   }
//
//   return;
// }
