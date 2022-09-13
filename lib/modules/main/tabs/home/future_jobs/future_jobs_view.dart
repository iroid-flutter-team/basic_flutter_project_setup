import 'package:align_flutter_app/shared/constants/color_constants.dart';
import 'package:align_flutter_app/shared/constants/png_image_constant.dart';
import 'package:align_flutter_app/shared/utils/math_utils.dart';
import 'package:align_flutter_app/shared/widgets/base_elevated_button.dart';
import 'package:align_flutter_app/shared/widgets/base_text.dart';
import 'package:align_flutter_app/shared/widgets/common_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FutureJobsView extends StatelessWidget {
  const FutureJobsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: "Future jobs",
      ),
      body: _buildMainBody(),
    );
  }

  _buildMainBody() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(),
          Image.asset(
            PngImageConstants.futureJobs,
            height: getSize(146),
          ),
          SizedBox(
            height: getSize(50),
          ),
          BaseText(
            text: "All done! The future is yours.",
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
          SizedBox(
            height: getSize(14),
          ),
          BaseText(
            textAlign: TextAlign.center,
            text:
                "More jobs for you will be shown here as they are\nadded, so check back soon",
            fontSize: 12,
            textColor: ColorConstants.white.withOpacity(0.6),
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: getSize(30)),
            child: BaseElevatedButton(
              width: Get.width,
              onPressed: () {},
              child: BaseText(
                text: "Go to dashboard",
              ),
            ),
          ),
          SizedBox(
            height: getSize(40),
          ),
        ],
      ),
    );
  }
}
