import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import '../home_view_controller.dart';
import 'message_controller.dart';

class MessageBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MessageController>(() => MessageController(
      apiRepository: Get.find(),
    ),
    );
  }
}