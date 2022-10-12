import 'package:get/get.dart';

import '../../../../../api/api_repository.dart';
import '../../../../../models/response/home/review/review_response.dart';

class ReviewController extends GetxController{
  final ApiRepository apiRepository;
  ReviewController({required this.apiRepository});

  var reviewResponse = <ReviewResponse>[].obs;

  getReview()async{
    var res = await apiRepository.getReview();
    if(res != null && res.isNotEmpty){
      reviewResponse.value = res;
    }
  }

  @override
  void onInit() {
    getReview();
    super.onInit();
  }
}