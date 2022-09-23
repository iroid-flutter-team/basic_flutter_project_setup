import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:home_yogi_flutter/shared/constants/colors.dart';
import 'package:home_yogi_flutter/shared/shared.dart';
import 'package:home_yogi_flutter/shared/utils/math_utils.dart';
import 'package:home_yogi_flutter/shared/widgets/base_text.dart';
import '../widgets/base_elevated_button.dart';
import '../widgets/common_container_shadow.dart';

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({
    Key? key,
    required this.title,
    required this.cancelCallBack,
    required this.signOutCallBack,
  }) : super(key: key);

  final String title;
  final VoidCallback cancelCallBack;
  final VoidCallback signOutCallBack;

  final double borderRadius = 30.0;

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
      child: Dialog(
        insetPadding: EdgeInsets.all(getSize(32.0)),
        elevation: 0,
        backgroundColor: Color(0xffffffff),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            getSize(borderRadius),
          ),
        ),
        child: Container(
          padding: EdgeInsets.all(getSize(20.0)),
          decoration: BoxDecoration(
              color: Color(0xFF111111),
              borderRadius: BorderRadius.circular(
                getSize(borderRadius),
              ),
              border: Border.all(
                color: Color(0xffB52B2B),
                width: 1,
              ),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 0),
                  blurRadius: 30,
                  color: Color(0xffB52B2B).withOpacity(0.6),
                ),
              ]),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              //SizedBox(height: 15),
              BaseText(
                text: title,
                fontWeight: FontWeight.w500,
                textAlign: TextAlign.center,
              ),

              SizedBox(
                height: getSize(15.0),
              ),

              Divider(
                height: 1,
                color: ColorConstants.white.withOpacity(0.3),
              ),

              SizedBox(
                height: getSize(30.0),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {
                      cancelCallBack();
                    },
                    child: CommonContainerWithShadow(
                      height: 44.0,
                      width: 113.0,
                      child: Center(
                        child: BaseText(
                          text: 'Cancel',
                        ),
                      ),
                    ),
                  ),

                  /* BaseElevatedButton(
                    width: getSize(113.0),
                    onPressed: () {
                      cancelCallBack();
                    },
                    borderRadius: BorderRadius.circular(15.0),
                    child: BaseText(text:'Cancel'),
                    gradient: LinearGradient(
                      colors: [
                        ColorConstants.gradiantRed1,
                        ColorConstants.gradiantRed3,
                      ],
                    ),
                  ),*/

                  BaseElevatedButton(
                    width: getSize(113.0),
                    onPressed: () {
                      signOutCallBack();
                    },
                    borderRadius: BorderRadius.circular(15.0),
                    child: BaseText(text: 'Sign Out'),
                    gradient: LinearGradient(
                      colors: [
                        Color.fromRGBO(255, 99, 99, 1),
                        Color.fromRGBO(255, 99, 99, 1),
                        Color.fromRGBO(146, 16, 16, 1),
                      ],
                      begin: Alignment(236.25, 22),
                      end: Alignment(78.75, 22),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
