import 'package:align_flutter_app/models/response/auth/login_response.dart';

import '../models/response/common_response.dart';
import '../models/response/home/job_response.dart';
import 'api.dart';

class ApiRepository {
  ApiRepository({required this.apiProvider});

  final ApiProvider apiProvider;

  Future<CommonResponse?> checkManagerExist(Map<String, dynamic> data) async {
   // print("Data123 : ======$data");
    final res = await apiProvider.postMethod(ApiConstants.checkManagerExist, data);
    //print("resData : ======${res.dioMessage}");
    if (res.dioMessage != null) {
      return CommonResponse(dioMessage: res.dioMessage);
    }
    return null;
  }

  Future<LoginResponse?> login(Map<String, dynamic> data) async {
   // print("Data123 : ======$data");
    final res = await apiProvider.postMethod(ApiConstants.login, data);
  //  print("resData : ======${res.dioMessage}");
    if (res.data != null) {
      return LoginResponse.fromJson(res.data);
    }
    return null;
  }


  Future<JobResponse?> getJob() async {
    final res = await apiProvider.getMethod(ApiConstants.jobs);
    print("JobResponse==============${res.data}");
    if (res.data != null) {
      return JobResponse.fromJson(res.data);
    }
    return null;
  }

}
