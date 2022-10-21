import 'package:align_flutter_app/shared/utils/math_utils.dart';
import 'package:align_flutter_app/shared/widgets/base_elevated_button.dart';
import 'package:align_flutter_app/shared/widgets/base_text.dart';
import 'package:align_flutter_app/shared/widgets/common_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../shared/widgets/input_field.dart';
import '../setting_controller.dart';

class AboutMeView extends GetView<SettingController> {
  const AboutMeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: BaseAppBar(
        title: 'About Me',
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: getSize(24), vertical: getSize(40)),
        child: Column(
          children: [
            InputTextField(
              controller: controller.aboutMeController,
              hintText: 'Add about your self',
              textInputType: TextInputType.multiline,
              textInputAction: TextInputAction.done,
              maxLines: 12,
              minLines: 10,
              onChanged: (val){
              //  controller.managerDetailsResponse.value.bio = val;
              },
            ),
            Spacer(),
            BaseElevatedButton(
              width: Get.width,
              onPressed: () {
                //Get.back(result: "success");
               controller.updateManagerDetails();
              },
              child: BaseText(
                text: "Save",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
