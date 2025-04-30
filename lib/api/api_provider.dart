// ignore_for_file: argument_type_not_assignable_to_error_handler, invalid_return_type_for_catch_error

import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart' as getx;
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:grape_vender_app/api/api_constants.dart';
import 'package:grape_vender_app/api/interceptors/dio_connectivity_request_retrier.dart';
import 'package:grape_vender_app/api/interceptors/log_interceptor.dart';
import 'package:grape_vender_app/api/interceptors/retry_interceptor.dart';
import 'package:grape_vender_app/models/response/common_response.dart';
import 'package:grape_vender_app/shared/utils/flushbar_creator.dart';
import '../shared/constants/constants.dart';

class ApiProvider {
  CommonResponse commonResponse = CommonResponse();
  var dio = Dio();
  //final NetworkManager networkManager = Get.put(NetworkManager());
  Future<CommonResponse> postMethod(
    String path,
    dynamic data, {
    bool isMultipart = false,
    FormData? formData,
    dynamic queryPara,
  }) async {
    dio = initDio(path, isMultipart: isMultipart);
    print("API Request ======= $data");
    print("API Query Param ======= $queryPara");
    //("API Request :connectionType.value ======= ${connectionType.value}");
    try {
      //if (connectionType.value != 0) {
      Response response = await dio
          .post(
            path,
            data: isMultipart ? formData : data,
            queryParameters: queryPara,
            options: Options(
              headers: {
                'accept': 'application/json',
                'Content-Type': 'application/json',
              },
            ),
          )
          .catchError((error) async {
            EasyLoading.dismiss();

            print("==ERROR===$error");
            // print("==ERROR${err.response}");
            commonResponse = CommonResponse.fromJson(error.response?.data);

            if (commonResponse.dioMessage != null) {
              if (commonResponse.dioMessage == 'Intention already added') {
                getx.Get.back(result: true);
              }
              if (commonResponse.dioMessage != 'Success') {
                await showError(
                  message: commonResponse.dioMessage ?? '',
                ).show(getx.Get.context!);
                // CommonWidget.toast(commonResponse.dioMessage ?? '');
              }
            } else {
              showError(
                message: StringConstants.serverError,
              ).show(getx.Get.context!);
              // CommonWidget.toast(StringConstant.serverError);
            }
            return error;
          });

      print("RESPONSE ======= ${response.data}");

      if (response.data != null &&
          (response.statusCode == 200 || response.statusCode == 201)) {
        commonResponse = CommonResponse.fromJson(response.data);
        log('commonResponse: ${commonResponse.toJson()}');
        EasyLoading.dismiss();
        if (commonResponse.dioMessage != null) {
          if (commonResponse.dioMessage !=
              'FCM Token Registered Successfully.') {
            await showSuccess(
              message: commonResponse.dioMessage ?? '',
            ).show(getx.Get.context!);
          }

          // CommonWidget.toast(commonResponse.dioMessage ?? "");
        }
      } else {
        EasyLoading.dismiss();
        await showError(
          message: StringConstants.serverError,
        ).show(getx.Get.context!);
        // CommonWidget.errorToast(StringConstant.serverError);
      }
    } on SocketException catch (e) {
      await showError(
        message: StringConstants.networkError,
      ).show(getx.Get.context!);
      // CommonWidget.toast(StringConstant.networkError);
      throw SocketException(e.toString());
    }

    return commonResponse;
  }

  Future<CommonResponse> getMethod(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    dio = initDio(path);
    print('path ==> $path');
    print('queryParameters ==> $queryParameters');

    CommonResponse commonResponse = CommonResponse();

    //print('dio : ${dio}');
    try {
      //if (connectionType.value != 0) {
      var response = await dio
          .get(
            path,
            options: Options(
              headers: {
                'accept': 'application/json',
                'Content-Type': 'application/json',
              },
            ),
            queryParameters: queryParameters,
          )
          .catchError((DioException e) {
            EasyLoading.dismiss();
            print("==ERROR===${e.toString()}");
            return e;
          });
      // print("RESPONSE ======= ${response.data}");
      if ((response.statusCode == 200 || response.statusCode == 201) &&
          response.data != null) {
        EasyLoading.dismiss();
        commonResponse = CommonResponse.fromJson(response.data);
        if (commonResponse.dioMessage != null) {
          await showSuccess(
            message: commonResponse.dioMessage ?? '',
          ).show(getx.Get.context!);
          // CommonWidget.toast(commonResponse.dioMessage!);
        }
      } else {
        EasyLoading.dismiss();
        await showError(
          message: StringConstants.serverError,
        ).show(getx.Get.context!);
        // CommonWidget.errorToast(
        //     commonResponse.dioMessage ?? StringConstant.serverError);
      }
    } on SocketException catch (e) {
      await showError(
        message: StringConstants.networkError,
      ).show(getx.Get.context!);
      // CommonWidget.toast(StringConstant.networkError);
      throw SocketException(e.toString());
    }

    return commonResponse;
  }

  Future<CommonResponse> putMethod(
    String path, {
    Map<String, dynamic>? query,
    dynamic data,
    bool isMultipart = false,
    FormData? formData,
  }) async {
    dio = initDio(path, isMultipart: isMultipart);

    print("API Request ======= ${formData?.files.map((e) => e.value)}");
    // Response response = await put(path, data);
    // if (connectionType.value != 0) {
    try {
      var response = await dio
          .put(
            path,
            data: isMultipart ? formData : data,
            options: Options(
              headers: {
                'accept': 'application/json',
                'Content-Type':
                    isMultipart ? 'multipart/form-data' : 'application/json',
              },
            ),
          )
          .catchError((e) {
            EasyLoading.dismiss();
            print("==ERROR===${e.toString()}");
            return e;
          });
      print("RESPONSE ======= ${response.data}");
      if ((response.statusCode == 200 || response.statusCode == 201) &&
          response.data != null) {
        commonResponse = CommonResponse.fromJson(response.data);
        EasyLoading.dismiss();
        if (commonResponse.dioMessage != null) {
          await showSuccess(
            message: commonResponse.dioMessage ?? '',
          ).show(getx.Get.context!);
          // CommonWidget.toast(commonResponse.dioMessage!);
        }
      } else {
        EasyLoading.dismiss();
        await showError(
          message: StringConstants.serverError,
        ).show(getx.Get.context!);

        // CommonWidget.errorToast(
        //     commonResponse.dioMessage ?? StringConstant.serverError);
      }

      return commonResponse;
    } on SocketException catch (e) {
      await showError(
        message: StringConstants.networkError,
      ).show(getx.Get.context!);
      // CommonWidget.toast(StringConstant.networkError);
      throw SocketException(e.toString());
    }
  }

  Future<CommonResponse> deleteMethod(
    String path, {
    Map<String, dynamic>? data,
  }) async {
    dio = initDio(path);
    print("API Request ======= $data");
    try {
      //if (connectionType.value != 0) {
      Response response = await dio
          .delete(
            path,
            options: Options(headers: {'accept': 'application/json'}),
            data: data,
          )
          .catchError((error) {
            EasyLoading.dismiss();
            print(error);
            return error;
          });
      print("RESPONSE ======= ${response.data}");

      if (response.data != null &&
          (response.statusCode == 200 || response.statusCode == 201)) {
        commonResponse = CommonResponse.fromJson(response.data);
        EasyLoading.dismiss();
        if (commonResponse.dioMessage != null) {
          await showSuccess(
            message: commonResponse.dioMessage ?? '',
          ).show(getx.Get.context!);
          // CommonWidget.toast(commonResponse.dioMessage!);
        }
      } else {
        EasyLoading.dismiss();

        await showError(
          message: StringConstants.serverError,
        ).show(getx.Get.context!);
      }

      return commonResponse;
    } on SocketException catch (e) {
      await showError(
        message: StringConstants.networkError,
      ).show(getx.Get.context!);
      // CommonWidget.toast(StringConstant.networkError);
      throw SocketException(e.toString());
    }
  }

  Dio initDio(String partUrl, {bool isMultipart = false}) {
    Map<String, dynamic>? headers = {};
    String acceptHeader;
    String contentTypeHeader;

    acceptHeader = 'application/json';
    contentTypeHeader =
        isMultipart ? 'multipart/form-data' : 'application/json';
    // final prefs = Get.find<SharedPreferences>();
    headers = {
      HttpHeaders.acceptHeader: acceptHeader,
      HttpHeaders.contentTypeHeader: contentTypeHeader,
      // HttpHeaders.authorizationHeader: token != null &&
      //         token.isNotEmpty &&
      //         !partUrl.toString().contains(ApiConstants.checkVersion)
      //     ? 'Bearer $token'
      //     : null
    };

    // debugPrint(Injector.prefs.getString(PrefKeys.token));
    BaseOptions options = BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      connectTimeout: Duration(milliseconds: 20000),
      receiveTimeout: Duration(milliseconds: 30000),
      headers: headers,
    );
    dio.options = options;
    dio.interceptors.addAll([
      RetryOnConnectionChangeInterceptor(
        requestRetrier: DioConnectivityRequestRetrier(
          dio: Dio(),
          connectivity: Connectivity(),
        ),
      ),
      LoggingInterceptor(),
    ]);
    return dio;
  }
}
