import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../helper/injector.dart';
import '../models/models.dart';
import '../models/response/common_response.dart';
import '../shared/constants/pref_keys.dart';
import '../shared/constants/storage.dart';
import 'base_provider.dart';

class ApiProvider extends BaseProvider {
  CommonResponse commonResponse = CommonResponse();
  final prefs = Get.find<SharedPreferences>();
  Future<CommonResponse> postMethod(
      String path, Map<String, dynamic> data,{bool isMultipart = false,
        FormData? formData}) async {
    printInfo(info: "API Request ======= $data");
    Response response = await post(
      path,
      isMultipart ? formData : data,
      headers: {
        'accept': 'application/json',
        //'Content-Type: multipart/form-data'
        'Authorization': 'Bearer ${prefs.getString(StorageConstants.token)}',
      },
    ).catchError((e) {
      print("e:$e");
    });
    printInfo(info: "RESPONSE ======= ${response.body}");
    if (response.statusCode == 200 && response.body != null) {
      commonResponse = CommonResponse.fromJson(response.body);
      if (commonResponse.dioMessage != null) {
        await EasyLoading.showToast(commonResponse.dioMessage!);
      }
    } else {
      await EasyLoading.showToast(commonResponse.dioMessage ?? "Null");
    }
    print("CommonResponse${commonResponse.dioMessage}");
    return commonResponse;
    // if (response.statusCode == 200 && response.body != null) {
    //   commonResponse = CommonResponse.fromJson(response.body);
    //   if (commonResponse.dioMessage != null) {
    //     await EasyLoading.showToast(commonResponse.dioMessage!);
    //   }
    // } else {
    //   await EasyLoading.showToast(commonResponse.dioMessage ?? "Null");
    // }
    // Future<CommonResponse> postMethod(
    //     String path, Map<String, dynamic> data) async {
    //   await post(
    //     path,
    //     data,
    //     headers: {
    //       'accept': 'application/json',
    //       'Content-Type': 'application/json'
    //     },
    //   ).catchError((e) {
    //     printError(info: "e: $e");
    //   }).then((value) {
    //     printInfo(info: "RESPONSE ======= ${value.body}");
    //
    //     if (value.body != null) {
    //       commonResponse = CommonResponse.fromJson(value.body);
    //     }
    //     return commonResponse;
    //   });
    //
    //   return commonResponse;
    // }
  }

  Future<CommonResponse> getMethod(String path,  {bool isQueryParameter = false, Map<String, dynamic>? queryParameterMap}) async {
    print(path);
    print("queryParameterMap..............=============$queryParameterMap");
    var response = await get(
      path,
      headers: {
        'accept': 'application/json',
        'Authorization': 'Bearer ${prefs.getString(StorageConstants.token)}',
      },
      query: queryParameterMap ,
    ).catchError((e) {
      print("==ERROR===${e.toString()}");
    });
    printInfo(info: "RESPONSE ======= ${response.body}");
    if (response.statusCode == 200 && response.body != null) {
      commonResponse = CommonResponse.fromJson(response.body);
      print("response.body=============${response.body}");
     // print("commonResponse.data=============${commonResponse.data}");
     // print("commonResponse.meta=============${commonResponse.meta}");
      if (commonResponse.dioMessage != null) {
        await EasyLoading.showToast(commonResponse.dioMessage!);
      }
      // if (commonResponse.data != null) {
      //   await EasyLoading.showToast(commonResponse.data);
      // }
    } else {
      await EasyLoading.showToast("ERROR IN API CALL");
      // Utils.showErrToast("ERROR IN API CALL");
    }
    return commonResponse;
  }

  Future<CommonResponse> putMethod(String path, Map<String, dynamic> data,
      {bool isMultipart = false, FormData? formData}) async {
    printInfo(info: "========>12121:${prefs.getString(StorageConstants.token)}");
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

  Future<CommonResponse> deleteMethod(String path) async {
    Response response = await delete(
      path,
      headers: {
        'accept': 'application/json',
        //'Content-Type': 'application/json',
        'Authorization': 'Bearer ${prefs.getString(StorageConstants.token)}',
      },
    );
    print("response===========${response.body}");
    if (response.statusCode == 200 && response.body != null) {
      commonResponse = CommonResponse.fromJson(response.body);
    }
    if (commonResponse.dioMessage != null) {
      await EasyLoading.showToast(commonResponse.dioMessage!);
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

// class ApiProvider extends BaseProvider {
//   Future<Response> login(String path, LoginRequest data) {
//     return post(path, data.toJson());
//   }
//
//   Future<Response> register(String path, RegisterRequest data) {
//     return post(path, data.toJson());
//   }
//
//   Future<Response> getUsers(String path) {
//     return get(path);
//   }
//
//   Future<Response> test(String path) {
//     return get(path);
//   }
// }
