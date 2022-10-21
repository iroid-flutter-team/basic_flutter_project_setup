import 'package:align_flutter_app/models/response/home/inspection/examination_response.dart';
import 'package:align_flutter_app/models/response/home/inspection/questions_response.dart';
import 'package:align_flutter_app/modules/main/tabs/home/examination/examination_controller.dart';
import 'package:align_flutter_app/routes/routes.dart';
import 'package:align_flutter_app/shared/dialog/answer_complete_dialog.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../../../../api/api_repository.dart';
import '../../../../../../shared/constants/color_constants.dart';
import '../../../../../../shared/constants/png_image_constant.dart';
import '../../../../../../shared/constants/string_constant.dart';
import '../../../../../../shared/dialog/sign_out.dart';
import '../../../../../../shared/dialog/summary_report_complete_dialog.dart';
import '../../../../../../shared/utils/math_utils.dart';
import '../../../../../../shared/widgets/base_elevated_button.dart';
import '../../../../../../shared/widgets/base_text.dart';
import 'model/question_model.dart';
import 'dart:io';
import 'package:camera/camera.dart';

class QuestionController extends GetxController {
  final ApiRepository apiRepository;
  QuestionController({required this.apiRepository});

  final CarouselController carouselController = CarouselController();
  var questionModelList = <QuestionModel>[].obs;
  var questionsResponse = <QuestionsResponse>[].obs;
  var currentQuestion = 0.obs;
  RxDouble distanceValue = 0.0.obs;
  var argumentData = Get.arguments[0] as ExaminationResponse;
  final RefreshController refreshController = RefreshController();
  var jobId = Get.arguments[1];
  var questionId;
  RxBool argumentValue = true.obs;
  var managerComppleteInspection;
  ExaminationController examinationController = Get.put(ExaminationController(apiRepository: Get.find()));
  // initQuestions() {
  //   questionModelList.clear();
  //
  //   questionModelList.add(
  //     QuestionModel(
  //       id: 1,
  //       title: 'Windows',
  //       imagePathList: [],
  //       question:
  //           'Inspect the unit to make sure it’s in good working condition?',
  //       //tip: 'Tip: Do not fully cover your air conditioning unit during the winter.',
  //       questionSubmitted: false,
  //       tags: 'demo',
  //       notes: '',
  //       rating: 1,
  //       checkListID: '',
  //       location: '',
  //       answerId: 1,
  //       checkList: [],
  //       option: '',
  //     ),
  //   );
  //   questionModelList.add(
  //     QuestionModel(
  //       id: 2,
  //       title: 'Air conditioner 2',
  //       imagePathList: [
  //         'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  //         'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  //         'https://via.placeholder.com/500',
  //       ],
  //       question:
  //           'Inspect the unit to make sure it’s in good working condition?',
  //       //tip: 'Tip: Do not fully cover your air conditioning unit during the winter.',
  //       questionSubmitted: true,
  //       tags: 'demo',
  //       notes: '',
  //       rating: 1,
  //       checkListID: '',
  //       location: '',
  //       answerId: 2,
  //       checkList: [],
  //       option: '',
  //     ),
  //   );
  //   questionModelList.add(
  //     QuestionModel(
  //       id: 3,
  //       title: 'Air conditioner 3',
  //       imagePathList: [
  //         'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  //         'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80',
  //       ],
  //       question:
  //           'Inspect the unit to make sure it’s in good working condition?',
  //       // tip: 'Tip: Do not fully cover your air conditioning unit during the winter.',
  //       questionSubmitted: true,
  //       tags: 'demo',
  //       notes: '',
  //       rating: 1,
  //       checkListID: '',
  //       location: '',
  //       answerId: 3,
  //       checkList: [],
  //       option: '',
  //     ),
  //   );
  //   questionModelList.add(
  //     QuestionModel(
  //       id: 4,
  //       title: 'Air conditioner 4',
  //       imagePathList: [],
  //       question:
  //           'Inspect the unit to make sure it’s in good working condition?',
  //       //tip: 'Tip: Do not fully cover your air conditioning unit during the winter.',
  //       questionSubmitted: false,
  //       tags: 'demo',
  //       notes: '',
  //       rating: 1,
  //       checkListID: '',
  //       location: '',
  //       answerId: 4,
  //       checkList: [],
  //       option: '',
  //     ),
  //   );
  //
  //   questionModelList.add(
  //     QuestionModel(
  //       id: 5,
  //       title: 'Air conditioner 1',
  //       imagePathList: [
  //         'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  //         'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  //         //'https://via.placeholder.com/500',
  //       ],
  //       question:
  //           'Inspect the unit to make sure it’s in good working condition?',
  //       // tip: 'Tip: Do not fully cover your air conditioning unit during the winter.',
  //
  //       questionSubmitted: true,
  //       tags: 'demo',
  //       notes: '',
  //       rating: 1,
  //       checkListID: '',
  //       location: '',
  //       answerId: 5,
  //       checkList: [],
  //       option: '',
  //     ),
  //   );
  // }

  addImagePath({required String imagePath}) {
    /* questionModelList[currentQuestion.value].localImagePathList
        .add(imagePath);*/

    //questionModelList[currentQuestion.value].imagePath.value = imagePath;

    //print('localImagePathList.length = ${questionModelList[currentQuestion.value].localImagePathList.length}');
  }

  String getPageNavigationText({required index}) {
    int cQuestion = currentQuestion.value + 1;
    int totalQuestion = questionModelList.length;

    if( questionModelList.length -1  ==  index && managerComppleteInspection ==  true){
      return "Done";
    } else {
      return '$cQuestion Out of $totalQuestion';
    }
  }

  getQuestion(int examinationId, int jobId) async {
    //var checkList = [];
    var res = await apiRepository.getQuestion(examinationId, jobId);
    if (res != null && res.listData != null) {
      questionsResponse.value = res.listData as List<QuestionsResponse>;
      managerComppleteInspection = res.managerComppleteInspection;
      print("managerComppleteInspection==========$managerComppleteInspection}");
      print("questionsResponse.length=============${questionModelList.length}");
      if (questionsResponse.isNotEmpty) {
        questionModelList.clear();
        // for(int i = 0; i < questionsResponse[i].checklists!.length; i++){
        //   checkList.add(questionsResponse[i].checklists![i].isChecked);
        //   print("isChecked===========${questionsResponse[i].checklists![i].isChecked}");
        // }
        for (int i = 0; i < questionsResponse.length; i++) {
          questionModelList.add(
            QuestionModel(
              id: questionsResponse[i].questionId!,
              title: questionsResponse[i].title!,
              imagePathList: questionsResponse[i].answer!.images == null
                  ? []
                  : questionsResponse[i]
                      .answer!
                      .images!
                      .map((e) => e.image ?? '')
                      .toList(),
              question: questionsResponse[i].description!,
              tags: questionsResponse[i].answer?.tags ?? '',
              notes: questionsResponse[i].answer?.notes ?? '',
              rating: questionsResponse[i].answer?.rating ?? 0,
              checkListID: '',
              location: questionsResponse[i].answer?.location ?? "",
              answerId: questionsResponse[i].answer?.answerId ?? 0,
              questionSubmitted:
                  questionsResponse[i].answer?.answerId != null ? true : false,
              //isChecked: questionsResponse[i].checklists![i].isChecked ?? false,
              checkList: questionsResponse[i].checklists,
              option: "",
            ),
          );
        }
        if (res.managerComppleteInspection == true) {
          questionModelList.add(
            QuestionModel(
              id: 6,
              title: 'dilip',
              imagePathList: [
                'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
                'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
                //'https://via.placeholder.com/500',
              ],
              question:
                  'Inspect the unit to make sure it’s in good working condition?',
              // tip: 'Tip: Do not fully cover your air conditioning unit during the winter.',
              questionSubmitted: true,
              tags: 'demo',
              notes: 'ioi',
              rating: 1,
              checkListID: '2',
              location: 'iuoio',
              answerId: 5,
              checkList: [],
              option: 'ghjhj',
            ),
          );
          print(
              "questionModewl LIst=============${questionModelList.map((element) => element.title).toList()}");
          //_answerCompleteDialog();
        }
        print(
            "questionsResponse[i].answer=============${questionModelList.length}");
      }
    }
  }

  congratulationView() {
    return Container(
      // padding: EdgeInsets.all(getSize(0.0)),
      decoration: BoxDecoration(
          color: ColorConstants.dialogBlack,
          borderRadius: BorderRadius.circular(
            getSize(20),
          ),
          border: Border.all(
            color: ColorConstants.dialogBorderGreen,
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 0),
              blurRadius: 25,
              color: ColorConstants.dialogBorderGreen.withOpacity(0.6),
            ),
          ]),
      child: Padding(
        padding: EdgeInsets.only(top: 40, bottom: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              child: Image.asset(
                PngImageConstants.answer_done,
                height: getSize(178),
              ),
            ),
            SizedBox(
              height: getSize(30.0),
            ),
            BaseText(
              text: 'Congratulations',
              textAlign: TextAlign.center,
              fontSize: 20,
              fontWeight: FontWeight.w600,
              textColor: ColorConstants.white.withOpacity(0.8),
            ),
            SizedBox(
              height: getSize(10.0),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: BaseText(
                text: "You have successfully completed examination",
                fontWeight: FontWeight.w500,
                textColor: Colors.white.withOpacity(0.8),
                textAlign: TextAlign.center,
                fontSize: 12,
              ),
            ),
            SizedBox(
              height: getSize(33.0),
            ),
            BaseElevatedButton(
              width: getSize(214.0),
              onPressed: () {
                Get.back();
              },
              //borderRadius: BorderRadius.circular(20.0),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: BaseText(text: 'CONTINUE'),
              ),
            ),
            SizedBox(
              height: getSize(10.0),
            ),
          ],
        ),
      ),
    );
  }

  _answerCompleteDialog() {
    showDialog(
      barrierColor: Colors.black26,
      context: Get.context!,
      builder: (context) {
        return AnswerCompleteDialog(
          continueCallBack: () {
            Get.toNamed(Routes.EXAMINATION_RESULT, arguments: jobId);
          },
        );
      },
    );
  }

  @override
  void onInit() {
    printInfo(info: 'Get.Argument${Get.arguments}');
    if (Get.arguments[2] != null && Get.arguments[2] != -3) {
      questionId = Get.arguments[2];
    }
    print("jobID=============$jobId");
    // print("jobID=============${questionsResponse[].answer?.rating ?? 0}");
    //getQuestion(argumentData.examinationId ?? 0, jobId);
    super.onInit();
  }
}
