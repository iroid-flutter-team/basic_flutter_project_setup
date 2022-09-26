import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../constants/string_constant.dart';
import '../widgets/base_text.dart';

class ImageChooserDialog {
  showImageChooserDialog({
    required VoidCallback takePhotoCallback,
    required VoidCallback selectPhotoCallback,
  }) {
    showCupertinoModalPopup<void>(
      context: Get.context!,
      builder: (BuildContext context) => CupertinoActionSheet(
        title: const BaseText(
          text: StringConstants.selectImage,
          textAlign: TextAlign.center,
        ),
        // message: const Text('Message'),
        actions: <CupertinoActionSheetAction>[
          CupertinoActionSheetAction(
            onPressed: takePhotoCallback,
            child: const BaseText(
              text: StringConstants.takePhoto,
            ),
            // onPressed: () {
            //   Get.back();
            //   controller.pickImage(imageSource: ImageSource.camera);
            // },
          ),
          CupertinoActionSheetAction(
            onPressed: selectPhotoCallback,
            child: const BaseText(
              text: StringConstants.galleryPhoto,
            ),
            // onPressed: () {
            //   Get.back();
            //   controller.pickImage(imageSource: ImageSource.gallery);
            // },
          ),
        ],
        cancelButton: CupertinoActionSheetAction(
          child: const BaseText(
            text: StringConstants.buttonCancel,
            fontSize: 18,
          ),
          onPressed: () {
            Get.back();
          },
        ),
      ),
    );
  }
}
