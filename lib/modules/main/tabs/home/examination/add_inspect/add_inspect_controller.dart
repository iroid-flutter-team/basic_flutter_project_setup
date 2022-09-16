import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../../../../api/api_repository.dart';
import '../question/model/question_model.dart';

class AddInspectController extends GetxController{
  final ApiRepository apiRepository;
  AddInspectController({required this.apiRepository});
  var questionModelList = <QuestionModel>[].obs;
  RxBool isCheck = false.obs;
  RxBool isCheck1 = false.obs;
  RxDouble distanceValue = 0.0.obs;
  TextEditingController addNoteController = TextEditingController();
  TextEditingController locationController = TextEditingController();

  final RxList<String> localImagePathList = <String>[].obs;
}