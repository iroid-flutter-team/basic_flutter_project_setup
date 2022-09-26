import 'dart:async';



import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';

import '../../models/response/common_response.dart';

FutureOr<dynamic> responseInterceptor(
    Request request, Response response) async {
  CommonResponse commonResponse = CommonResponse();
  print('Request: URL ${request.method.toUpperCase()}: ${request.url}');
  print('Request: Headers ${request.headers}');
  print('Response: Status ${response.statusCode}');
  print('Response: Status ${response.statusText}');
  print('Response: Body ${response.body.toString()}');
  EasyLoading.dismiss();
  if (response.statusCode == 200 && response.body != null) {
    commonResponse = CommonResponse.fromJson(response.body);

    if (commonResponse.dioMessage != null) {
      await EasyLoading.showToast(commonResponse.dioMessage!);
    }
  } else if (response.hasError) {
    // if (response.status.isUnauthorized) await logout();

    String error = response.body['message'];
    try {
      await EasyLoading.showToast(error);
      error = '$error - ${response.body}';
    } catch (e) {
      print("ERERERE:${e.toString()}");
    }

    throw error;
  }
  return response;
}

getRefreshToken() {
  // Get.find<ApiRepository>().refreshToken(data);
}
