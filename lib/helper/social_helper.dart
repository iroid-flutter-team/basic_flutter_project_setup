// import 'dart:convert';
// import 'dart:developer';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
// import 'package:get/get.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:spinning/api/api_repository.dart';
// import 'package:spinning/di.dart';
// import 'package:spinning/models/response/auth/auth_user_response.dart';
// import 'package:spinning/routes/app_pages.dart';
// import 'package:spinning/shared/constants/storage.dart';
// import 'package:spinning/shared/utils/flushbar_creator.dart';
// import 'package:twitter_login/twitter_login.dart';

// class SocialLoginHelper {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final GoogleSignIn _googleSignIn = GoogleSignIn(
//     clientId:
//         '143041790043-3jo745kgtd6d5gh3u0j9dgiftgd7h5sl.apps.googleusercontent.com',
//     forceCodeForRefreshToken: true,
//     scopes: ['email'],
//   );
//   Future<void> signInWithGoogle() async {
//     try {
//       signOutFromGoogle();
//       final GoogleSignInAccount? googleSignInAccount =
//           await _googleSignIn.signIn();

//       final googleSignInResponse = await googleSignInAccount?.authentication;

//       if (googleSignInResponse != null &&
//           googleSignInResponse.accessToken?.isNotEmpty == true) {
//         await apiCalling(
//           provider: 'google',
//           token: googleSignInResponse.accessToken ?? '',
//         );
//       }
//     } catch (e) {
//       log('Google Sign In Error: ${e.runtimeType}');
//       showError(message: 'Google Sign In Error').show(Get.context!);
//     }
//   }

//   Future<void> signInWithApple() async {
//     try {
//       var appleProvider = AppleAuthProvider();
//       var res = await FirebaseAuth.instance
//           .signInWithProvider(appleProvider)
//           .whenComplete(() {})
//           // ignore: body_might_complete_normally_catch_error
//           .catchError((e) async {
//         FirebaseAuthException exception = e as FirebaseAuthException;
//         await showError(message: exception.message ?? '').show(Get.context!);
//       });
//       String t = await res.user?.getIdToken() ?? '';
//       await apiCalling(
//         provider: 'apple',
//         token: t,
//         name: res.user?.displayName ?? 'NA',
//       );
//     } catch (e) {
//       print('Error signing in with Apple: $e');
//     }
//   }

//   //sign in with x
//   Future<void> signInWithX() async {
//     final xLogin = TwitterLogin(
//       apiKey: 'd4sEx0j7xSh7oWPTm6Ug5j07f',
//       apiSecretKey: 'X5VybHcwERDMJFsbZEh7KLpF5CtFpOpeoV9V8lnDe5aRGoxz6T',
//       redirectURI: 'flutter-x-login://',
//     );

//     try {
//       await xLogin.login().then((value) async {
//         final xAuthCredential = TwitterAuthProvider.credential(
//           accessToken: value.authToken ?? '',
//           secret: value.authTokenSecret ?? '',
//         );

//         UserCredential userCredential =
//             await FirebaseAuth.instance.signInWithCredential(xAuthCredential);
//         String token = await userCredential.user?.getIdToken() ?? '';
//         await apiCalling(
//           provider: 'twitter',
//           token: token,
//           name: userCredential.user?.displayName ?? 'NA',
//         );
//       });
//     } catch (e) {
//       log('Error signing in with X: $e');
//     }
//   }

//   Future<void> signInWithFacebook() async {
//     try {
//       final LoginResult result = await FacebookAuth.instance.login();

//       if (result.status == LoginStatus.success) {
//         final AccessToken accessToken = result.accessToken!;
//         print('Facebook Access Token: ${accessToken.tokenString}');

//         // Use the accessToken.token for authentication in Firebase or backend
//       } else {
//         print('Facebook Login Failed: ${result.message}');
//       }
//     } catch (e) {
//       print('Error during Facebook login: $e');
//     }
//   }

//   Future<void> signOutFromGoogle() async {
//     await _googleSignIn.signOut();
//     await _auth.signOut();
//   }

//   apiCalling({
//     required String provider,
//     required String token,
//     String? name,
//   }) async {
//     Map<String, dynamic> data = {
//       'provider': provider,
//       'token': token,
//       'device_id': DependencyInjection.deviceId,
//     };
//     data.addIf(name != null, 'name', name);

//     AuthUserResponse response =
//         await Get.find<ApiRepository>().socialLogin(data) ?? AuthUserResponse();
//     if (response.token?.accessToken != null && response.id != null) {
//       await DependencyInjection.prefs.setString(
//         StorageConstants.token,
//         response.token?.accessToken ?? '',
//       );
//       await DependencyInjection.prefs.setString(
//         StorageConstants.userData,
//         jsonEncode(
//           response.toJson(),
//         ),
//       );
//       await DependencyInjection.getUserData();
//       if (DependencyInjection.authUserResponse.value.aboutUs == null) {
//         Get.offAllNamed(Routes.ABOUT_YOU);
//       } else {
//         Get.offAllNamed(Routes.MAIN);
//       }
//     }
//   }
// }
