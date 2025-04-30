import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'shared/services/storage_service.dart';

class DependencyInjection {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();
  static final prefs = Get.find<SharedPreferences>();
  static var showLoader = true.obs;
  static var deviceId = '';

  static Future<void> init() async {
    await Get.putAsync(() => StorageService().init());
    // await getUserData();
    // getDeviceId();
  }

  static getUserData() {}

  static getUserApi() async {}

  static logOut() async {}

  static getDeviceId() async {
    final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidDeviceInfo = await deviceInfoPlugin.androidInfo;
      deviceId = androidDeviceInfo.id;
    } else if (Platform.isIOS) {
      IosDeviceInfo iosDeviceInfo = await deviceInfoPlugin.iosInfo;
      deviceId = iosDeviceInfo.identifierForVendor ?? '';
    }
  }
}
