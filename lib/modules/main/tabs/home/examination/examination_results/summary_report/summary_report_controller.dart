import 'package:align_flutter_app/models/response/home/summary_reports/summary_reports_response.dart';
import 'package:align_flutter_app/modules/main/tabs/home/examination/examination_results/summary_report/model/recommendation_model.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../../../../api/api_repository.dart';
import '../../question/model/question_model.dart';
import 'model/summary_report_model.dart';

class SummaryReportController extends GetxController {
  final ApiRepository apiRepository;
  SummaryReportController({required this.apiRepository});

  final CarouselController carouselController = CarouselController();
 // TextEditingController suggestionsController = TextEditingController();
  final RxList<String> localImagePathList = <String>[].obs;
  var summaryReportModelList = <SummaryReportModel>[].obs;
  var summaryReportsResponse = <SummaryReportsResponse>[].obs;
  final Rx<int> currentQuestion = 0.obs;
  RxDouble distanceValue = 0.0.obs;
  var jobId = Get.arguments;
  //SummaryReportModel summaryReportModel;
  // var recommendationList = [
  //   RecommendationModel(id: 1, title: "dgs"),
  //   RecommendationModel(id: 2, title: "dgs"),
  //   RecommendationModel(id: 3, title: "dgs"),
  // ];
  // List<String> tagList = [
  //   'Window',
  //   'Yard',
  //   'Door',
  // ];
  //
  // List<String> recommendationList = [
  //   'Repairs recommended',
  //   'Maintenance recommended',
  //   'Replace recommended',
  // ];
  // RxString condition = 'Condition'.obs;
  // RxString recommendation = 'Recommendation'.obs;
  //final RxBool isTileExpanded = false.obs;
  //final RxBool isTileExpanded1 = false.obs;

  // 'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  // 'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  // 'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  // 'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  // 'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  // 'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80',

  initQuestions() {
    summaryReportModelList.clear();

    summaryReportModelList.add(
      SummaryReportModel(
        id: 1,
        title: 'Air conditioner 1',
        imagePathList: [],
        recommendation: [
          'Repairs recommended',
          'Maintenance recommended',
          'Replace recommended'
        ],
        problem: '',
        condition: ['Above', 'Average', 'Below'],
        questionSubmitted: false,
        tips: '',
      ),
    );
    summaryReportModelList.add(
      SummaryReportModel(
        id: 2,
        title: 'Air conditioner 2',
        imagePathList: [
          'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
          'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
          'https://via.placeholder.com/500',
        ],
        recommendation: [
          'Repairs recommended',
          'Maintenance recommended',
          'Replace recommended'
        ],
        problem: '',
        condition: ['Above', 'Average', 'Below'],
        questionSubmitted: true,
        tips: '',
      ),
    );
    summaryReportModelList.add(
      SummaryReportModel(
        id: 3,
        title: 'Air conditioner 3',
        imagePathList: [
          'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
          'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80',
        ],
        recommendation: [
          'Repairs recommended',
          'Maintenance recommended',
          'Replace recommended'
        ],
        problem: '',
        condition: ['Above', 'Average', 'Below'],
        questionSubmitted: true,
        tips: '',
      ),
    );
    summaryReportModelList.add(
      SummaryReportModel(
        id: 4,
        title: 'Air conditioner 4',
        imagePathList: [],
        recommendation: [
          'Repairs recommended',
          'Maintenance recommended',
          'Replace recommended'
        ],
        problem: '',
        condition: ['Above', 'Average', 'Below'],
        questionSubmitted: true,
        tips: '',
      ),
    );

    summaryReportModelList.add(
      SummaryReportModel(
        id: 5,
        title: 'Air conditioner 1',
        imagePathList: [
          'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
          'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
          //'https://via.placeholder.com/500',
        ],
        recommendation: [
          'Repairs recommended',
          'Maintenance recommended',
          'Replace recommended'
        ],
        problem: '',
        condition: ['Above', 'Average', 'Below'],
        questionSubmitted: true,
        tips: '',
      ),
    );
  }

  addImagePath({required String imagePath}) {
    /* questionModelList[currentQuestion.value].localImagePathList
        .add(imagePath);*/

    //questionModelList[currentQuestion.value].imagePath.value = imagePath;

    //print('localImagePathList.length = ${questionModelList[currentQuestion.value].localImagePathList.length}');
  }

  getSummaryReport(int jobId) async {
    var res = await apiRepository.getSummaryReport(jobId);
    if (res != null && res.isNotEmpty) {
      summaryReportsResponse.value = res;
      if (summaryReportsResponse.isNotEmpty) {
        summaryReportModelList.clear();
        for (int i = 0; i < summaryReportsResponse.length; i++) {
          print(
              "summaryReportsResponse[i].images==================${summaryReportsResponse[i].images!.map((e) => e.image ?? '').toList()}");
          summaryReportModelList.add(
            SummaryReportModel(
              id: summaryReportsResponse[i].answerId!,
              title: summaryReportsResponse[i].title!,
              imagePathList: summaryReportsResponse[i].images == null
                  ? []
                  : summaryReportsResponse[i]
                      .images!
                      .map((e) => e.image ?? '')
                      .toList(),
              recommendation: [
                'Repairs recommended',
                'Maintenance recommended',
                'Replace recommended'
              ],
              problem: '',
              condition: ['Above', 'Average', 'Below'],
              questionSubmitted: true,
              tips: '',
            ),
          );
        }
      }
    }
    print("");
  }

  updateSummaryReport(int jobId, SummaryReportModel summaryReportModel) async {

    var res = await apiRepository.updateSummaryReport(
        ({
          "answerId": summaryReportModel.id,
          "problem": summaryReportModel.isMajor.value == true ? 1 : 2,
          "condition": getConditionIndex(summaryReportModel.conditionValue.value),
          "recommendation": getRecommendationIndex(summaryReportModel.recommendationValue.value),
          "tips": summaryReportModel.suggestionsController.text,
        }),
        jobId);
  }

  getProblem(String val){
    switch (val) {
      case "Major" :
        return 1;
      case "Minor" :
        return 2;
    }
  }

  getRecommendationIndex(String val) {
    switch (val) {
      case 'Repairs recommended':
        return 1;
      case 'Maintenance recommended':
        return 2;
      case 'Replace recommended':
        return 3;
    }
  }

  getConditionIndex(String val) {
    switch (val) {
      case 'Above':
        return 1;
      case 'Average':
        return 2;
      case 'Below':
        return 3;
    }
  }

  @override
  void onInit() {
    // updateSummaryReport(18);
    //getSummaryReport(18);
    super.onInit();
  }
}
