import 'package:align_flutter_app/models/response/home/history/history_response.dart';
import 'package:get/get.dart';

import '../../../../api/api_repository.dart';

class HistoryController extends GetxController{
  final ApiRepository apiRepository;
  HistoryController({required this.apiRepository});
  var historyResponse  = <HistoryResponse>[].obs;

  getHistory ()async{
    var res = await apiRepository.getHistory();
    if(res != null && res.isNotEmpty){
      historyResponse.value = res;
    }
  }

 @override
  void onInit() {
    getHistory();
    super.onInit();
  }

}