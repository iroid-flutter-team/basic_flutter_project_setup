import 'package:align_flutter_app/models/response/home/job_response.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../../api/api_repository.dart';
import '../setting/setting_controller.dart';

class HomeController extends GetxController{
  final ApiRepository apiRepository;
  HomeController({required this.apiRepository});
  var jobsResponse = JobResponse().obs;
  final RefreshController refreshController = RefreshController();
  SettingController settingController = Get.put(SettingController(apiRepository: Get.find()));

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