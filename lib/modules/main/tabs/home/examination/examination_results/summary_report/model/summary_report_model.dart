import 'package:get/get_rx/src/rx_types/rx_types.dart';

class SummaryReportModel {
  final int id;
  final String problem;
  final String tips;
  final String title;
  final List<String> condition;
  final List<String> recommendation;
  final List<String> imagePathList;
  final RxList<String> localImagePathList = <String>[].obs;
  final bool questionSubmitted;
  RxBool isMajor = false.obs;
  RxBool isMinor = false.obs;
  final RxBool isConditionExpanded = false.obs;
  final RxBool isRecommendationExpanded = false.obs;
  final RxString conditionValue = 'Condition'.obs;
  final RxString recommendationValue = 'Recommendation'.obs;

  SummaryReportModel({
    required this.title,
    required this.id,
    required this.tips,
    required this.problem,
    required this.condition,
    required this.recommendation,
    required this.imagePathList,
    required this.questionSubmitted,
  });
}
