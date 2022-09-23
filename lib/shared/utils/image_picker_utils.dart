import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import '../dialog/camera_gallery_permission_dialog.dart';
import '../dialog/microphone_permission_dialog.dart';
import '../widgets/base_text.dart';
import 'math_utils.dart';

class ImagePickerUtils {
  final ImagePicker imagePicker = ImagePicker();
  final int imageQuality = 30;
  static const String TAG = 'ImagePickerUtils';

  Future<String?> pickImage({required ImageSource imageSource}) async {
    try {
      XFile? pickedImage;

      if(imageSource == ImageSource.camera){
        pickedImage = await pickCameraImage();
      }else if(imageSource == ImageSource.gallery){
        pickedImage = await pickGalleryImage();
      }

      if (pickedImage != null) {
        File imageFile = File(pickedImage.path);

        print('$TAG : Image file path ===>${pickedImage.path}');
        print('$TAG : Image file size ===>${(imageFile.lengthSync() / 1024).toStringAsFixed(2)} KB');
        return pickedImage.path;
      }

      return null;
    } catch (ex) {
      print('$TAG Exception ===> ${ex.toString()}');
      return null;
    }
  }

  Future<XFile?> pickCameraImage() async {
    XFile? pickedImage;

    bool isCameraPermissionGranted = await checkCameraPermission();

    if(isCameraPermissionGranted){
      pickedImage = await imagePicker.pickImage(
        source: ImageSource.camera,
        imageQuality: imageQuality,
      );
    }

    return pickedImage;
  }

  Future<XFile?> pickGalleryImage() async {
    XFile? pickedImage;

    bool isStoragePermissionGranted = await checkStoragePermission();
    if(isStoragePermissionGranted){
      pickedImage = await imagePicker.pickImage(
        source: ImageSource.gallery,
        imageQuality: imageQuality,
      );
    }

    return pickedImage;
  }

  Future<bool> checkCameraPermission() async {

    PermissionStatus permissionStatus = await Permission.camera.status;

    print('$TAG : camera permissionStatus ==> $permissionStatus');

    if (permissionStatus.isGranted) {
      return true;
    } else if (permissionStatus.isDenied) {
      PermissionStatus reqPermissionStatus = await Permission.camera.request();
      print('$TAG : camera reqPermissionStatus ==> $permissionStatus');
      if (reqPermissionStatus.isGranted) {
        return true;
      } else if (reqPermissionStatus.isPermanentlyDenied) {
        CameraGalleryPermissionDialog.show(imageSource: ImageSource.camera);
      }
    }

    return false;
  }

  Future<bool> checkStoragePermission() async {
    PermissionStatus permissionStatus = await Permission.storage.status;

    print('$TAG : storage permissionStatus ==> $permissionStatus');

    if (permissionStatus.isGranted) {
      return true;
    } else if (permissionStatus.isDenied) {
      PermissionStatus reqPermissionStatus = await Permission.storage.request();
      print('$TAG : storage reqPermissionStatus ==> $permissionStatus');
      if (reqPermissionStatus.isGranted) {
       return true;
      } else if (reqPermissionStatus.isPermanentlyDenied) {
        CameraGalleryPermissionDialog.show(imageSource: ImageSource.gallery);
      }
    }
    return false;
  }

  Future<bool> checkMicrophonePermission() async {

    PermissionStatus permissionStatus = await Permission.microphone.status;

    print('$TAG : microphone permissionStatus ==> $permissionStatus');

    if (permissionStatus.isGranted) {
      return true;
    } else if (permissionStatus.isDenied) {
      PermissionStatus reqPermissionStatus = await Permission.microphone.request();
      print('$TAG : microphone reqPermissionStatus ==> $permissionStatus');
      if (reqPermissionStatus.isGranted) {
        return true;
      } else if (reqPermissionStatus.isPermanentlyDenied) {
        MicrophonePermissionDialog.show();
      }
    }
    return false;
  }

}

