import 'dart:async';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../di.dart';
import '../../shared/constants/storage.dart';

FutureOr<Request> requestInterceptor(request) async {
  // final token = StorageService.box.pull(StorageItems.accessToken);

  // request.headers['X-Requested-With'] = 'XMLHttpRequest';
  // request.headers['Authorization'] = 'Bearer $token';

  final prefs = Get.find<SharedPreferences>();
  final token = prefs.getString(StorageConstants.token);
  print('pref token===> $token');

  if (token != null && token.isNotEmpty) {
    request.headers['Authorization'] = 'Bearer $token';
  }
  if (DenpendencyInjection.showLoader.value) {
    EasyLoading.show(status: 'loading...');
  }

  return request;
}
