import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:home_yogi_flutter/modules/auth/login/sign_in_with_email/sign_in_with_email.dart';
import 'package:home_yogi_flutter/modules/auth/login/sign_in_with_email/sign_in_with_email_binding.dart';

import 'package:home_yogi_flutter/modules/main/tabs/setting/setting_controller.dart';
import 'package:home_yogi_flutter/modules/main/tabs/setting/widget/common_list_tile.dart';
import 'package:home_yogi_flutter/shared/constants/colors.dart';
import 'package:home_yogi_flutter/shared/constants/string_constant.dart';
import 'package:home_yogi_flutter/shared/dialog/sign_out.dart';
import 'package:home_yogi_flutter/shared/utils/math_utils.dart';
import 'package:home_yogi_flutter/shared/widgets/base_text.dart';
import 'package:home_yogi_flutter/shared/widgets/common_app_bar.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../di.dart';
import '../../../../routes/app_pages.dart';
import '../../../../shared/constants/string_constant.dart';
import '../../../../shared/widgets/circle_progress_indicator.dart';
import 'edit_profile/edit_profile_controller.dart';

class SettingView extends GetView<SettingController> {
  const SettingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: StringConstants.titleSettings,
        leading: Container(),
      ),
      body: SmartRefresher(
        physics: BouncingScrollPhysics(),
        controller: controller.refreshController,
        onRefresh: () {
          controller.getSettingNotification();
          controller.refreshController.refreshCompleted();
        },
        child: SingleChildScrollView(
          child: _buildMainBody(),
          physics: BouncingScrollPhysics(),
        ),
      ),
    );
  }

  _buildMainBody() {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: getSize(20.0),
        vertical: getSize(0.0),
      ),
      child: Column(
        children: [
          SizedBox(
            height: getSize(20.0),
          ),
          _buildProfileView(),
          SizedBox(
            height: getSize(40.0),
          ),
          _buildListView(),
        ],
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
            controller.logOutUser();
            // Get.offAll(
            //   SignInWithEmailScreen(),
            //   binding: SignInWithEmailBindings(),
            // );
          },
        );
      },
    );
  }

  _buildListView() {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: controller.settingList.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: EdgeInsets.only(bottom: 8.0),
          child: CommonListTitle(
            title: controller.settingList[index].title,
            leadingIcon: controller.settingList[index].icon,
            trailing: getTrailing(index),
            onTap: index == 0
                ? null
                : () {
              _navigateScreen(index);
            },
          ),
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
    } else if (index == 5) {
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
        Get.toNamed(Routes.PLAN_AND_BILLING);
        break;

      case 2:
        Get.toNamed(Routes.REFER_AND_EARN);
        break;

      case 3:
        Get.toNamed(Routes.VOICE_ASSISTANTS);
        break;

      case 4:
        Get.toNamed(Routes.TERMS_CONDITION);
        break;

      case 5:
        _showSignOutDialog();
        break;
    }
  }

  _buildProfileView() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getSize(15.0),
      ),
      child: Row(
        children: <Widget>[
          BaseCircleProgressIndicator(
            radius: 30,
            lineWidth: 4.5,
            percent: 0.75,
            //imagePath: controller.editProfileController.pickedImagePath.value,
            // imageUrl: DependencyInjection.userResponse.profileImage?.value,
            // imagePath: DependencyInjection.userResponse.profileImage != null
            //     ? DependencyInjection.userResponse.profileImage
            //     : controller
            //             .editProfileController.pickedImagePath.value.isNotEmpty
            //         ? controller.editProfileController.pickedImagePath.value
            //         : '',
            //imageUrl: DenpendencyInjection.userResponse.profileImage
          ),
          SizedBox(
            width: getSize(15),
          ),
          Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Obx(() {
                return BaseText(
                  text: DependencyInjection.userResponse.value.fullname.toString(),
                  textColor: ColorConstants.white.withOpacity(0.94),
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                );
              }),
              SizedBox(
                height: getSize(5.0),
              ),
              InkWell(
                onTap: () {
                  Get.toNamed(Routes.EDIT_PROFILE);
                  var data = Get.put(
                      EditProfileController(
                          repository: controller.repository));
                  data.getUsers();
                  //controller.getUsersData();
                },
                child: BaseText(
                  text: StringConstants.editProfile,
                  textColor: ColorConstants.white.withOpacity(0.8),
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: Colors.white.withOpacity(0.8),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),

    );
  }

  _buildSwitch() {
    /*   return CupertinoSwitch(
        value: controller.switchValue.value,
        onChanged: (val){
          controller.switchValue.value = val;
        },
    );*/

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
        controller.updateSettingNotification(val);
        print("toggle--------${val}");
      },
    );
  }
}
