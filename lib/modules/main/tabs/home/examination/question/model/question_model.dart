import 'package:get/get.dart';

class QuestionModel {
  final int id;
  final int answerId;
  final String title;
  final List<String> imagePathList;
  final RxList<String> localImagePathList = <String>[].obs;
  final String question;
  final String tags;
  final String location;
  final num rating;
  final String notes;
  final String checkListID;
  // final String tip;
  //final int coin;
  final bool questionSubmitted;

  QuestionModel({
    required this.checkListID,
    required this.notes,
    required this.tags,
    required this.location,
    required this.rating,
    required this.id,
    required this.answerId,
    required this.title,
    required this.imagePathList,
    required this.question,
    // required this.tip,
    // required this.coin,
    required this.questionSubmitted,
  });
}
