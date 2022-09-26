import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../../../../api/api_repository.dart';
import '../../question/model/question_model.dart';


class SummaryReportController extends GetxController{
  final ApiRepository apiRepository;
  SummaryReportController({required this.apiRepository});

  final CarouselController carouselController = CarouselController();
  TextEditingController suggestionsController = TextEditingController();
  final RxList<String> localImagePathList = <String>[
   // 'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  ].obs;
  final List<QuestionModel> questionModelList = [];
  final Rx<int> currentQuestion = 0.obs;
  RxDouble distanceValue = 0.0.obs;
  RxBool isProblem = false.obs;
  RxBool isMinor = false.obs;

  List<String> tagList = [
    'Window',
    'Yard',
    'Door',
    'Paint',
  ];

  List<String> recommendationList = [
    'Repairs recommended',
    'Maintenance recommended',
    'Replace recommended',
  ];

  RxString tag = 'Tags'.obs;
  RxString recommendation = 'Recommendation'.obs;
  final RxBool isTileExpanded = false.obs;
  final RxBool isTileExpanded1 = false.obs;

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
        questionSubmitted: false,
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
        questionSubmitted: true,
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
        questionSubmitted: true,
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
        questionSubmitted: false,
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
        questionSubmitted: true,
      ),
    );

  }

  addImagePath({required String imagePath}){
    /* questionModelList[currentQuestion.value].localImagePathList
        .add(imagePath);*/

    //questionModelList[currentQuestion.value].imagePath.value = imagePath;

    //print('localImagePathList.length = ${questionModelList[currentQuestion.value].localImagePathList.length}');


  }
}