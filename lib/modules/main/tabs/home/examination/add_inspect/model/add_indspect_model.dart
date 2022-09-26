import 'package:get/get_rx/src/rx_types/rx_types.dart';

class AddInspectionModel {
  final int id;
  final String title;
  final List<String> imagePathList;
  final RxList<String> localImagePathList = <String>[].obs;
  // final String question;
  // final String tip;
  // final int coin;
  // final bool questionSubmitted;

  AddInspectionModel({
    required this.id,
    required this.title,
    required this.imagePathList,
    // required this.question,
    // required this.tip,
    // required this.coin,
    // required this.questionSubmitted,
  });
}
