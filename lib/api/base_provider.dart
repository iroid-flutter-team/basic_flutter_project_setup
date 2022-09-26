import 'package:get/get.dart';

import 'api.dart';

class BaseProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = ApiConstants.baseUrl;
    httpClient.timeout = Duration(milliseconds: 20000);
    // httpClient.defaultDecoder = (data) {
    //   printInfo(info: "=====> $data");
    //   if (data != null) {
    //     CommonResponse.fromJson(data as Map<String, dynamic>);
    //   }
    // };
    httpClient.maxAuthRetries = 3;
    httpClient.addAuthenticator(authInterceptor);
    httpClient.addRequestModifier(requestInterceptor);
    httpClient.addResponseModifier(responseInterceptor);
  }
}
