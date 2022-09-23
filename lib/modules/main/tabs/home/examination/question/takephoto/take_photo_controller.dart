import 'package:camera/camera.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class TakePhotoController extends GetxController{
  RxString imagePath = ''.obs;
  late CameraController cameraController;
  late Future<void> initializeControllerFuture;
  //late final CameraDescription camera;

  @override
  void onInit() {
    printInfo(info: 'onInit() start...');
    super.onInit();

    printInfo(info: 'onInit() end...');
  }

  init({required CameraDescription cameraDescription,required String photoPath}){
    // To display the current output from the Camera,
    // create a CameraController.
    cameraController = CameraController(
      // Get a specific camera from the list of available cameras.
      cameraDescription,
      // Define the resolution to use.
      ResolutionPreset.medium,
    );
   // print("CameraPermission789=========${Permission.camera.}");
    // Next, initialize the controller. This returns a Future.
    initializeControllerFuture = cameraController.initialize();

    imagePath.value = photoPath;

  }

  @override
  void onClose() {
    cameraController.dispose();
    super.onClose();
  }

}