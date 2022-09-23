import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:home_yogi_flutter/modules/main/tabs/home/examination/question/takephoto/take_photo_controller.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../../../../../shared/utils/math_utils.dart';
import '../../../../../../../shared/widgets/common_app_bar.dart';
import '../../../../../../../shared/widgets/common_container_shadow.dart';

class TakePhotoView extends GetView<TakePhotoController> {
  const TakePhotoView({
    Key? key,
    required this.cameraDescription,
    required this.photoPath,
  }) : super(key: key);

  final CameraDescription cameraDescription;
  final String photoPath;

  @override
  Widget build(BuildContext context) {
    controller.init(cameraDescription: cameraDescription, photoPath: photoPath);
    return Scaffold(
      appBar: BaseAppBar(
        title: '',
        actions: [
          getActionIcon(),
        ],
      ),
      // You must wait until the controller is initialized before displaying the
      // camera preview. Use a FutureBuilder to display a loading spinner until the
      // controller has finished initializing.
      body: _buildMainBody(),
    );
  }

  getActionIcon() {
    return photoPath.isNotEmpty
        ? IconButton(
        icon: SvgPicture.asset(
          getAssetsSVGImg('trash'),
        ),
        onPressed: () {
          Get.back(result: {'action': 'DELETE'});
        })
        : Container();
  }

  _buildMainBody() {
    return Obx(() {
      print("imagepath ========${controller.imagePath}");
      return Column(
        children: [
          Expanded(
            flex: 6,
            child: controller.imagePath.isEmpty
                ? _buildCameraPreview()
                : _buildImageView(),
          ),

          Visibility(
            visible: photoPath.isEmpty,
            child: Expanded(
              flex: 1,
              child: Container(
                //child: _buildRetakeDoneView(),
                child: controller.imagePath.isEmpty
                    ? _buildCapturePhotoView()
                    : _buildRetakeDoneView(),
              ),
            ),
          ),
        ],
      );
    });
  }

  _buildCameraPreview() {
    return FutureBuilder<void>(
      future: controller.initializeControllerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          // If the Future is complete, display the preview.
          return CameraPreview(controller.cameraController);
        } else {
          // Otherwise, display a loading indicator.
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  _buildImageView() {
    return Image.file(
      File(controller.imagePath.value),
      fit: BoxFit.fill,
    );
  }

  _buildCapturePhotoView() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          // Provide an onPressed callback.
          onTap: () async {
            // Take the Picture in a try / catch block. If anything goes wrong,
            // catch the error.
            try {
              // Ensure that the camera is initialized.
              await controller.initializeControllerFuture;

              // Attempt to take a picture and get the file `image`
              // where it was saved.
              final image = await controller.cameraController.takePicture();

              //controller.cameraController.dispose();
              controller.imagePath.value = image.path;


            } catch (e) {
              // If an error occurs, log the error to the console.
              print(e);
            }
          },

          child: SvgPicture.asset(
            getAssetsSVGImg('photo_capture'),
          ),
        ),
      ],
    );
  }

  _buildRetakeDoneView() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            controller.imagePath.value = '';
            controller.init(cameraDescription: cameraDescription, photoPath: photoPath);
           // controller.init(cameraDescription: cameraDescription, photoPath: '');
          },
          child: CommonContainerWithShadow(
            height: getSize(50),
            width: getSize(50),
            cornerRadius: 25,
            child: Padding(
              padding: EdgeInsets.all(
                getSize(10.0),
              ),
              child: SvgPicture.asset(
                getAssetsSVGImg('photo_retake'),
              ),
            ),
          ),
        ),
        SizedBox(
          width: getSize(30.0),
        ),
        GestureDetector(
          onTap: () {
            Get.back(result: {
              'action': 'ADD',
              'imagePath': controller.imagePath.value
            });
          },
          child: CommonContainerWithShadow(
            height: getSize(50),
            width: getSize(50),
            cornerRadius: 25,
            child: Padding(
              padding: EdgeInsets.all(
                getSize(10.0),
              ),
              child: SvgPicture.asset(
                getAssetsSVGImg('photo_done'),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
