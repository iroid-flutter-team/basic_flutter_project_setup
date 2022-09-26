import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../api/api_repository.dart';
import '../../../shared/constants/common_otp_textfield.dart';

class SignInWithPhoneNumberController extends GetxController{
  final ApiRepository repository;
  SignInWithPhoneNumberController({required this.repository});

  //
   final formKey = GlobalKey<FormState>();
  // Timer? timer;
   var resendOtpTime = 0.obs;
   TextEditingController countryController = TextEditingController();
   TextEditingController phoneNumberController = TextEditingController();
   var phone = "";
  @override
  void onInit() {
    countryController.text = "+91";
    //getCheckListChecked(4);
    super.onInit();
  }


  // OtpFieldController otpController = OtpFieldController();
  // final emailValue = ''.obs;
  // final otpValue = ''.obs;
  // RxBool buttonClickable = false.obs;
  // RxBool sendOtpView = true.obs;
  // final prefs = Get.find<SharedPreferences>();
  //
  // isValidEmail() {
  //   if (emailValue.isEmpty) {
  //     return false;
  //   } else if (!Regex.isEmail(emailValue.value)) {
  //     return false;
  //   }
  //   return true;
  // }
  //
  // @override
  // void onClose() {
  //   timer?.cancel();
  //   super.onClose();
  // }
  //
  // void startTimer() {
  //   resendOtpTime.value = 60;
  //   const oneSec = Duration(seconds: 1);
  //   timer = Timer.periodic(
  //     oneSec,
  //         (Timer timer) {
  //       if (resendOtpTime.value == 0) {
  //         timer.cancel();
  //       } else {
  //         resendOtpTime.value--;
  //       }
  //     },
  //   );
  // }
  //
  showResendTime() {
    String strDigits(int n) => n.toString().padLeft(2, '0');
    return '00 : ' +
        strDigits(
          resendOtpTime.value.remainder(60),
        );
  }
  //
  // loginUser({bool fromResendOtp = false}) async {
  //   var get = await repository.login({
  //     "email": emailController.text,
  //   });
  //   startTimer();
  //   if (get?.dioMessage != null) {
  //     print("diomessage ==========================${get?.dioMessage}");
  //     otpController.clear();
  //     //startTimer();
  //     buttonClickable.value = false;
  //     sendOtpView.value = false;
  //   }
  //
  //   //  startTimer();
  //   //print("get${get?.dioMessage}");
  // }
  //
  // otpVerify() async {
  //   var otpVerifyRes = await repository.otpVerify({
  //     "email": emailController.text,
  //     "otp": otpValue.value,
  //   });
  //   //print("get${otpVerifyRes?.email}");
  //   if (otpVerifyRes != null) {
  //     if (otpVerifyRes.authentication != null &&
  //         otpVerifyRes.authentication?.accessToken != null) {
  //       await prefs.setString(
  //           StorageConstants.token, otpVerifyRes.authentication!.accessToken!);
  //       await prefs.setString(StorageConstants.refreshToken,
  //           otpVerifyRes.authentication!.refreshToken!);
  //       await prefs.setString(
  //           StorageConstants.userData, jsonEncode(otpVerifyRes.toJson()));
  //       showEmailVerifyDialog();
  //     }
  //     // if (res.verify == 0) {
  //     //   Map<String, dynamic> argumentMap = {
  //     //     'email': emailController.text,
  //     //     'from': StringConstant.fromSignUp
  //     //   };
  //     //   //Get.toNamed(Routes.OTP_VERIFICATION, arguments: argumentMap);
  //     // } else {
  //     //  // Get.offAndToNamed(Routes.ABOUT_YOU,);
  //     // }
  //   }
  // }
  //
  // showEmailVerifyDialog() {
  //   Get.dialog(
  //     EmailVerifyDialog(
  //       email: emailValue.string,
  //       continueCallBack: () {
  //         Get.back();
  //         Get.offAll(
  //           UserDetailScreen(),
  //           binding: UserDetailBindings(),
  //         );
  //       },
  //     ),
  //     barrierDismissible: false,
  //   );
  // }
}