import 'package:align_flutter_app/shared/constants/svg_image_constant.dart';
import 'package:align_flutter_app/shared/widgets/base_text.dart';
import 'package:align_flutter_app/shared/widgets/common_container_shadow.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../shared/utils/math_utils.dart';

class TodayJobsView extends StatelessWidget {
  const TodayJobsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          BaseText(text: "29/04/2022"),
          CommonContainerWithShadow(
            child: Row(
              children: [
                Image.asset(
                  SvgImageConstants.message,
                  height: getSize(24),
                ),
                BaseText(
                  text: "John Andrew",
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
