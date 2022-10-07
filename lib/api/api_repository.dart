import 'package:align_flutter_app/models/response/auth/login_response.dart';
import 'package:align_flutter_app/models/response/home/history/history_response.dart';
import 'package:align_flutter_app/models/response/home/inspection/questions_response.dart';
import 'package:align_flutter_app/models/response/home/results/results_response.dart';
import 'package:align_flutter_app/models/response/home/summary_reports/summary_reports_response.dart';
import '../models/response/common_response.dart';
import '../models/response/home/inspection/examination_response.dart';
import '../models/response/home/job_response.dart';
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

  Future<List<QuestionsResponse>?> examinationAnswer(FormData data) async {
    print("Data : ======$data");
    final res = await apiProvider.postMethod(ApiConstants.answers, {},
        formData: data, isMultipart: true);
    print("resData : ======${res.data}");
    if (res.data != null) {
      List<dynamic> listData = res.data;
      return listData
          .map((e) => QuestionsResponse.fromJson(e as Map<String, dynamic>))
          .toList();
      // return ExaminationResponse.fromJson(res.data);
    } else {
      return null;
    }
    // if (res.dioMessage != null) {
    //   return CommonResponse(dioMessage: res.dioMessage);
    // }
    return null;
  }

  Future<QuestionsResponse> answerUpdate(FormData data, int id) async {
    print("UserData : ======$data");
    final res = await apiProvider.putMethod(
        "${ApiConstants.answersUpdate}/$id", {},
        isMultipart: true, formData: data);
    print("UserData : ============================${res.data}");
    if (res.data != null) {
      return QuestionsResponse.fromJson(res.data as Map<String, dynamic>);
    }
    return QuestionsResponse();
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

  Future<List<SummaryReportsResponse>?> getSummaryReport(int id) async {
    final res = await apiProvider.getMethod("${ApiConstants.summaryReports}/$id");
    print("SummaryReportsResponse==============${res.data}");
    if (res.data != null) {
      List<dynamic> listData = res.data;
      return listData
          .map((e) =>
          SummaryReportsResponse.fromJson(e as Map<String, dynamic>))
          .toList();
      // return ExaminationResponse.fromJson(res.data);
    } else {
      return null;
    }
  }
}
