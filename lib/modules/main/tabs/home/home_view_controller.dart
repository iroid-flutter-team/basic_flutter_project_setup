import 'package:align_flutter_app/models/response/home/job_response.dart';
import 'package:get/get.dart';
import '../../../../api/api_repository.dart';

class HomeController extends GetxController{
  final ApiRepository apiRepository;
  HomeController({required this.apiRepository});
  var jobsResponse = JobResponse().obs;

  getJobs() async {
    var res = await apiRepository.getJob();
    if(res != null){
      jobsResponse.value = res;
    }
    print("jobsResponse========${jobsResponse.value}");

  }

  @override
  void onInit() {
    print("Hello===============}");
    getJobs();
    super.onInit();
  }

}