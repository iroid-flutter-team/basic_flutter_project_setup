import 'dart:io';
import 'package:align_flutter_app/modules/main/tabs/setting/setting_controller.dart';
import 'package:align_flutter_app/modules/main/tabs/setting/widget/common_list_tile.dart';
import 'package:align_flutter_app/shared/constants/png_image_constant.dart';
import 'package:align_flutter_app/shared/widgets/common_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../shared/constants/color_constants.dart';
import '../../../../shared/constants/string_constant.dart';
import '../../../../shared/dialog/sign_out.dart';
import '../../../../shared/utils/image_utils.dart';
import '../../../../shared/utils/math_utils.dart';
import '../../../../shared/widgets/base_text.dart';
import '../../../../shared/widgets/common_container_shadow.dart';

class SettingView extends GetView<SettingController> {
  const SettingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: BaseAppBar(
          title: "Setting",
          leading: Container(),
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: _buildMainBody(),
        ));
  }

  _buildMainBody() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getSize(20)),
      child: Column(
        children: [
          _buildProfileView(),
          SizedBox(
            height: getSize(20),
          ),
          BaseText(
            text: "Albert Flores",
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
          SizedBox(
            height: getSize(8),
          ),
          RatingBar.builder(
            itemSize: getSize(16),
            initialRating: 5,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            glow: false,
            itemBuilder: (context, _) =>
                Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
            onRatingUpdate: (rating) {
              print(rating);
            },
          ),
          SizedBox(
            height: getSize(40),
          ),
          _buildListView(),
        ],
      ),
    );
  }

  _buildProfileView() {
    return Container(
      margin: EdgeInsets.only(top: getSize(20.0)),
      width: double.maxFinite,
      //color: Colors.pink[50],
      //height: 200,
      child: Center(
        child: Stack(
          children: [
            Obx(() {
             // print("controller.pickedImagePath.value ==============${controller.pickedImagePath.value}");
              return CircleAvatar(
                radius: 70,
                child: controller.pickedImagePath.isEmpty ? Image.asset(PngImageConstants.bez):Image.file(
                  File(controller.pickedImagePath.value),
                  fit: BoxFit.cover,
                ),
              );
            }),
            Positioned(
              child: _buildEditButton(),
              bottom: 0,
              right: 0,
            ),
          ],
        ),
      ),
    );
  }

  _buildEditButton() {
    return GestureDetector(
      onTap: () async {
        showImageChooserDialog();
      },
      child: CommonContainerWithShadow(
        height: getSize(40),
        width: getSize(40),
        cornerRadius: 20,
        child: Padding(
          padding: EdgeInsets.all(
            getSize(10.0),
          ),
          child: SvgPicture.asset(
            getAssetsSVGImg('edit'),
          ),
        ),
      ),
    );
  }

  _buildListView() {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: controller.settingList.length,
      itemBuilder: (BuildContext context, int index) {
        return CommonListTitle(
          title: controller.settingList[index].title,
          leadingIcon: controller.settingList[index].icon,
          trailing: getTrailing(index),
          onTap: index == 0
              ? null
              : () {
            _navigateScreen(index);
          },
        );
      },
    );
  }

  getTrailing(int index) {
    if (index == 0) {
      return SizedBox(
        width: getSize(60.0),
        child: Obx(
              () {
            return _buildSwitch();
          },
        ),
      );
    } else if (index == 3) {
      return BaseText(
        text: "V1.0",
        fontSize: 14,
        textColor: ColorConstants.white.withOpacity(0.5),
      );
    }
    return null;
  }

  _navigateScreen(int index) {
    switch (index) {
      case 0:
        break;
      case 1:
        break;
      case 2:
        break;
      case 3:
        _showSignOutDialog();
        break;
    }
  }

  _buildSwitch() {
    return FlutterSwitch(
      inactiveColor: ColorConstants.switchBlack.withOpacity(0.3),
      activeColor: ColorConstants.circleBlue,
      width: getSize(60.0),
      height: getSize(30.0),
      toggleSize: getSize(30.0),
      value: controller.switchValue.value,
      borderRadius: getSize(30.0),
      padding: 1.2,
      onToggle: (val) {
        controller.switchValue.value = val;
        print("toggle--------${val}");
      },
    );
  }

  showImageChooserDialog() {
    showCupertinoModalPopup<void>(
      context: Get.context!,
      builder: (BuildContext context) =>
          CupertinoActionSheet(
            // title: const BaseText(
            //   text: "",
            //   textAlign: TextAlign.center,
            // ),
            // message: const Text('Message'),
            actions: <CupertinoActionSheetAction>[
              CupertinoActionSheetAction(
                child: const BaseText(
                  text: StringConstants.takePhoto,
                ),
                onPressed: () {
                  Get.back();
                  controller.pickImage(imageSource: ImageSource.camera);
                },
              ),
              CupertinoActionSheetAction(
                child: const BaseText(
                  text: StringConstants.galleryPhoto,
                ),
                onPressed: () {
                  Get.back();
                  controller.pickImage(imageSource: ImageSource.gallery);
                },
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

  _showSignOutDialog() {
    showDialog(
      barrierColor: Colors.black26,
      context: Get.context!,
      builder: (context) {
        return CustomAlertDialog(
          title: StringConstants.signOutAlertMessage,
          cancelCallBack: () {
            Get.back();
          },
          signOutCallBack: () {
            Get.back();
            // Get.offAll(
            //   SignInWithEmailScreen(),
            //   binding: SignInWithEmailBindings(),
            // );
          },
        );
      },
    );
  }
}
