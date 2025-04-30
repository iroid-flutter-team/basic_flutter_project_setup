import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grape_vender_app/shared/constants/color_constants.dart';
import 'package:grape_vender_app/shared/constants/svg_image_constant.dart';

import 'math_utils.dart';

class CommonLoader extends StatelessWidget {
  const CommonLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getSize(20),
        vertical: getSize(15),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            height: getSize(50),
            width: getSize(50),
            child: CircularProgressIndicator(
              strokeWidth: 3,
              color: ColorConstants.primary, //<-- SEE HERE
              backgroundColor: ColorConstants.primary.withOpacity(
                0.5,
              ), //<-- SEE HERE
            ),
          ),
          SizedBox(
            child: Container(
              height: getSize(40),
              width: getSize(40),
              padding: EdgeInsets.all(getSize(7)),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: ColorConstants.black.withOpacity(0.8),
              ),
              child: SvgPicture.asset(
                SvgImageConstant.appBarLogo,
                height: getSize(40),
                width: getSize(40),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
