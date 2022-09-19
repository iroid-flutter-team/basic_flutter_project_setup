import 'dart:io';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../api/api_repository.dart';
import '../../../../shared/constants/string_constant.dart';
import 'model/setting_model.dart';


class SettingController extends GetxController{
  final ApiRepository apiRepository;
  SettingController({required this.apiRepository});

  RxBool switchValue = false.obs;
  final picker = ImagePicker();
  final double imageMaxWidth = Get.width;
  final double imageMaxHeight = Get.height;
  final int imageQuality = 50;
  var locationValue = ''.obs;
  var pickedImagePath = ''.obs;

  List<SettingModel> settingList = [
    SettingModel(icon: 'notification_bing',  title: StringConstants.pushNotification),
    SettingModel(icon: 'about_me',    title: StringConstants.aboutMe),
    SettingModel(icon: 'shield_tick',  title: StringConstants.termsAndCondition),
    SettingModel(icon: 'logout',   title: StringConstants.signOut),
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
        //pickedImageFile?.value = File(pickedImage.path) ;
        pickedImagePath.value = pickedImage.path;
        // DependencyInjection.userResponse.value.profileImage?.value =
        //     pickedImagePath.value;
        print(
            "pickedImagePath.value.....................${pickedImagePath.value}");
        File imageFile = File(pickedImage.path);

        print('File path = ${pickedImage.path}');
        print(
            'File size = ${(imageFile.lengthSync() / 1024).toStringAsFixed(2)} KB');
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

}