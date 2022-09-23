import 'dart:convert';

import 'package:get/get.dart';
import 'package:home_yogi_flutter/modules/main/tabs/home/home_view.dart';
import 'package:home_yogi_flutter/shared/constants/storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'models/response/auth/user_detail_response.dart';
import 'shared/services/services.dart';

class DependencyInjection {
  static Future<void> init() async {
    await Get.putAsync(() => StorageService().init());
    getUserData();
  }

  static var userResponse = UserDetailResponse().obs;
  static getUserData() {
    final prefs = Get.find<SharedPreferences>();

    if (prefs.getString(StorageConstants.userData) != null) {
      userResponse.value = UserDetailResponse.fromJson(
        jsonDecode(prefs.getString(StorageConstants.userData)!),
      );

      print("UserData : ${userResponse.toJson()}");
    }
  }
}
