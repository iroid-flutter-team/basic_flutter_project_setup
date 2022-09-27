import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../api/api_repository.dart';
import '../../../shared/constants/common_otp_textfield.dart';

class OtpVerifyController extends GetxController{
  final ApiRepository repository;
  OtpVerifyController({required this.repository});

  final FirebaseAuth auth = FirebaseAuth.instance;


  OtpFieldController otpController = OtpFieldController();
  final formKey = GlobalKey<FormState>();
  // Timer? timer;
  var resendOtpTime = 0.obs;
  var code = "";


  showResendTime() {
    String strDigits(int n) => n.toString().padLeft(2, '0');
    return '00 : ${strDigits(
          resendOtpTime.value.remainder(60),
        )}';
  }


  login(String token)async{
    var res = await repository.login({
      "idToken" : token,
    });
    print("res===========${res?.data}");
  }


}