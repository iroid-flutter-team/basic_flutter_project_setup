import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/response/common_response.dart';
import '../network/network_manger.dart';
import '../shared/constants/constants.dart';
import 'base_provider.dart';

class ApiProvider extends BaseProvider {
  final prefs = Get.find<SharedPreferences>();
  CommonResponse commonResponse = CommonResponse();
  final NetworkManager networkManager = Get.put(NetworkManager());

  Future<CommonResponse> postMethod(String path, dynamic data,
      {bool isMultipart = false, FormData? formData}) async {
    printInfo(info: "API Request ======= $data");

    {
      Response response = await post(
        path,
        isMultipart ? formData : data,
        headers: {
          'accept': 'application/json',
          'Authorization': 'Bearer ${prefs.getString(StorageConstants.token)}',
          //'Content-Type': 'application/json'
        },
      ).catchError((error) {
        print(error);
      });
      printInfo(info: "POST RESPONSE ======= ${response.body}");

      if (response.body != null && response.statusCode == 200) {
        printInfo(info: "POST RESPONSE ======= 1111");
        commonResponse = CommonResponse.fromJson(response.body);
        if (commonResponse.dioMessage != null) {
          printInfo(info: "POST RESPONSE ======= 2222");
          await EasyLoading.showToast(commonResponse.dioMessage!);
        }
      } else {
        printInfo(info: "POST RESPONSE ======= 3333");
        EasyLoading.dismiss();
        await EasyLoading.showToast(commonResponse.dioMessage ?? "Null");
      }
      //  print("CommonResponse12==========${commonResponse.dioMessage}");
    }
    // print("CommonResponse==========${commonResponse.dioMessage}");
    // else {
    //   EasyLoading.dismiss();
    //   await EasyLoading.showToast(StringConstants.networkError);
    // }

    return commonResponse;
  }

  Future<CommonResponse> getMethod(String path) async {
    print(path);
    var response = await get(
      path,
      headers: {
        'accept': 'application/json',
        'Authorization': 'Bearer ${prefs.getString(StorageConstants.token)}',
        // 'Content-Type': 'application/json'
      },
    ).catchError((e) {
      print("==ERROR===${e.toString()}");
    });
    printInfo(info: "GET RESPONSE ======= ${response.body}");
    if (response.statusCode == 200 && response.body != null) {
      commonResponse = CommonResponse.fromJson(response.body);
      if (commonResponse.dioMessage != null) {
        await EasyLoading.showToast(commonResponse.dioMessage!);
      }
    } else {
      await EasyLoading.showToast(commonResponse.dioMessage ?? "Null");
    }
    return commonResponse;
  }

  Future<CommonResponse> putMethod(String path, Map<String, dynamic> data,
      {bool isMultipart = false, FormData? formData}) async {
    print("putDat=============${formData?.files}");
    print("putDat=============${formData?.fields}");
    printInfo(
        info: "========>12121:${prefs.getString(StorageConstants.token)}");
    Response response = await put(
      path,
      isMultipart ? formData : data,
      headers: {
        'accept': 'application/json',
        // 'Content-Type': 'application/json',
        'Authorization': 'Bearer ${prefs.getString(StorageConstants.token)}',
      },
    ).catchError((error) {
      print(error);
    });
    print("putMethodResponse===========${response.body}");
    if (response.statusCode == 200 && response.body != null) {
      commonResponse = CommonResponse.fromJson(response.body);
    }
    return commonResponse;
  }
  // Future<CommonResponse> putMethod(
  //     String path, Map<String, dynamic> data,{bool isMultipart = false, FormData? formData}) async {
  //   Response response = await put(path, data);
  //   commonResponse = CommonResponse.fromJson(response.body);
  //   if (commonResponse.dioMessage != null) {
  //     await EasyLoading.showToast(commonResponse.dioMessage!);
  //   } else {
  //     await EasyLoading.showToast(commonResponse.dioMessage ?? "Null");
  //   }
  //   return commonResponse;
  // }

  Future<CommonResponse> deleteMethod(
      String path, Map<String, dynamic> data) async {
    printInfo(info: "API Request ======= $data");

    if (networkManager.connectionType.value != 0) {
      Response response = await delete(
        path,
        headers: {
          'accept': 'application/json',
        },
      ).catchError((error) {
        print(error);
      });
      printInfo(info: "RESPONSE ======= ${response.body}");

      if (response.body != null && response.statusCode == 200) {
        commonResponse = CommonResponse.fromJson(response.body);

        if (commonResponse.dioMessage != null) {
          await EasyLoading.showToast(commonResponse.dioMessage!);
        }
      } else {
        EasyLoading.dismiss();
        await EasyLoading.showToast(StringConstants.serverError);
      }
    } else {
      EasyLoading.dismiss();
      await EasyLoading.showToast(StringConstants.networkError);
    }

    return commonResponse;
  }

  // Future<Response> register(String path, RegisterRequest data) {
  //   return post(path, data.toJson());
  // }

  // Future<Response> getUsers(String path) {
  //   return get(path);
  // }
}
// Future<Response> login(String path, LoginRequest data) {
//   return post(path, data.toJson());
// }

// Future<Response> register(String path, RegisterRequest data) {
//   return post(path, data.toJson());
// }

// Future<Response> getUsers(String path) {
//   return get(path);
// }

// Future<Response> test(String path) {
//   return get(path);
// }
