
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../../shared/constants/color_constants.dart';
import '../../../../../shared/constants/png_image_constant.dart';
import '../../../../../shared/utils/math_utils.dart';
import '../../../../../shared/widgets/base_text.dart';
import '../../../../../shared/widgets/common_appbar.dart';
import '../../../../../shared/widgets/common_container_shadow.dart';

class MessageView extends StatelessWidget {
  const MessageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: 'Messages',
      ),
      body: _buildMainBody(),
    );
  }

  _buildMainBody() {
    return ListView.builder(
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      itemCount: 4,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(
            left: getSize(25),
            right: getSize(25),
            top: getSize(20),
          ),
          child: CommonContainerWithShadow(
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: getSize(7), left: getSize(12), bottom: getSize(10)),
                  child: Stack(
                    alignment: Alignment.topLeft,
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        height: getSize(50),
                        width: getSize(50),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(14),
                          image: DecorationImage(
                              image: AssetImage(PngImageConstants.msg_user),
                              fit: BoxFit.cover),
                        ),
                      ),
                      Positioned(
                        top: -1,
                        left: -5,
                        child: Container(
                          height: getSize(12),
                          width: getSize(12),
                          decoration: BoxDecoration(
                            color: ColorConstants.circleBlue,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: getSize(15),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(top: getSize(12), bottom: getSize(12), right: getSize(20)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              BaseText(
                                text: 'John Andrew',
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                              //Spacer(),
                             //  SizedBox(
                             //    width: getSize(120),
                             //  ),
                              BaseText(
                                text: '1 hr ago',
                                fontSize: 10,
                              ),
                            ],
                          ),
                        SizedBox(
                          height: getSize(12),
                        ),
                        BaseText(
                          text: 'That’s great, i can help you with tha...',
                          fontSize: 12,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
