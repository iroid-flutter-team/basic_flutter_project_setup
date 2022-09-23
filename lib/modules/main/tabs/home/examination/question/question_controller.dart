import 'package:carousel_slider/carousel_controller.dart';
import 'package:get/get.dart';
import 'package:home_yogi_flutter/models/response/home/answer_response.dart';
import 'package:home_yogi_flutter/modules/main/tabs/home/examination/question/model/question_model.dart';
import 'package:home_yogi_flutter/modules/main/tabs/home/home_controller.dart';

import '../../../../../../api/api_repository.dart';
import '../../../../../../models/response/home/examination_question_response.dart';
import '../../../../../../models/response/home/examination_response.dart';

class QuestionController extends GetxController {
  final ApiRepository apiRepository;
  QuestionController({required this.apiRepository});

  ExaminationResponse argumentData = ExaminationResponse();
  final CarouselController carouselController = CarouselController();
  var questionModelList = <QuestionModel>[].obs;
  final Rx<int> currentQuestion = 0.obs;
  HomeController homeController = Get.put(HomeController(apiRepository: Get.find()));
  var examinationQuestionResponse = <ExaminationQuestionResponse>[].obs;
  var answerResponse = <AnswerResponse>[].obs;
  // 'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  // 'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  // 'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  // 'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  // 'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  // 'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80',

  initQuestions() {
    questionModelList.clear();
    questionModelList.add(
      QuestionModel(
        id: 1,
        title: 'Air conditioner 1',
        imagePathList: [],
        question:
            'Inspect the unit to make sure it’s in good working condition?',
        tip:
            'Tip: Do not fully cover your air conditioning unit during the winter.',
        coin: 5,
        questionSubmitted: false.obs,
      ),
    );
    questionModelList.add(
      QuestionModel(
        id: 2,
        title: 'Air conditioner 2',
        imagePathList: [
          'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
          'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
          'https://via.placeholder.com/500',
        ],
        question:
            'Inspect the unit to make sure it’s in good working condition?',
        tip:
            'Tip: Do not fully cover your air conditioning unit during the winter.',
        coin: 5,
        questionSubmitted: true.obs,
      ),
    );
    questionModelList.add(
      QuestionModel(
        id: 3,
        title: 'Air conditioner 3',
        imagePathList: [
          'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
          'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80',
        ],
        question:
            'Inspect the unit to make sure it’s in good working condition?',
        tip:
            'Tip: Do not fully cover your air conditioning unit during the winter.',
        coin: 5,
        questionSubmitted: true.obs,
      ),
    );
    questionModelList.add(
      QuestionModel(
        id: 4,
        title: 'Air conditioner 4',
        imagePathList: [],
        question:
            'Inspect the unit to make sure it’s in good working condition?',
        tip:
            'Tip: Do not fully cover your air conditioning unit during the winter.',
        coin: 5,
        questionSubmitted: false.obs,
      ),
    );

    questionModelList.add(
      QuestionModel(
        id: 5,
        title: 'Air conditioner 1',
        imagePathList: [
          'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
          'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
          //'https://via.placeholder.com/500',
        ],
        question:
            'Inspect the unit to make sure it’s in good working condition?',
        tip:
            'Tip: Do not fully cover your air conditioning unit during the winter.',
        coin: 5,
        questionSubmitted: true.obs,
      ),
    );
  }

  addImagePath({required String imagePath}) {
    /* questionModelList[currentQuestion.value].localImagePathList
        .add(imagePath);*/

    //questionModelList[currentQuestion.value].imagePath.value = imagePath;

    //print('localImagePathList.length = ${questionModelList[currentQuestion.value].localImagePathList.length}');
  }

  getExaminationQuestion(int id) async {
    if (argumentData.examinationId != null) {
      var res = await apiRepository.getExaminationQuestion(id);

      if (res != null && res.isNotEmpty) {
        examinationQuestionResponse.value = res;
        if (examinationQuestionResponse.isNotEmpty) {
          questionModelList.clear();
          for (int i = 0; i < examinationQuestionResponse.length; i++) {
            questionModelList.add(
              QuestionModel(
                id: examinationQuestionResponse[i].questionId!,
                title: examinationQuestionResponse[i].title!,
                imagePathList: examinationQuestionResponse[i].answer!.map((e) => e.image ?? '').toList(),
                question: examinationQuestionResponse[i].description!,
                tip: examinationQuestionResponse[i].tip!,
                coin: examinationQuestionResponse[i].points!,
                questionSubmitted:
                    examinationQuestionResponse[i].answer != null && examinationQuestionResponse[i].answer!.isNotEmpty == true ? true.obs : false.obs,
              ),
            );
            // questionModelList[i].id =
            //     examinationQuestionResponse[i].questionId!;
            // questionModelList[i].coin = examinationQuestionResponse[i].points!;
            // questionModelList[i].question =
            //     examinationQuestionResponse[i].description!;
            // questionModelList[i].tip = examinationQuestionResponse[i].tip!;
            // questionModelList[i].title = examinationQuestionResponse[i].title!;
            // questionModelList[i].imagePathList = examinationQuestionResponse[i]
            //     .answer!
            //     .map((e) => e.image??'')
            //     .toList();
          }
        }
      }
    }

    // print(
    //     "examinationQuestionResponse===============$examinationQuestionResponse");
    print(
        "examinationQuestionResponse1===============${examinationQuestionResponse.map((e) => e.toJson())}");
  }

  Future<List<String>> examinationAnswer(int id) async {
    var answerList = <String>[];
    var imageList = <String>[];
    int index = 0;
    printInfo(info: 'id :$id');
    for (index=0; index < questionModelList.length; index++) {
      // for (int j = 0; j < questionModelList[i].localImagePathList.length; j++) {
      if (questionModelList[index].id == id) {
        imageList = (questionModelList[index].localImagePathList.toList());
        break;
        // printInfo(
        //     info:
        //         ' Test Image list====${questionModelList[i].localImagePathList.toList()}');
        //
        // }
      }
    }
    // printInfo(
    //     info: 'ImageList'
    //         '====${imagelist.map((e) => MultipartFile(e, filename: 'document.png', contentType: "image/png")).toList()}');
    // printInfo(
    //     info:
    //         '${questionModelList.map((element) => element.localImagePathList.map((element) => element).toList()).toList()[0][0]}');
    final formData = FormData({
      'questionId': id,
      'images': imageList
          .map((e) => MultipartFile(e,
              filename: 'document.png', contentType: "image/png"))
          .toList(),
    });
    print("formData========+++++++${formData}");
    var res = await apiRepository.examinationAnswer(formData);
    printInfo(info: 'res123 ==> ${res}');
    if(res != null && res.isNotEmpty){
      answerResponse.value = res;
       printInfo(info: 'answerResponse ==> ${answerResponse}');
      // printInfo(info: 'res ==> ${res[0].answerId}');
      // print("questionModelList==============================${questionModelList[index].imagePathList}");
      for(int i = 0;  i < answerResponse.length;  i++){
        answerList.add(answerResponse[i].image.toString());
      }
      return answerList;
      //questionModelList[index].imagePathList.clear();
      //questionModelList[index].imagePathList.addAll(answerList);
      print("questionModelList==============================${questionModelList[index].imagePathList}");
    }
    return answerList;
    //print("examinationAnswer==============================$res");
  }

  @override
  void onInit() {
    argumentData = Get.arguments as ExaminationResponse;
    // getExaminationQuestion();

    // examinationAnswer(4);
    //print("argumentData[0] =====${argumentData.toJson()}");
    super.onInit();
  }
}
