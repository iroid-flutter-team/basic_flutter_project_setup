
import 'package:get/get.dart';

import 'api/api.dart';
import 'network/network_manger.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() async {
    Get.put(ApiProvider(), permanent: true);
    Get.put(ApiRepository(apiProvider: Get.find()), permanent: true);
    Get.put(NetworkManager(), permanent: true);
  }
}
