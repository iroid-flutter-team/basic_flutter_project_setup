import 'package:align_flutter_app/shared/widgets/base_elevated_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';

import '../../../shared/constants/color_constants.dart';
import '../../../shared/constants/common_otp_textfield.dart';
import '../../../shared/utils/math_utils.dart';
import '../../../shared/widgets/base_text.dart';
import '../../../shared/widgets/common_boxshadow.dart';
import 'otp_verify_controller.dart';

class OtpVerifyView extends GetView<OtpVerifyController> {
  const OtpVerifyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildMainBody(),
    );
  }
  _buildMainBody() {
    return GestureDetector(
      onTap: () {
      },
      child: Form(
        key: controller.formKey,
        child: Padding(
          padding: EdgeInsets.only(
            left: getSize(30),
            right: getSize(30),
            bottom: getSize(40),
            top: getSize(50),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  children: [
                    BaseText(
                      //textAlign: TextAlign.center,
                      text: "Verification code",
                      fontSize: 32,
                    ),
                    SizedBox(
                      height: getSize(20),
                    ),
                    BaseText(
                      textAlign: TextAlign.center,
                      text: "Please type the verification code sent to",
                      fontSize: 14,
                      textColor: ColorConstants.white.withOpacity(0.6),
                    ),
                    BaseText(
                      textAlign: TextAlign.center,
                      text: "+1 230-333-0181",
                      fontSize: 14,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: getSize(40),
              ),
              _buildOtpView(),
              SizedBox(
                height: getSize(40),
              ),
            ],
          ),
        ),
      ),

    );
  }

  _buildOtpView() {
    return Opacity(
      opacity:  1,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BaseText(
                text: 'Enter OTP',
                textColor: Colors.white,
              ),
              BaseText(
                text: controller.showResendTime(),
                //text: '${double.parse((controller.start.value).toStringAsFixed(2))}',
                textColor: Colors.white,
              ),
            ],
          ),
          SizedBox(
            height: getSize(14),
          ),
          // opacity: controller.resendOtpTime.value == 0 ? 0.4 : 1,
          Opacity(
            opacity: controller.resendOtpTime.value == 0 ? 0.6 : 1,
            child: Center(
              child: AbsorbPointer(
                absorbing: controller.resendOtpTime.value == 0 ? true : false,
                child: CommonOTPTextField(
                  keyboardType:  TextInputType.number,
                  controller: controller.otpController,
                  length: 5,
                  isDense: true,
                  width: Get.size.width,
                  textFieldAlignment: MainAxisAlignment.spaceAround,
                  fieldWidth: 52,
                  otpFieldStyle: OtpFieldStyle(
                    borderColor: Colors.grey.withOpacity(0.10),
                    enabledBorderColor: Colors.grey.withOpacity(0.10),
                    focusBorderColor: Colors.grey.withOpacity(0.10),
                    backgroundColor: ColorConstants.darkContainerBlack,
                  ),
                  fieldStyle: FieldStyle.box,
                  outlineBorderRadius: 14,
                  style: TextStyle(
                    color: ColorConstants.white,
                    fontSize: 24,
                    shadows: [
                      CommonBoxShadow.getBlackBackgroundBoxShadow(
                        Offset(5, 6),
                      ),
                    ],
                  ),
                  onChanged: (pin) {
                    // print("Changed: " + pin);
                    // controller.otpValue.value = pin;
                    // if (controller.otpValue.value.length < 5) {
                    //   controller.buttonClickable.value = false;
                    // }
                  },
                  onCompleted: (pin) {
                    // print("Completed: " + pin);
                    // controller.buttonClickable.value = true;
                  },
                ),
              ),
            ),
          ),
          SizedBox(
            height: getSize(14),
          ),
          Opacity(
            opacity: controller.resendOtpTime.value == 0 ? 1 : 0.2,
            child: Align(
              alignment: Alignment.centerRight,
              child: InkWell(
                // onTap: (controller.resendOtpTime.value == 0 &&
                //     controller.sendOtpView.value == false)
                //     ? () {
                //   controller.loginUser();
                // }
                //     : null,
                child: BaseText(
                  //textAlign: TextAlign.end,
                  text: 'Resend OTP?',
                  textColor: ColorConstants.blueShadow,
                ),
              ),
            ),
          ),
          BaseElevatedButton(onPressed: (){}, child: BaseText(
            text: "Submit",
          ),),
        ],
      ),
    );
  }
}
