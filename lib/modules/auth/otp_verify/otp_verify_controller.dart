import 'dart:async';

import 'package:align_flutter_app/shared/constants/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../api/api_repository.dart';
import '../../../models/response/auth/login_response.dart';
import '../../../shared/constants/common_otp_textfield.dart';
import '../../main/main_binding.dart';
import '../../main/main_tab.dart';
import '../login/login_controller.dart';

class OtpVerifyController extends GetxController {
  final ApiRepository repository;
  OtpVerifyController({required this.repository});
  //SignInWithPhoneNumberController signInWithPhoneNumberController = Get.put(SignInWithPhoneNumberController(repository: Get.find()));
  final FirebaseAuth auth = FirebaseAuth.instance;
  final prefs = Get.find<SharedPreferences>();

  OtpFieldController otpController = OtpFieldController();
  final formKey = GlobalKey<FormState>();
   Timer? timer;
  var resendOtpTime = 0.obs;
  var code = "";
  var loginResponse = LoginResponse().obs;

  @override
  void onClose() {
    timer?.cancel();
    super.onClose();
  }

  void startTimer() {
    resendOtpTime.value = 60;
    const oneSec = Duration(seconds: 1);
    timer = Timer.periodic(
      oneSec,
          (Timer timer) {
        if (resendOtpTime.value == 0) {
          timer.cancel();
        } else {
          resendOtpTime.value--;
        }
      },
    );
  }

  showResendTime() {
    String strDigits(int n) => n.toString().padLeft(2, '0');
    return '00 : ${strDigits(
          resendOtpTime.value.remainder(60),
        )}';
  }

  login(String token) async {
    var res = await repository.login({
      "idToken": token,
    });
    if (res != null) {
      loginResponse.value = res;
      await prefs.setString(StorageConstants.token, res.authentication!.accessToken!);
      Get.offAll(
        MainTab(),
        binding: MainBindings(),
      );
    }
  }


  @override
  void onInit() {
    super.onInit();
  }
}
