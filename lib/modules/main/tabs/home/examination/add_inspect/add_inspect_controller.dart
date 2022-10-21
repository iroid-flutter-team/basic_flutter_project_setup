import 'dart:ffi';

import 'package:align_flutter_app/models/response/home/inspection/examination_response.dart';
import 'package:align_flutter_app/modules/main/tabs/home/examination/question/question_controller.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../../../api/api_repository.dart';
import '../../../../../../models/response/home/inspection/questions_response.dart';
import '../question/model/question_model.dart';
import 'model/add_indspect_model.dart';

class AddInspectController extends GetxController {
  final ApiRepository apiRepository;
  AddInspectController({required this.apiRepository});

  var addInspectionModelList = <AddInspectionModel>[].obs;
  var distanceValue = 0.0.obs;
  RxInt divisionValue = 4.obs;
  TextEditingController addNoteController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final RxList<String> localImagePathList = <String>[].obs;
  final RxList<int> values = [0, 1, 2, 3, 4].obs;
  RxList chipsList = <String>[].obs;
  List<Widget> chips = [];
 // var questionsResponse = <QuestionsResponse>[].obs;
  QuestionModel? questionModel;
  //int index = -1;
  //var questionID = Get.arguments as QuestionModel;
  var jobId = Get.arguments[1];
  var title = Get.arguments[3];
  var answerId;
  var checkListId =''.obs;

  getAnswer(int id) async {
    printInfo(info: 'id :$id');
    // print("imageList987===============${localImagePathList.toList()}");
    var list = questionModel?.checkList?.where((element) => element.isChecked?.value == true).toList();
    checkListId.value = list?.map((e) => e.checklistId).toList().join(',') ?? "";
    // for (int i = 0; i < questionModel!.checkList!.length; i++) {
    //   if (questionModel?.checkList?[i].isChecked?.value == true) {
    //
    //    // list.add(questionModel?.checkList?[i].checklistId.toString() ?? "");
    //   }
    //   //checkListId = questionModel?.checkList?[i].checklistId;
    // }
    String tags = "";
    for(int i =0; i< chipsList.length; i++){
      tags = '${tags + chipsList[i]},';
    }

    print("checkListId.value===============${checkListId.value}");
    final formData = FormData({
      'questionId': questionModel?.id ?? 0,
      'jobId': jobId,
      'images': localImagePathList
          .map((e) => MultipartFile(e,
              filename: 'document.png', contentType: "image/png"))
          .toList(),
      'notes': addNoteController.text,
      'tags': tags,
      'location': locationController.text,
      'rating': distanceValue,
      'checklistIds': checkListId.value,
    });
    //print("formData123===============${formData.length}");
    var res = await apiRepository.examinationAnswer(formData);
    print("questionsResponse4354545===============$res");
    if (res != null && res.dioMessage != null) {
      Get.back(result: "success");
      Get.delete<AddInspectController>();
      print("questionsResponse4354545===============$res");
    }
  }

  updateAnswer(int id) async {
    var tempList = [];
    var list = questionModel?.checkList?.where((element) => element.isChecked?.value == true).toList();
    checkListId.value = list?.map((e) => e.checklistId).toList().join(',') ?? "";
   // var checkListId = [];
    for (int i = 0; i < localImagePathList.length; i++) {
      if (!localImagePathList[i].contains("http")) {
        tempList.add(localImagePathList[i]);
      }
    }
    String tags = "";

    for(int i =0; i< chipsList.length; i++){
      tags = '${tags + chipsList[i]},';
    }
    print("tempList=========${tempList.map((e) => e)}");
    // for(int i = 0; i < questionModel!.checkList!.length; i++ ){
    //   checkListId.add(questionModel?.checkList?[i]);
    // }
    // print("tempList=========${checkListId.length}");
    final formData = FormData({
      // 'images': localImagePathList,
      'notes': addNoteController.text,
      'tags': tags,
      'location': locationController.text,
      'rating': distanceValue,
      'checklistIds': checkListId.value,
      'images' : tempList.map((e) => MultipartFile(e, filename: 'document.png', contentType: "image/png")).toList(),
    });
    var res = await apiRepository.updateAnswer(formData, id);
    if (res != null && res.dioMessage != null) {
      Get.back(result: "success");
    }
  }

  @override
  void onInit() {
    answerId = Get.arguments[2];
    print("answerId==========${answerId}");
    questionModel = Get.arguments[0] as QuestionModel;
    //print("questionModeltitile123 ===========${questionModel?.title}");
    if (questionModel != null) {

      final List<String>? tagList =  questionModel?.tags.split(',');
      tagList?.removeWhere((element) => element.isEmpty);
     // print("tagList12345=======${tagList?.length}");
      addNoteController.text = questionModel?.notes ?? "";
      locationController.text = questionModel?.location ?? "";
      distanceValue.value = questionModel!.rating.toDouble();
      localImagePathList.value = questionModel!.imagePathList;
      //chipsList.value = [questionModel?.tags].cast<String>();
      chipsList.value = tagList!.cast<String>();
    }
    print("chipsList123==========${chipsList.length}");
    //print("addNoteController==========${questionModel!.imagePathList}");
    super.onInit();
  }

  // initQuestions() {
  //   addInspectionModelList.clear();
  //   addInspectionModelList.add(
  //     AddInspectionModel(
  //       id: 1,
  //       title: 'Windows',
  //       imagePathList: [],
  //     ),
  //   );
  //   addInspectionModelList.add(
  //     AddInspectionModel(
  //       id: 2,
  //       title: 'Air conditioner 2',
  //       imagePathList: [
  //         'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  //         'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  //         'https://via.placeholder.com/500',
  //       ],
  //     ),
  //   );
  //   addInspectionModelList.add(
  //     AddInspectionModel(
  //       id: 3,
  //       title: 'Air conditioner 3',
  //       imagePathList: [
  //         'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  //         'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80',
  //       ],
  //     ),
  //   );
  // }
}
