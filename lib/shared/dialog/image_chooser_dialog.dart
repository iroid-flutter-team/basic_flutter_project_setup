import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../constants/string_constant.dart';
import '../utils/focus.dart';
import '../widgets/base_text.dart';

class ImageChooserDialog {
  showImageChooserDialog({
    required VoidCallback takePhotoCallback,
    required VoidCallback selectPhotoCallback,
  }) {
    showCupertinoModalPopup<void>(
      context: Get.context!,
      builder: (BuildContext context) => CupertinoActionSheet(
        actions: <CupertinoActionSheetAction>[
          CupertinoActionSheetAction(
            onPressed: takePhotoCallback,
            child: const BaseText(
              text: StringConstants.takePhoto,
            ),
          ),
          CupertinoActionSheetAction(
            onPressed: selectPhotoCallback,
            child: const BaseText(
              text: StringConstants.galleryPhoto,
            ),
          ),
        ],
        cancelButton: CupertinoActionSheetAction(
          child: const BaseText(
            text: StringConstants.buttonCancel,
            fontSize: 18,
          ),
          onPressed: () {
            Get.back();
            AppFocus.unFocus();
          },
        ),
      ),
    );
  }
}
