import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grape_vender_app/shared/constants/color_constants.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import '../widgets/base_text.dart';
import 'math_utils.dart';

class ImagePickerUtils {
  final picker = ImagePicker();
  final int imageQuality = 50;
  bool cameraPermissionPermanentlyDenied = false;
  bool galleryPermissionPermanentlyDenied = false;
  Future<String?> pickImage({required ImageSource imageSource}) async {
    try {
      XFile? pickedImage;
      CroppedFile? cropped;

      if (imageSource == ImageSource.gallery) {
        var permission = await checkAndRequestStoragePermissions();
        print(permission);
        if (permission) {
          pickedImage = await picker.pickImage(
            source: imageSource,
            // maxWidth: imageMaxWidth,
            // maxHeight: imageMaxHeight,
            imageQuality: imageQuality,
          );
        } else {
          if (galleryPermissionPermanentlyDenied) {
            _showPermissionAlertDialog(imageSource: imageSource);
          }
        }
      } else if (imageSource == ImageSource.camera) {
        var permission = await checkAndRequestCameraPermissions();
        print(permission);
        if (permission) {
          pickedImage = await picker.pickImage(
            source: imageSource,
            // maxWidth: imageMaxWidth,
            // maxHeight: imageMaxHeight,
            imageQuality: imageQuality,
          );
        } else {
          if (cameraPermissionPermanentlyDenied) {
            _showPermissionAlertDialog(imageSource: imageSource);
          }
        }
      }

      if (pickedImage != null) {
        //profileImagePath.value = pickedImage.path;
        //UserMoreInfo.userInfoModel.document = profileImagePath.value;
        final croppedFile = await ImageCropper().cropImage(
          sourcePath: pickedImage.path,
          compressFormat: ImageCompressFormat.jpg,
          compressQuality: 100,
          uiSettings: [
            AndroidUiSettings(
              toolbarTitle: 'Enhance Your Image',
              toolbarColor: ColorConstants.primary,
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.square,
              lockAspectRatio: false,
              aspectRatioPresets:
                  Platform.isAndroid
                      ? [
                        CropAspectRatioPreset.square,
                        CropAspectRatioPreset.ratio3x2,
                        CropAspectRatioPreset.original,
                        CropAspectRatioPreset.ratio4x3,
                        CropAspectRatioPreset.ratio16x9,
                      ]
                      : [
                        CropAspectRatioPreset.original,
                        CropAspectRatioPreset.square,
                        CropAspectRatioPreset.ratio3x2,
                        CropAspectRatioPreset.ratio4x3,
                        CropAspectRatioPreset.ratio5x3,
                        CropAspectRatioPreset.ratio5x4,
                        CropAspectRatioPreset.ratio7x5,
                        CropAspectRatioPreset.ratio16x9,
                      ],
            ),
            IOSUiSettings(
              title: 'Enhance Your Image',
              aspectRatioPresets: [
                CropAspectRatioPreset.original,
                CropAspectRatioPreset.square,
                CropAspectRatioPreset.ratio4x3,
              ],
            ),
          ],
        );

        if (croppedFile != null) {
          cropped = croppedFile;
        }
        /*File imageFile = File(pickedImage.path);

        print('File path = ${pickedImage.path}');
        print('File size = ${(imageFile.lengthSync() / 1024).toStringAsFixed(2)} KB');*/
      }

      return cropped?.path;
    } catch (ex) {
      print('Error ===> ${ex.toString()}');
      return null;
    }
  }

  Future<bool> checkAndRequestCameraPermissions() async {
    PermissionStatus permission = await Permission.camera.status;

    if (permission != PermissionStatus.granted) {
      var permissionStatus = await Permission.camera.request();
      if (permissionStatus.isGranted) {
        return true;
      } else if (permissionStatus.isPermanentlyDenied) {
        cameraPermissionPermanentlyDenied = true;
        return false;
      } else {
        return false;
      }
    } else if (permission == PermissionStatus.permanentlyDenied) {
      cameraPermissionPermanentlyDenied = true;
      return false;
    } else {
      return true;
    }
  }

  Future<bool> checkAndRequestStoragePermissions() async {
    if (Platform.isAndroid) {
      DeviceInfoPlugin plugin = DeviceInfoPlugin();
      AndroidDeviceInfo android = await plugin.androidInfo;
      if (android.version.sdkInt >= 33) {
        var videosPermissionStatus = await Permission.videos.status;
        var photoPermissionStatus = await Permission.photos.status;
        printInfo(
          info: 'permission : $videosPermissionStatus $photoPermissionStatus',
        );
        if (photoPermissionStatus != PermissionStatus.granted) {
          var permissionStatusPhoto = await Permission.photos.request();

          printInfo(info: 'permissionStatusPhoto : $permissionStatusPhoto');
          if (permissionStatusPhoto.isGranted) {
            return true;
          } else if (permissionStatusPhoto.isPermanentlyDenied) {
            galleryPermissionPermanentlyDenied = true;
            return false;
          } else {
            return false;
          }
        } else if (photoPermissionStatus ==
            PermissionStatus.permanentlyDenied) {
          galleryPermissionPermanentlyDenied = true;
          return false;
        } else {
          return true;
        }
      } else {
        PermissionStatus permission = await Permission.storage.status;
        printInfo(info: 'permission : $permission');
        if (permission != PermissionStatus.granted) {
          var permissionStatus = await Permission.storage.request();
          if (permissionStatus.isGranted) {
            return true;
          } else if (permissionStatus.isPermanentlyDenied) {
            galleryPermissionPermanentlyDenied = true;
            return false;
          } else {
            return false;
          }
        } else if (permission == PermissionStatus.permanentlyDenied) {
          galleryPermissionPermanentlyDenied = true;
          return false;
        } else {
          return true;
        }
      }
    } else {
      PermissionStatus permission = await Permission.photos.status;
      printInfo(info: 'permission : $permission');
      if (permission != PermissionStatus.granted) {
        var permissionStatus = await Permission.photos.request();
        if (permissionStatus.isGranted) {
          return true;
        } else if (permissionStatus.isPermanentlyDenied) {
          galleryPermissionPermanentlyDenied = true;
          return false;
        } else {
          return false;
        }
      } else if (permission == PermissionStatus.permanentlyDenied) {
        galleryPermissionPermanentlyDenied = true;
        return false;
      } else {
        return true;
      }
    }
  }

  Future<void> _showPermissionAlertDialog({
    required ImageSource imageSource,
  }) async {
    return Future.delayed(Duration(seconds: 1), () {
      showDialog<void>(
        context: Get.context!,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            shape: SmoothRectangleBorder(
              borderRadius: SmoothBorderRadius.all(
                SmoothRadius(cornerRadius: getSize(20), cornerSmoothing: 1),
              ),
            ),
            title: BaseText(
              text: 'Permission Denied!',
              fontWeight: FontWeight.w600,
              textColor: ColorConstants.black,
            ),
            content:
                imageSource == ImageSource.gallery
                    ? Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BaseText(
                          text:
                              Platform.isIOS
                                  ? 'Unable to access Photos. Grant access by going to Settings > Spinning > Photos, then select the access level and try again:'
                                  : 'Unable to access Gallery. Grant access by going to Settings > Apps > Spinning > Permissions, then allow access to Storage and try again:',
                          textAlign: TextAlign.center,
                          textColor: ColorConstants.black,
                        ),
                        SizedBox(height: getSize(20)),
                        Row(
                          children: [
                            Icon(Icons.photo),
                            SizedBox(width: getSize(10)),
                            BaseText(
                              text: Platform.isIOS ? 'Photos' : 'Storage',
                              fontWeight: FontWeight.w500,
                              textColor: ColorConstants.black,
                            ),
                          ],
                        ),
                      ],
                    )
                    : Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BaseText(
                          text:
                              Platform.isIOS
                                  ? 'Unable to access Camera. Grant access by going to Settings > Spinning> Camera, then allow access to Camera and try again: '
                                  : 'Unable to access Camera. Grant access by going to Settings > Apps > Spinning> Permissions, then allow access to Camera and try again:',
                          textAlign: TextAlign.center,
                          textColor: ColorConstants.black,
                        ),
                        SizedBox(height: getSize(20)),
                        Row(
                          children: [
                            Icon(Icons.camera_alt_outlined),
                            SizedBox(width: getSize(10)),
                            BaseText(
                              text: 'Camera',
                              fontWeight: FontWeight.w500,
                              textColor: ColorConstants.black,
                            ),
                          ],
                        ),
                      ],
                    ),
            actions: <Widget>[
              TextButton(
                child: BaseText(
                  text: 'Cancel',
                  fontWeight: FontWeight.w600,
                  textColor: Colors.blueAccent,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: BaseText(
                  text: 'Open Settings',
                  fontWeight: FontWeight.w600,
                  textColor: Colors.blueAccent,
                ),
                onPressed: () {
                  openAppSettings();
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    });
  }
}
