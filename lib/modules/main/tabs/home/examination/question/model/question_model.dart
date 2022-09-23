import 'package:get/get.dart';

class QuestionModel {
   int id;
   String title;
   List<String> imagePathList;
   RxList<String> localImagePathList = <String>[].obs;
   String question;
   String tip;
   int coin;
   RxBool questionSubmitted;

  QuestionModel({
    required this.id,
    required this.title,
    required this.imagePathList,
    required this.question,
    required this.tip,
    required this.coin,
    required this.questionSubmitted,
  });
}
