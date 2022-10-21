import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../../../../shared/constants/color_constants.dart';
import '../../../../../../../shared/utils/image_utils.dart';
import '../../../../../../../shared/utils/math_utils.dart';
import '../../../../../../../shared/widgets/base_text.dart';
import '../../../../../../../shared/widgets/common_container_shadow.dart';
import '../card_animation/infinite_card_view.dart';
import '../card_animation/infinite_cards_controller.dart';
import '../model/question_model.dart';
import '../question_controller.dart';
import '../takephoto/take_photo_binding.dart';
import '../takephoto/take_photo_view.dart';
import '../viewphoto/view_photo.dart';

class AnimatedCard extends GetView<QuestionController> {
  final QuestionModel questionModel;
  const AnimatedCard({Key? key, required this.questionModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    InfiniteCardsController? infiniteCardsController;
    return Obx(() {
      printInfo(info: 'build() called...');
      return _buildAnimationSlider(
          questionModel.localImagePathList.length, infiniteCardsController);
    });
  }

  _buildAnimationSlider(
      int imageCount, InfiniteCardsController? infiniteCardsController) {
    infiniteCardsController = InfiniteCardsController(
      itemCount: _getItemCount(),
      itemBuilder: (BuildContext context, int index) {
        return questionModel.questionSubmitted
            ? _buildNetworkPhotoView(index, infiniteCardsController)
            : questionModel.localImagePathList.isEmpty
            ? _buildTakePhotoView1()
            : _buildTakePhotoView2(
            imagePath: questionModel.localImagePathList[index],
            index: index,
            infiniteCardsController: infiniteCardsController!);
      },
      animType: AnimType.SWITCH,
    );

    GlobalKey<State> key = GlobalKey();

    InfiniteCards infiniteCards = InfiniteCards(
      key: key,
      //width: Get.width,
      height: getSize(140),
      controller: infiniteCardsController,
    );

    return infiniteCards;
  }

  int _getItemCount() {
    int totalItem = 0;

    if (questionModel.questionSubmitted) {
      totalItem = questionModel.imagePathList.length;
    } else {
      totalItem = questionModel.localImagePathList.isEmpty
          ? 1
          : questionModel.localImagePathList.length;
    }

    return totalItem;
  }

  Widget _buildNetworkPhotoView(
      int index, InfiniteCardsController? infiniteCardsController) {
    return CommonContainerWithShadow(
      width: double.maxFinite,
      child: GestureDetector(
        onTap: () {
          Get.to(
            ViewPhotoScreen(
              networkImagePath: questionModel.imagePathList[index],
            ),
          );
        },
        onPanUpdate: (details) {
          if (details.delta.dy > 0 && infiniteCardsController!.itemCount > 1) {
            infiniteCardsController.reset(animType: AnimType.TO_END);
            infiniteCardsController.next();
          }
        },
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(
                questionModel.imagePathList[index],
              ),
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(
                getSize(14),
              ),
            ),
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  _buildTakePhotoView1() {
    return GestureDetector(
      onTap: () {
        //_openCameraScreen(imagePath: '');
      },
      child: CommonContainerWithShadow(
        width: Get.width,
        height: getSize(140),
        child: Center(
          child: BaseText(text: 'View Photo',),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     SvgPicture.asset(
          //       getAssetsSVGImg('add_photo'),
          //     ),
          //     SizedBox(
          //       width: getSize(10.0),
          //     ),
          //     BaseText(text: 'Take Photo'),
          //   ],
          // ),
        ),
      ),
    );
  }

  _buildTakePhotoView2(
      {required String imagePath,
        required int index,
        required InfiniteCardsController infiniteCardsController}) {
    printInfo(info: 'imagePath = $imagePath');

    return GestureDetector(
      onTap: () {
        _openCameraScreen(imagePath: imagePath, index: index);
      },
      onPanUpdate: (details) {
        if (details.delta.dy > 0 && infiniteCardsController.itemCount > 1) {
          infiniteCardsController.reset(animType: AnimType.TO_END);
          infiniteCardsController.next();
        }
      },
      child: CommonContainerWithShadow(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(
            getSize(14.0),
          ),
          child: Stack(
            children: <Widget>[
              Image.file(
                File(imagePath),
                fit: BoxFit.fill,
                width: Get.width,
                height: getSize(140),
              ),
              questionModel.localImagePathList.length < 3
                  ? Container(
                height: getSize(140),
                width: Get.size.width,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      ColorConstants.darkContainerBlack.withOpacity(0),
                      ColorConstants.darkContainerBlack.withOpacity(0.8),
                    ],
                  ),
                ),
              )
                  : Container(),
              questionModel.localImagePathList.length < 3
                  ? Positioned(
                bottom: getSize(12),
                right: getSize(12),
                child: GestureDetector(
                  onTap: () {
                    _openCameraScreen(imagePath: '');
                  },
                  child: SvgPicture.asset(
                    getAssetsSVGImg('add_photo'),
                  ),
                ),
              )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }

  _openCameraScreen({required String imagePath, int index = 0}) async {
    printInfo(info: 'imagePath = $imagePath');

    final cameras = await availableCameras();

    //Get.to(TakePhotoView(camera: cameras.first),binding: TakePhotoBinding());

    var result = await Get.to(
      TakePhotoView(
        cameraDescription: cameras.first,
        photoPath: imagePath,
      ),
      binding: TakePhotoBinding(),

      // TakePictureScreen(
      //   camera: cameras.first,
      //   imagePath: imagePath,
      // ),
    );

    printInfo(info: 'result ===> $result');

    try {
      if (result != null) {
        if (result['action'] == 'ADD') {
          printInfo(info: 'photoPath = ${result['imagePath']}');

          //controller.addImagePath(imagePath: photoPath);

          if (imagePath.isEmpty) {
            questionModel.localImagePathList.insert(0, result['imagePath']);
          } else {
            questionModel.localImagePathList.isNotEmpty
                ? questionModel.localImagePathList
                .removeAt(index) //removes the item at index
                : null;
            questionModel.localImagePathList.insert(
              index,
              result['imagePath'],
            );
          }
        } else if (result['action'] == 'DELETE') {
          questionModel.localImagePathList.isNotEmpty
              ? questionModel.localImagePathList
              .removeAt(index) //removes the item at index
              : null;
        }
      }
    } catch (e) {
      printInfo(info: e.toString());
    }
  }
}

