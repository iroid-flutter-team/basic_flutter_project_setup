

import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../../api/api_repository.dart';
import '../../../../shared/constants/string_constant.dart';
import 'model/setting_model.dart';


class SettingController extends GetxController{
  final ApiRepository apiRepository;
  SettingController({required this.apiRepository});

  RxBool switchValue = false.obs;

  List<SettingModel> settingList = [
    SettingModel(icon: 'notification_bing',  title: StringConstants.pushNotification),
    SettingModel(icon: 'about_me',    title: StringConstants.aboutMe),
    SettingModel(icon: 'shield_tick',  title: StringConstants.termsAndCondition),
    SettingModel(icon: 'logout',   title: StringConstants.signOut),
  ];


}