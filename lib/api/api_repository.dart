import 'package:align_flutter_app/models/response/auth/login_response.dart';
import 'package:align_flutter_app/models/response/home/history/history_response.dart';
import 'package:align_flutter_app/models/response/home/inspection/questions_response.dart';
import 'package:align_flutter_app/models/response/home/manager_details/manager_details_response.dart';
import 'package:align_flutter_app/models/response/home/notification/notification_response.dart';
import 'package:align_flutter_app/models/response/home/results/results_response.dart';
import 'package:align_flutter_app/models/response/home/review/review_response.dart';
import 'package:align_flutter_app/models/response/home/summary_reports/summary_reports_response.dart';
import '../models/response/common_response.dart';
import '../models/response/home/inspection/examination_response.dart';
import '../models/response/home/job_response.dart';
import '../models/response/home/setting_notification/setting_notification_response.dart';
import 'api.dart';
import 'package:get/get.dart';

class ApiRepository {
  ApiRepository({required this.apiProvider});

  final ApiProvider apiProvider;

  Future<CommonResponse?> checkManagerExist(Map<String, dynamic> data) async {
    // print("Data123 : ======$data");
    final res =
        await apiProvider.postMethod(ApiConstants.checkManagerExist, data);
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

  Future<List<ExaminationResponse>?> getExamination(int id) async {
    final res = await apiProvider.getMethod("${ApiConstants.examination}/$id");
    print("ExaminationResponse==============${res.data}");
    if (res.data != null) {
      List<dynamic> listData = res.data;
      return listData
          .map((e) => ExaminationResponse.fromJson(e as Map<String, dynamic>))
          .toList();
      //return ExaminationResponse.fromJson(res.data);
    } else {
      return null;
    }
  }

  Future<List<QuestionsResponse>?> getQuestion(
      int examinationId, int jobId) async {
    final res = await apiProvider
        .getMethod("${ApiConstants.questions}/$examinationId/$jobId");
    print("QuestionsResponse==============${res.data}");
    if (res.data != null) {
      List<dynamic> listData = res.data;
      return listData
          .map((e) => QuestionsResponse.fromJson(e as Map<String, dynamic>))
          .toList();
    }
    return null;
  }

  Future<CommonResponse?> examinationAnswer(FormData data) async {
    print("Data : ======$data");
    final res = await apiProvider.postMethod(ApiConstants.answers, {},
        formData: data, isMultipart: true);
    print("resData123 : ======${res.dioMessage}");
    // if (res.dioMessage != null) {
    //   List<dynamic> listData = res.data;
    //   return listData
    //       .map((e) => QuestionsResponse.fromJson(e as Map<String, dynamic>))
    //       .toList();
    //   // return ExaminationResponse.fromJson(res.data);
    // } else {
    //   return null;
    // }
    if (res.dioMessage != null) {
      return CommonResponse(dioMessage: res.dioMessage);
    }
    return null;
  }

  Future<CommonResponse?> updateAnswer(FormData data, int id) async {
    print("UserData : ======$data");
    final res = await apiProvider.putMethod(
        "${ApiConstants.answersUpdate}/$id", {},
        isMultipart: true, formData: data);
    print("UserData : ============================${res.data}");
    if (res.dioMessage != null) {
      return CommonResponse(dioMessage: res.dioMessage);
      //  return QuestionsResponse.fromJson(res.data as Map<String, dynamic>);
    }
    return null;
  }

  Future<List<HistoryResponse>?> getHistory() async {
    final res = await apiProvider.getMethod(ApiConstants.history);
    print("HistoryResponse==============${res.data}");
    if (res.data != null) {
      List<dynamic> listData = res.data;
      return listData
          .map((e) => HistoryResponse.fromJson(e as Map<String, dynamic>))
          .toList();
      // return ExaminationResponse.fromJson(res.data);
    } else {
      return null;
    }
  }

  Future<ResultsResponse?> getResults(int id) async {
    final res = await apiProvider.getMethod("${ApiConstants.results}/$id");
    print("ResultsResponse==============${res.data}");
    if (res.data != null) {
      return ResultsResponse.fromJson(res.data);
    }
    return null;
  }

  Future<List<NotificationResponse>?> getNotification() async {
    final res = await apiProvider.getMethod(ApiConstants.notifications);
    print("NotificationResponse==============${res.data}");
    if (res.data != null) {
      List<dynamic> listData = res.data;
      return listData
          .map((e) => NotificationResponse.fromJson(e as Map<String, dynamic>))
          .toList();
    }
    return null;
  }

  Future<CommonResponse?> readNotification(
      Map<String, dynamic> data, int id) async {
    //print("Data : ======$data");
    final res = await apiProvider.postMethod(
        "${ApiConstants.readNotification}/$id", data);
    //print("resData : ======${res.dioMessage}");
    if (res.dioMessage != null) {
      return CommonResponse(dioMessage: res.dioMessage);
    }
    return null;
  }

  Future<SettingNotificationResponse?> getSettingNotification() async {
    final res = await apiProvider.getMethod(ApiConstants.notification_setting);
    print("SettingNotificationResponse==============${res.data}");
    if (res.data != null) {
      return SettingNotificationResponse.fromJson(res.data);
    }
    return null;
  }

  Future<SettingNotificationResponse> updateSettingNotification(
      Map<String, dynamic> data) async {
    final res = await apiProvider.putMethod(
        ApiConstants.updateNotification_setting, data,
        isMultipart: false);
    print(
        "updateSettingNotification : ============================${res.data}");
    if (res.data != null) {
      return SettingNotificationResponse.fromJson(res.data);
    }
    return SettingNotificationResponse();
  }

  Future<List<SummaryReportsResponse>?> getSummaryReport(int id) async {
    final res =
        await apiProvider.getMethod("${ApiConstants.summaryReports}/$id");
    print("SummaryReportsResponse==============${res.data}");
    if (res.data != null) {
      List<dynamic> listData = res.data;
      return listData
          .map(
              (e) => SummaryReportsResponse.fromJson(e as Map<String, dynamic>))
          .toList();
      // return ExaminationResponse.fromJson(res.data);
    } else {
      return null;
    }
  }

  Future<CommonResponse?> updateSummaryReport(
      Map<String, dynamic> data, int id) async {
    final res = await apiProvider.putMethod(
        "${ApiConstants.updateSummaryReports}/$id", data,
        isMultipart: false);
    print(
        "updateSummaryReportResponse: ============================${res.dioMessage}");
    if (res.dioMessage != null) {
      return CommonResponse(dioMessage: res.dioMessage);
    }
    return CommonResponse();
  }

  Future<CommonResponse?> logOut(Map<String, dynamic> data) async {
    print("Data : ======$data");
    final res = await apiProvider.postMethod(ApiConstants.loginOut, data);
    print("resData : ======${res.dioMessage}");
    if (res.dioMessage != null) {
      return CommonResponse(dioMessage: res.dioMessage);
    }
    return null;
  }

  Future<ManagerDetailsResponse?> getManagerDetails() async {
    final res = await apiProvider.getMethod(ApiConstants.managerDetails);
    print("ManagerDetailsResponse==============${res.data}");
    if (res.data != null) {
      return ManagerDetailsResponse.fromJson(res.data);
    }
    return null;
  }

  // Future<ReviewResponse?> getReview() async {
  //   final res = await apiProvider.getMethod(ApiConstants.review);
  //   print("ReviewResponse==============${res.data}");
  //   if (res.data != null) {
  //     return ReviewResponse.fromJson(res.data);
  //   }
  //   return null;
  // }

  Future<List<ReviewResponse>?> getReview() async {
    final res = await apiProvider.getMethod(ApiConstants.review);
    print("ReviewResponse==============${res.data}");
    if (res.data != null) {
      List<dynamic> listData = res.data;
      return listData
          .map((e) => ReviewResponse.fromJson(e as Map<String, dynamic>))
          .toList();
      // return ExaminationResponse.fromJson(res.data);
    } else {
      return null;
    }
  }

  Future<CommonResponse?> updateUserDetail(FormData data) async {
    print("updateUserDetail : ======$data");
    final res = await apiProvider.putMethod(
        ApiConstants.updateManagerDetails, {},
        isMultipart: true, formData: data);
    print("updateUserDetail : ============================${res.dioMessage}");
    if (res.dioMessage != null) {
      return CommonResponse(dioMessage: res.dioMessage);
    }
    return CommonResponse();
  }
}
