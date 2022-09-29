import 'package:get/get.dart';

import '../../../../../api/api_repository.dart';
import '../../../../../models/response/home/job_response.dart';

class TodayJobsController extends GetxController{
  final ApiRepository apiRepository;
  TodayJobsController({required this.apiRepository});

  var listData = Get.arguments as List<TodayJobs>;

}