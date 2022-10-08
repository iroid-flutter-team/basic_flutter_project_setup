
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import '../../../shared/constants/color_constants.dart';
import '../../../shared/constants/common_otp_textfield.dart';
import '../../../shared/constants/string_constant.dart';
import '../../../shared/utils/image_utils.dart';
import '../../../shared/utils/math_utils.dart';
import '../../../shared/utils/math_utils.dart';
import '../../../shared/utils/math_utils.dart';
import '../../../shared/widgets/base_elevated_button.dart';
import '../../../shared/widgets/base_text.dart';
import '../../../shared/widgets/common_boxshadow.dart';
import '../../../shared/widgets/common_container_shadow.dart';
import '../../../shared/widgets/input_field.dart';
import '../otp_verify/otp_verify_binding.dart';
import '../otp_verify/otp_verify_view.dart';
import 'login_controller.dart';

class SignInWithPhoneNumberScreen
    extends GetView<SignInWithPhoneNumberController> {
  const SignInWithPhoneNumberScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildMainBody(),
    );
  }

  _buildMainBody() {
    return GestureDetector(
      onTap: () {},
      child: Form(
        key: controller.formKey,
        child: Padding(
          padding: EdgeInsets.only(
            left: getSize(28),
            right: getSize(28),
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
                      text: "Get started",
                      fontSize: 32,
                    ),
                    SizedBox(
                      height: getSize(20),
                    ),
                    BaseText(
                      textAlign: TextAlign.center,
                      text: "Enter your phone number to verify \nyour account",
                      fontSize: 14,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: getSize(40),
              ),
              _buildNumberView(),
              //  _buildOtpView(),
              Spacer(),
              _buttonSendOTP()
              // SizedBox(
              //   height: getSize(),
              // ),
              //  _buttonSendVerifyOTP(),
            ],
          ),
        ),
      ),
    );
  }

  _buildNumberView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: getSize(12),
        ),
        Row(
          children: [
            SizedBox(
              width: getSize(65),
              child: InputTextField(
                controller: controller.countryController,
                textInputType: TextInputType.text,
                enable: true,
                textInputAction: TextInputAction.next,
              ),
            ),
            SizedBox(
              width: getSize(10),
            ),
            Expanded(
              child: InputTextField(
                controller: controller.phoneNumberController,
                textInputType: TextInputType.number,
                hintText: StringConstants.hintPhoneNumber,
                enable: true,
                //  prefixIcon: Padding(padding: EdgeInsets.all(12.0), child: SvgPicture.asset(getAssetsSVGImg('email'),),),
                textInputAction: TextInputAction.done,
                validator: (value) {
                  //print("controller.phoneController========${value}");
                  if (value == "000-000-0000" || value == r'(^(?:[+0]9)?[0-9]{10,12}$)') {
                    return 'please enter valid number';
                  } else if (value!.length < 10) {
                    return "mobile number must be 10 digit";
                  }
                  return null;
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  _buttonSendOTP() {
    return BaseElevatedButton(
      width: Get.width,
      onPressed: () async{
        controller.checkManagerExist();
        // await FirebaseAuth.instance.verifyPhoneNumber(
        //   phoneNumber: controller.countryController.text + controller.phoneNumberController.text,
        //
        //   verificationCompleted: (PhoneAuthCredential credential) {
        //     print("token===================${credential.token}");
        //     EasyLoading.showToast("Success");
        //   },
        //   verificationFailed: (FirebaseAuthException e) {
        //     EasyLoading.showToast("Failed");
        //   },
        //   codeSent: (String verificationId, int? resendToken) {
        //
        //     // Get.offAll(
        //     //   OtpVerifyView(),
        //     //   binding: OtpVerifyBindings(),
        //     // );
        //   },
        //   codeAutoRetrievalTimeout: (String verificationId) {},
        // );
      },
      child: BaseText(
        text: "SEND OTP",
        textColor: ColorConstants.white,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}
