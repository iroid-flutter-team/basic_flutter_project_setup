import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:grape_vender_app/shared/constants/color_constants.dart';
import 'package:grape_vender_app/shared/constants/font_constants.dart';
import '../constants/string_constant.dart';
import '../widgets/base_text.dart';

class ImageChooserDialog {
  showImageChooserDialog({
    required VoidCallback takePhotoCallback,
    required VoidCallback selectPhotoCallback,
  }) {
    showCupertinoModalPopup<void>(
      barrierColor: ColorConstants.black.withOpacity(0.8),
      context: Get.context!,
      builder:
          (BuildContext context) => CupertinoActionSheet(
            title: BaseText(
              text: StringConstants.selectImage,
              textAlign: TextAlign.center,
              textColor: ColorConstants.black,
              fontFamily: FontConstants.ALATA,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
            actions: <CupertinoActionSheetAction>[
              CupertinoActionSheetAction(
                onPressed: takePhotoCallback,
                child: BaseText(
                  text: StringConstants.takePhoto,
                  textColor: ColorConstants.black,
                ),
                // onPressed: () {
                //   Get.back();
                //   controller.pickImage(imageSource: ImageSource.camera);
                // },
              ),
              CupertinoActionSheetAction(
                onPressed: selectPhotoCallback,
                child: BaseText(
                  text: StringConstants.galleryPhoto,
                  textColor: ColorConstants.black,
                ),
                // onPressed: () {
                //   Get.back();
                //   controller.pickImage(imageSource: ImageSource.gallery);
                // },
              ),
            ],
            cancelButton: CupertinoActionSheetAction(
              child: BaseText(
                text: StringConstants.buttonCancel,
                fontSize: 18,
                textColor: ColorConstants.black,
              ),
              onPressed: () {
                Get.back();
              },
            ),
          ),
    );
  }
}
