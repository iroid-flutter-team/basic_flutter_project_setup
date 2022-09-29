import 'package:get/get.dart';

import '../../../../../api/api_repository.dart';
import '../../../../../models/response/home/inspection/examination_response.dart';

class ExaminationController extends GetxController{
  final ApiRepository apiRepository;
  ExaminationController({required this.apiRepository});

  var examinationResponse = <ExaminationResponse>[].obs;

  var jobId;

  getExamination(int id)async{
    var res = await apiRepository.getExamination(id);
    if(res != null && res.isNotEmpty){
     examinationResponse.value = res;
    }
    print("examinationResponse=============${examinationResponse[0].name}");
  }

  @override
  void onInit() {
    jobId= Get.arguments;
    getExamination(jobId);
    print("JobID===============$jobId");
    super.onInit();
  }

}