import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart' as getx;
import 'package:grape_vender_app/api/interceptors/dio_connectivity_request_retrier.dart';
import 'package:grape_vender_app/di.dart';
import 'package:grape_vender_app/routes/app_pages.dart';
import 'package:grape_vender_app/shared/constants/storage.dart';
import 'package:grape_vender_app/shared/constants/string_constant.dart';
import 'package:grape_vender_app/shared/utils/flushbar_creator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../models/response/common_response.dart';

class RetryOnConnectionChangeInterceptor extends Interceptor {
  final DioConnectivityRequestRetrier requestRetrier;
  RetryOnConnectionChangeInterceptor({required this.requestRetrier});
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final prefs = getx.Get.find<SharedPreferences>();
    final token = prefs.getString(StorageConstants.token);
    print('pref token===> $token');
    // print('request.url===> ${request.url}');
    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    if (DependencyInjection.showLoader.value) {
      EasyLoading.show(status: 'loading...');
    }
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print(
      'Request: URL ${response.requestOptions.method.toUpperCase()}: ${response.requestOptions.uri}',
    );
    print('Request: Headers ${response.headers}');
    print('Response: Status ${response.statusCode}');
    print('Response: Status ${response.statusMessage}');
    print('Response: Body ${response.data.toString()}');
    EasyLoading.dismiss();

    // if (response.statusCode == 200) {
    //   return;
    // }
    // if (response.statusCode == 200 && response.data != null) {
    //   EasyLoading.dismiss();
    //   var commonResponse = CommonResponse.fromJson(response.data);
    //   if (commonResponse.dioMessage != null &&
    //       commonResponse.dioMessage != 'Card not found') {
    //     CommonWidget.successToast(commonResponse.dioMessage!);
    //   }
    // }
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    EasyLoading.dismiss();
    if (_shouldRetry(err)) {
      await showError(
        message: StringConstants.networkError,
      ).show(getx.Get.context!);
      // CommonWidget.toast(StringConstant.networkError);
      try {
        requestRetrier.scheduleRequestRetry(err.requestOptions);
      } catch (e) {
        print("==ERROR${err.response}");
      }
    } else if (err.response?.statusCode == 401 &&
        err.response?.data['message'] == 'Unauthorized') {
      await DependencyInjection.prefs.clear();
      getx.Get.offAllNamed(Routes.LOGIN);

      // DependencyInjection.logout({});
      //  if (DependencyInjection.prefs.getString(StorageConstants.token) != null) {
      //     //DependencyInjection.logout();
      //   }
    } else if (err.response?.statusCode != 200) {
      EasyLoading.dismiss();
      var commonResponse = CommonResponse.fromJson(err.response?.data);
      if (commonResponse.dioMessage != null &&
          commonResponse.dioMessage != 'Fetched successfully' &&
          commonResponse.dioMessage != 'Fcm token added successfully.') {
        EasyLoading.showToast(commonResponse.dioMessage ?? '');
        //CommonWidget.successToast(commonResponse.dioMessage!);
      }
    }

    super.onError(err, handler);
  }
  // @override
  // Future onError(DioError err) async {
  //   if (_shouldRetry(err)) {
  //     try {
  //       return requestRetrier.scheduleRequestRetry(err.request);
  //     } catch (e) {
  //       return e;
  //     }
  //   }
  //   return err;
  // }

  bool _shouldRetry(DioException err) {
    printInfo(info: ' ${err.error}');
    return err.error is SocketException;
  }
}
