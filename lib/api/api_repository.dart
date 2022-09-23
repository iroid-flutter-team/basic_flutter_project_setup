import 'package:get/get.dart';
import 'package:home_yogi_flutter/models/response/common_response.dart';
import 'package:home_yogi_flutter/models/response/home/check_list_details_response.dart';
import 'package:home_yogi_flutter/models/response/home/check_list_response.dart';
import 'package:home_yogi_flutter/models/response/home/examination_question_response.dart';
import 'package:home_yogi_flutter/models/response/home/levels_top_response.dart';
import 'package:home_yogi_flutter/models/response/home/notification_response.dart';
import 'package:home_yogi_flutter/models/response/home/to_do_list_tags_response.dart';
import 'package:home_yogi_flutter/models/response/home/to_do_list_task_details_response.dart';
import 'package:home_yogi_flutter/models/response/home/to_do_list_task_response.dart';
import 'package:home_yogi_flutter/models/response/premium/book_inspection_details_response.dart';
import 'package:home_yogi_flutter/models/response/premium/reports_response.dart';
import 'package:home_yogi_flutter/models/response/premium/results_response.dart';
import '../models/response/auth/user_detail_response.dart';
import '../models/response/home/answer_response.dart';
import '../models/response/home/examination_response.dart';
import '../models/response/home/levels_response.dart';
import '../models/response/home/progress_report_response.dart';
import '../models/response/home/rewards_response.dart';
import '../models/response/home/setting_notification_response.dart';
import '../models/response/home/subscription_plan_response.dart';
import '../models/response/home/to_do_list_response.dart';
import '../models/response/premium/book_inspection_response.dart';
import '../models/response/premium/inspection_manager_response.dart';
import '../models/response/users_response.dart';
import 'api.dart';
import '../models/response/auth/otp_verify_response.dart';

class ApiRepository {
  ApiRepository({required this.apiProvider});

  final ApiProvider apiProvider;

  Future<CommonResponse?> login(Map<String, dynamic> data) async {
    //print("Data : ======$data");
    final res = await apiProvider.postMethod(ApiConstants.login, data);
    //print("resData : ======${res.dioMessage}");
    if (res.dioMessage != null) {
      return CommonResponse(dioMessage: res.dioMessage);
    }
    return null;
  }

  Future<OtpVerifyResponse?> otpVerify(Map<String, String> data) async {
    // print("Data : ======$data");
    final res = await apiProvider.postMethod(ApiConstants.otpVerify, data);
    //print("resData : ======/////////////${res.data}");
    if (res.data != null) {
      return OtpVerifyResponse.fromJson(res.data);
    }
    return OtpVerifyResponse();
  }

  Future<UserDetailResponse> updateUserDetail(FormData data) async {
    print("UserData : ======$data");
    final res = await apiProvider.putMethod(ApiConstants.updateUserDetail, {},
        isMultipart: true, formData: data);
    print("UserData : ============================${res.data}");
    if (res.data != null) {
      return UserDetailResponse.fromJson(res.data as Map<String, dynamic>);
    }
    return UserDetailResponse();
  }

  Future<List<ExaminationResponse>?> getExaminations() async {
    final res = await apiProvider.getMethod(ApiConstants.examinations);
    print("resExaminations==============${(res.data)}");
    if (res.data != null) {
      List<dynamic> listData = res.data;
      return listData
          .map((e) => ExaminationResponse.fromJson(e as Map<String, dynamic>))
          .toList();
      // return ExaminationResponse.fromJson(res.data);
    } else {
      return null;
    }
  }

  Future<ToDoListResponse?> getToDoList() async {
    final res = await apiProvider.getMethod(ApiConstants.toDoList);
    print("resToDoList==============${res.data}");
    if (res.data != null) {
      return ToDoListResponse.fromJson(res.data);
    }
    return null;
  }

  Future<ProgressReportResponse?> getProgressReport() async {
    final res = await apiProvider.getMethod(ApiConstants.progressReport);
    print("resProgressReport==============${res.data}");
    if (res.data != null) {
      return ProgressReportResponse.fromJson(res.data);
    }
    // if (res.data != null) {
    //    listData = res.data;
    //   return listData.map((e) => ProgressReportResponse.fromJson(e as  Map<String, dynamic>)).toList();
    // }
    return null;
  }

  Future<List<RewardsResponse>?> getRewards(int page, int perPage) async {
    //String testUrl = '?page=1&perPage=20';

    final res = await apiProvider
        .getMethod(ApiConstants.rewards + "?page=$page&perPage=$perPage");
    print("rewardsData==============${res.data}");
    if (res.data != null) {
      List<dynamic> rewardList = res.data;
      return rewardList
          .map((e) => RewardsResponse.fromJson(e as Map<String, dynamic>))
          .toList();
    } else {
      return null;
    }
  }

  Future<List<ExaminationQuestionResponse>?> getExaminationQuestion(int id) async {
    final res = await apiProvider.getMethod("${ApiConstants.examinationQuestion+'/'+id.toString()}");

    print("examinationQuestionResponse==============${res.data}");
    if (res.data != null) {
      List<dynamic> listData = res.data;
      return listData
          .map((e) =>
              ExaminationQuestionResponse.fromJson(e as Map<String, dynamic>))
          .toList();
    } else {
      return null;
    }
  }

  Future<CommonResponse?> addTodoListAddTask(Map<String, dynamic> data) async {
    //print("Data : ======$data");
    final res =
        await apiProvider.postMethod(ApiConstants.addTodoListAddTask, data);
    //print("resData : ======${res.dioMessage}");
    if (res.dioMessage != null) {
      return CommonResponse(dioMessage: res.dioMessage);
    }
    return null;
  }

  Future<CheckListResponse?> getCheckList() async {
    final res = await apiProvider.getMethod(ApiConstants.checklists);
    print("resToDoList==============${res.data}");
    if (res.data != null) {
      return CheckListResponse.fromJson(res.data);
    }
    return null;
  }

  Future<CheckListDetailsResponse?> getCheckListDetails({required Map<String, dynamic> queryParameter}) async {
    print("CheckListDetailsqueryParameter..............=============$queryParameter");
    final res = await apiProvider.getMethod(ApiConstants.checklistDetails);
    print("CheckListDetailsResponse==============${res.data}");
    if (res.data != null) {
      return CheckListDetailsResponse.fromJson(res.data);
    }
    return null;
  }

  Future<CommonResponse?> checklistChecked(
      Map<String, dynamic> data, int id) async {
    //print("Data : ======$data");
    final res = await apiProvider.postMethod(
        "${ApiConstants.checkListChecked}/$id/checked", data);
    //print("resData : ======${res.dioMessage}");
    if (res.dioMessage != null) {
      return CommonResponse(dioMessage: res.dioMessage);
    }
    return null;
  }

  Future<ToDoListTaskResponse?> getToDoListGetTask({required Map<String, dynamic> queryParameter}) async {
    print("queryParameterMap123..............=============$queryParameter");
    final res = await apiProvider.getMethod("${ApiConstants.addTodoListGetTask}",isQueryParameter: true, queryParameterMap: queryParameter);
    print("resToDoList==============${res.data}");

    if (res.data != null) {
      return ToDoListTaskResponse.fromJson(res.data);
    }
    return null;
  }

  Future<ToDoListTaskDetailsResponse?> getToDoListTaskDetails(int id) async {
    final res =
        await apiProvider.getMethod("${ApiConstants.toDoListTaskDetails}/$id");
    print("toDoListTaskDetails==============${res.data}");
    if (res.data != null) {
      return ToDoListTaskDetailsResponse.fromJson(res.data);
    }
    return null;
  }

  Future<ToDoListTaskDetailsResponse> updateTask(
      int id, Map<String, dynamic> data) async {
    final res = await apiProvider
        .putMethod("${ApiConstants.updateTask}/$id", data, isMultipart: false);
    print("UserData : ============================${res.data}");
    if (res.data != null) {
      return ToDoListTaskDetailsResponse.fromJson(
          res.data as Map<String, dynamic>);
    }
    return ToDoListTaskDetailsResponse();
  }

  Future<CommonResponse?> deleteTask(Map<String, String> data, int id) async {
    //print("Data : ======$data");
    final res =
        await apiProvider.deleteMethod("${ApiConstants.deleteTask}/$id");
    print("resData : ======${res.dioMessage}");
    if (res.dioMessage != null) {
      return CommonResponse(
        dioMessage: res.dioMessage,
      );
    }
    return null;
  }

  Future<CommonResponse?> toDoListTaskComplete(int id, Map<String, dynamic> data) async {
    //print("Data : ======$data");
    final res = await apiProvider.postMethod(
        "${ApiConstants.todoListTaskComplete}/$id/completed", data);
    //print("resData : ======${res.dioMessage}");
    if (res.dioMessage != null) {
      return CommonResponse(dioMessage: res.dioMessage);
    }
    return null;
  }

  Future<LevelsResponse?> getLevels() async {
    final res = await apiProvider.getMethod(ApiConstants.levels);
    print("LevelsResponse==============${res.data}");
    if (res.data != null) {
      return LevelsResponse.fromJson(res.data);
    }
    return null;
  }

  Future<List<NotificationResponse>?> getNotification(
      int page, int perPage) async {
    final res = await apiProvider
        .getMethod(ApiConstants.notifications + "?page=$page&perPage=$perPage");
    print("resToDoList==============${res.data}");
    if (res.data != null) {
      List<dynamic> listData = res.data;
      return listData
          .map((e) => NotificationResponse.fromJson(e as Map<String, dynamic>))
          .toList();
    }
    return null;
  }


  // Future<CommonResponse>? getLevelsTop(Map<String, dynamic>? queryParameterMap) async {
  //   final res = await apiProvider.getMethod(ApiConstants.levelsTop, isQueryParameter: true,queryParameterMap: queryParameterMap);
  //   print("LevelsTopResponse==============${res.data}");
  //   if (res.data != null) {
  //     return CommonResponse.fromJson(res.toJson());
  //   }
  //   return CommonResponse();
  // }


  Future<CommonResponse?> getLevelsTop(Map<String, dynamic>? queryParameterMap) async {
    final CommonResponse commonResponse = await apiProvider.getMethod(ApiConstants.levelsTop, isQueryParameter: true,queryParameterMap: queryParameterMap);
    print("LevelsTopResponse==============${commonResponse.data}");
    if (commonResponse.data != null) {
      return commonResponse;
    }
    return null;
  }
  // Future<List<LevelsTopResponse>?> getLevelsTop() async {
  //   final res = await apiProvider.getMethod(ApiConstants.levelsTop);
  //   print("resToDoList==============${res.data}");
  //   if (res.data != null) {
  //     List<dynamic> listData = res.data;
  //     return listData
  //         .map((e) => LevelsTopResponse.fromJson(e as Map<String, dynamic>))
  //         .toList();
  //   }
  //   return null;
  // }
  Future<CommonResponse?> logOut(Map<String, dynamic> data) async {
    //print("Data : ======$data");
    final res = await apiProvider.postMethod(ApiConstants.loginOut, data);
    //print("resData : ======${res.dioMessage}");
    if (res.dioMessage != null) {
      return CommonResponse(dioMessage: res.dioMessage);
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


  Future<List<SubscriptionPlansResponse>?> getSubscriptionPlans() async {
    final res = await apiProvider.getMethod(ApiConstants.subscriptionPlan);
    print("SubscriptionPlansResponse==============${res.data}");
    if (res.data != null) {
      List<dynamic> listData = res.data;
      return listData.map((e) => SubscriptionPlansResponse.fromJson(e as Map<String, dynamic>)).toList();
    }
    return null;
  }

  Future<List<BookInspectionResponse>?> getBookInspection() async {
    final res = await apiProvider.getMethod(ApiConstants.bookInspection);
    print("BookInspectionResponse==============${(res.data)}");
    if (res.data != null) {
      List<dynamic> listData = res.data;
      return listData
          .map((e) => BookInspectionResponse.fromJson(e as Map<String, dynamic>))
          .toList();
      // return ExaminationResponse.fromJson(res.data);
    } else {
      return null;
    }
  }


  Future<InspectionManagerResponse?> getInspectionManager() async {
    final res = await apiProvider.getMethod(ApiConstants.inspectionManager);
    print("InspectionManagerResponse==============${res.data}");
    if (res.data != null) {
      return InspectionManagerResponse.fromJson(res.data);
    }
    return null;
  }

  Future<BookInspectionDetailsResponse?> getBookInspectionDetails(int id) async {
    final res = await apiProvider.getMethod("${ApiConstants.bookInspectionDetails}/$id");
    print("InspectionManagerResponse==============${res.data}");
    if (res.data != null) {
      return BookInspectionDetailsResponse.fromJson(res.data);
    }
    return null;
  }


  Future<List<AnswerResponse>?> examinationAnswer(FormData data) async {
    print("Data : ======$data");
    final res = await apiProvider.postMethod(ApiConstants.examinationAnswer,
        {},formData: data, isMultipart: true);
    print("resData : ======${res.data}");
    if (res.data != null) {
      List<dynamic> listData = res.data;
      return listData
          .map((e) => AnswerResponse.fromJson(e as Map<String, dynamic>))
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


  // Future<AnswerResponse?> examinationAnswer(FormData data) async {
  //   print("Data : ======$data");
  //   final res = await apiProvider.postMethod(ApiConstants.examinationAnswer,
  //       {},formData: data, isMultipart: true);
  //   print("resData : ======${res.data}");
  //   if (res.data != null) {
  //     return AnswerResponse.fromJson(res.data);
  //   }
  //   // if (res.dioMessage != null) {
  //   //   return CommonResponse(dioMessage: res.dioMessage);
  //   // }
  //   return null;
  // }

  Future<CommonResponse?> fcmToken(Map<String, dynamic> data) async {
    final res =
    await apiProvider.postMethod(ApiConstants.fcmToken, data);
  print("resNotification===========++++++++++++++$res");
    if (res.dioMessage != null) {
      return CommonResponse(dioMessage: res.dioMessage, status: res.status);
    } else {
      return null;
    }
  }

  // Future<ToDoListTagsResponse?> getToDoListTags() async {
  //   final res = await apiProvider.getMethod(ApiConstants.toDoListTags);
  //   print("ToDoListTagsResponse==============${res.data}");
  //   if (res.data != null) {
  //     return ToDoListTagsResponse.fromJson(res.data);
  //   }
  //   return null;
  // }

  Future<List<ToDoListTagsResponse>?> getToDoListTags() async {
    final res = await apiProvider.getMethod(ApiConstants.toDoListTags);
    print("ToDoListTagsResponse==============${(res.data)}");
    if (res.data != null) {
      List<dynamic> listData = res.data;
      return listData.map((e) => ToDoListTagsResponse.fromJson(e as Map<String, dynamic>)).toList();
      // return ExaminationResponse.fromJson(res.data);
    } else {
      return null;
    }
  }

  Future<BookInspectionDetailsResponse> updateInspectionDetails(
      int id, Map<String, dynamic> data) async {
    final res = await apiProvider
        .putMethod("${ApiConstants.updateInspectionDetails}/$id/reschedule", data, isMultipart: false);
    print("UserData : ============================${res.data}");
    if (res.data != null) {
      return BookInspectionDetailsResponse.fromJson(
          res.data);
    }
    return BookInspectionDetailsResponse();
  }

  Future<ResultsResponse?> getResultsPremium() async {
    final res = await apiProvider.getMethod("${ApiConstants.results}");
    print("ResultsResponse==============${res.data}");
    if (res.data != null) {
      return ResultsResponse.fromJson(res.data);
    }
    return null;
  }

  Future<List<ReportsResponse>?> getSummaryReport() async {
    final res = await apiProvider.getMethod(ApiConstants.reports);
    print("ReportsResponse==============${(res.data)}");
    if (res.data != null) {
      List<dynamic> listData = res.data;
      return listData.map((e) => ReportsResponse.fromJson(e as Map<String, dynamic>)).toList();
      // return ExaminationResponse.fromJson(res.data);
    } else {
      return null;
    }
  }

  Future<SettingNotificationResponse?> getSettingNotification() async {
    final res = await apiProvider.getMethod("${ApiConstants.notification_setting}");
    print("SettingNotificationResponse==============${res.data}");
    if (res.data != null) {
      return SettingNotificationResponse.fromJson(res.data);
    }
    return null;
  }

  Future<SettingNotificationResponse> updateSettingNotification(Map<String, dynamic> data) async {
    final res = await apiProvider.putMethod("${ApiConstants.updateNotification_setting}", data, isMultipart: false);
    print("updateSettingNotification : ============================${res.data}");
    if (res.data != null) {
      return SettingNotificationResponse.fromJson(res.data);
    }
    return SettingNotificationResponse();
  }

}
