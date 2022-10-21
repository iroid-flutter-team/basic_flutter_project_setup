import 'dart:io';
import 'package:align_flutter_app/models/response/home/manager_details/manager_details_response.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../api/api_repository.dart';
import '../../../../models/response/home/setting_notification/setting_notification_response.dart';
import '../../../../routes/app_pages.dart';
import '../../../../shared/constants/storage.dart';
import '../../../../shared/constants/string_constant.dart';
import 'model/setting_model.dart';

class SettingController extends GetxController {
  final ApiRepository apiRepository;
  SettingController({required this.apiRepository});
  final RefreshController refreshController = RefreshController();
  var settingNotificationResponse = SettingNotificationResponse();
  TextEditingController aboutMeController = TextEditingController();
  var managerDetailsResponse = ManagerDetailsResponse().obs;
  RxBool switchValue = false.obs;
  final picker = ImagePicker();
  final double imageMaxWidth = Get.width;
  final double imageMaxHeight = Get.height;
  final int imageQuality = 50;
  var locationValue = ''.obs;
  var pickedImagePath = ''.obs;
  final prefs = Get.find<SharedPreferences>();

  List<SettingModel> settingList = [
    SettingModel(
        icon: 'notification_bing', title: StringConstants.pushNotification),
    SettingModel(icon: 'about_me', title: StringConstants.aboutMe),
    SettingModel(icon: 'shield_tick', title: StringConstants.termsAndCondition),
    SettingModel(icon: 'logout', title: StringConstants.signOut),
  ];

  void pickImage({required ImageSource imageSource}) async {
    try {
      final pickedImage = await picker.pickImage(
        source: imageSource,
        // maxWidth: imageMaxWidth,
        // maxHeight: imageMaxHeight,
        imageQuality: imageQuality,
      );

      if (pickedImage != null) {
        pickedImagePath.value = pickedImage.path;
        if (pickedImagePath.value.isNotEmpty) {
          updateManagerDetails();
        }
        // // DependencyInjection.userResponse.value.profileImage?.value =
        // //     pickedImagePath.value;
        // print(
        //     "pickedImagePath.value.....................${pickedImagePath.value}");
        // File imageFile = File(pickedImage.path);
        //
        // print('File path = ${pickedImage.path}');
        // print(
        //     'File size = ${(imageFile.lengthSync() / 1024).toStringAsFixed(2)} KB');
      } else {
        print('No image selected.');
        Get.snackbar(
          'Error',
          'No Image Selected.',
        );
      }
    } catch (ex) {
      print('Error ===> ${ex.toString()}');
    }
  }

  getSettingNotification() async {
    var res = await apiRepository.getSettingNotification();
    if (res != null) {
      settingNotificationResponse = res;
    }
    print("settingNotificationResponse============${res}");
  }

  updateSettingNotification(bool val) async {
    //print("reqVal========${val}");
    var res = await apiRepository.updateSettingNotification({"all": val});
    print("updateSettingNotification${res}");
  }

  void logOutUser() async {
    try {
      final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
      String? deviceId;
      if (Platform.isAndroid) {
        AndroidDeviceInfo androidDeviceInfo =
            await deviceInfoPlugin.androidInfo;
        deviceId = androidDeviceInfo.id;
        printInfo(info: 'deviceId123 ==> $deviceId');
      } else if (Platform.isIOS) {
        IosDeviceInfo iosDeviceInfo = await deviceInfoPlugin.iosInfo;
        deviceId = iosDeviceInfo.identifierForVendor;
      }

      printInfo(info: 'deviceId ==> $deviceId');
      if (deviceId != null) {
        var commonResponse = await apiRepository.logOut({'deviceId': deviceId});
        printInfo(info: 'commonResponse ==> ${commonResponse?.dioMessage}');
        if (commonResponse!.dioMessage!.contains('logout successfully')) {
          // final prefs = Get.find<SharedPreferences>();
          await prefs.clear();
          Get.offAllNamed(Routes.SIGN_IN);
        }
      }
    } catch (ex) {
      printInfo(info: 'error ==> ${ex.toString()}');
    }
  }

  getManagerDetails() async {
    var res = await apiRepository.getManagerDetails();
    if (res != null) {
      managerDetailsResponse.value = res;
      print(
          "managerDetailsResponse===========${managerDetailsResponse.value.profileImage}");
      aboutMeController.text = managerDetailsResponse.value.bio.toString();
    }
  }

  updateManagerDetails() async {
    final formData = FormData({
      'bio' : aboutMeController.text,
    });
    if (pickedImagePath.value.isNotEmpty) {
      print("pickedImagePath123============${pickedImagePath.value}");
      formData.files.add(
        MapEntry(
          'profileImage',
          MultipartFile(
            pickedImagePath.value,
            filename: 'document.png',
            contentType: 'image/png'
          ),
        ),
      );
    }
    var res = await apiRepository.updateUserDetail(formData);
    if (res != null && res.dioMessage != null) {
      Future.delayed(const Duration(seconds: 1), () {
        getManagerDetails();
      });

    }
  }

  @override
  void onInit() {
    getManagerDetails();
    super.onInit();
  }
}
