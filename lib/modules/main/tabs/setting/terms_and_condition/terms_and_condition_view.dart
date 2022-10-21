import 'package:align_flutter_app/shared/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../../../../shared/constants/string_constant.dart';
import '../../../../../shared/utils/math_utils.dart';
import '../../../../../shared/widgets/base_text.dart';
import '../../../../../shared/widgets/common_appbar.dart';

class TermsConditionScreen extends StatelessWidget {
  const TermsConditionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: StringConstants.termsAndCondition,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: getSize(30)),
          child: Column(
            // physics: BouncingScrollPhysics(),
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: BaseText(
                  text: "Last updated 20th Apr 2022",
                  fontSize: 12,
                  textColor: ColorConstants.white.withOpacity(0.8),
                ),
              ),
              SizedBox(
                height: getSize(40),
              ),
              BaseText(
                text: "Summary",
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
              SizedBox(
                height: getSize(12),
              ),
              BaseText(
                text:
                    "Aliqua id fugiat nostrud irure ex duis ea quis id quis ad et. Sunt qui esse pariatur duis deserunt mollit dolore cillum minim tempor enim. Elit aute irure tempor cupidatat incididunt sint deserunt ut voluptate aute id deserunt nisi.",
                fontSize: 12,
                textColor: ColorConstants.white.withOpacity(0.7),
              ),
              SizedBox(
                height: getSize(26),
              ),
              BaseText(
                text: "Terms",
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
              SizedBox(
                height: getSize(12),
              ),
              BaseText(
                text:
                    "Aliqua id fugiat nostrud irure ex duis ea quis id quis ad et. Sunt qui esse pariatur duis deserunt mollit dolore cillum minim tempor enim. Elit aute irure tempor cupidatat incididunt sint deserunt ut voluptate aute id deserunt nisi.Nulla Lorem mollit cupidatat irure. Laborum magna nulla duis ullamco cillum dolor. Voluptate exercitation incididunt aliquip deserunt reprehenderit elit laborum. ",
                fontSize: 12,
                textColor: ColorConstants.white.withOpacity(0.7),
              ),
              SizedBox(
                height: getSize(26),
              ),
              BaseText(
                text:
                    "Aliqua id fugiat nostrud irure ex duis ea quis id quis ad et. Sunt qui esse pariatur duis deserunt mollit dolore cillum minim tempor enim. Elit aute irure tempor cupidatat incididunt sint deserunt ut voluptate aute id deserunt nisi.",
                fontSize: 12,
                textColor: ColorConstants.white.withOpacity(0.7),
                //overflow: TextOverflow.visible,
                //maxLines: 15,
              ),
              SizedBox(
                height: getSize(26),
              ),
              BaseText(
                text:
                    "Nulla Lorem mollit cupidatat irure. Laborum magna nulla duis ullamco cillum dolor. Voluptate exercitation incididunt aliquip deserunt reprehenderit elit laborum. ",
                fontSize: 12,
                textColor: ColorConstants.white.withOpacity(0.7),
                //overflow: TextOverflow.visible,
                //maxLines: 15,
              ),
            ],
          ),
        ),
      ),

      // WebView(
      //   initialUrl: 'https://flutter.dev',
      // ),
    );
  }
}
