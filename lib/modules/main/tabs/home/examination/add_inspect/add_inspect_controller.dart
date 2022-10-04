import 'dart:ffi';

import 'package:align_flutter_app/models/response/home/inspection/examination_response.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../../../../api/api_repository.dart';
import '../../../../../../models/response/home/inspection/questions_response.dart';
import '../question/model/question_model.dart';
import 'model/add_indspect_model.dart';

class AddInspectController extends GetxController {
  final ApiRepository apiRepository;
  AddInspectController({required this.apiRepository});
  var addInspectionModelList = <AddInspectionModel>[].obs;
  RxBool isCheck = false.obs;
  RxBool isCheck1 = false.obs;
  var distanceValue = 0.0.obs;
  RxInt divisionValue = 4.obs;
  TextEditingController addNoteController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  final RxList<String> localImagePathList = <String>[].obs;
  final RxList<int> values = [0, 1, 2, 3, 4].obs;
  RxList chipsList = <String>[].obs;
  List<Widget> chips = [];
  var questionsResponse = <QuestionsResponse>[].obs;
  var jobId = Get.arguments;
 // QuestionsResponse questionModel= QuestionsResponse();
  QuestionModel? questionModel;
 //var questionID = Get.arguments as QuestionModel;

  initQuestions() {
    addInspectionModelList.clear();
    addInspectionModelList.add(
      AddInspectionModel(
        id: 1,
        title: 'Windows',
        imagePathList: [],
      ),
    );
    addInspectionModelList.add(
      AddInspectionModel(
        id: 2,
        title: 'Air conditioner 2',
        imagePathList: [
          'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
          'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
          'https://via.placeholder.com/500',
        ],
      ),
    );
    addInspectionModelList.add(
      AddInspectionModel(
        id: 3,
        title: 'Air conditioner 3',
        imagePathList: [
          'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
          'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80',
        ],
      ),
    );
  }

  getAnswer(int id) async {
    // int index = 0;
    // printInfo(info: 'id :=======$id');
    // for(index = 0 ; index < addInspectionModelList.length; index++){
    //   if(addInspectionModelList[index].id == id){
    //     break;
    //   }
    // }
    var answerList = <String>[];
    var imageList = <String>[];
    int index = 0;
    printInfo(info: 'id :$id');
    // var imageList = <String>[
    //   '/data/user/0/com.iroid.account_manager/cache/CAP2917773027934309901.jpg',
    //   '/data/user/0/com.iroid.account_manager/cache/CAP2917773027934309901.jpg',
    //   '/data/user/0/com.iroid.account_manager/cache/CAP2917773027934309901.jpg',
    // ];
    for (index=0; index < addInspectionModelList.length; index++) {
      // for (int j = 0; j < questionModelList[i].localImagePathList.length; j++) {
      if (addInspectionModelList[index].id == id) {
        imageList = (addInspectionModelList[index].localImagePathList.toList());
        print("imageList987===============$imageList");
        break;
        // printInfo(
        //     info:
        //         ' Test Image list====${questionModelList[i].localImagePathList.toList()}');
        //
        // }
      }
      print("imageList===============$imageList");
    }
    print("imageList123===============$imageList");
    final formData = FormData({
      'questionId': questionModel?.id ?? 0,
      'jobId': 17,
      'images': imageList
          .map((e) => MultipartFile(e,
              filename: 'document.png', contentType: "image/png"))
          .toList(),
      'notes': addNoteController.text,
      'tags': chipsList,
      'location': locationController.text,
      'rating': distanceValue,
      'checklistIds': '2',
    });
    var res = await apiRepository.examinationAnswer(formData);
    printInfo(info: 'res =========== $res');
    print("imageList456===============$imageList");
    if(res != null && res.isNotEmpty){
    questionsResponse.value = res;
    for(int i = 0;  i < questionsResponse.length;  i++){
      answerList.add(questionsResponse[i].answer!.images.toString());
    }
    return answerList;
     }
    return answerList;
  }

  @override
  void onInit() {
    questionModel = Get.arguments as QuestionModel;
    if(questionModel != null){
      addNoteController.text = questionModel?.notes ?? "";
      locationController.text =  questionModel?.location ?? "";
      distanceValue.value = questionModel!.rating.toDouble();
      localImagePathList.value = questionModel!.imagePathList;
    }
    print("addNoteController==========${questionModel!.imagePathList}");
    super.onInit();
  }
}
