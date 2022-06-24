import 'dart:async';

import 'package:align_flutter_app/shared/constants/storage.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

FutureOr<Request> authInterceptor(Request request) async {
  try {
    final prefs = Get.find<SharedPreferences>();
    final token = prefs.getString(StorageConstants.token);
    print('pref token===> $token');

    if (token != null && token.isNotEmpty) {
      request.headers['Authorization'] = 'Bearer $token';
      request.headers['accept'] = 'application/json';
    }
  } catch (e) {
    print('error==> $e');
  }
  // final token = StorageService.box.pull(StorageItems.accessToken);

  // request.headers['X-Requested-With'] = 'XMLHttpRequest';
  // request.headers['Authorization'] = 'Bearer $token';

  return request;
}
