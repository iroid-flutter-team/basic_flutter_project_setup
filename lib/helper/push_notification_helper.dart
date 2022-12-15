import 'dart:io';

import 'package:align_flutter_app/api/api_repository.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'package:permission_handler/permission_handler.dart' as ph;
import 'package:permission_handler/permission_handler.dart';
// ignore: slash_for_doc_comments
/**
 * Documents added by Alaa, enjoy ^-^:
 * There are 3 major things to consider when dealing with push notification :
 * - Creating the notification
 * - Hanldle notification click
 * - App status (foreground/background and killed(Terminated))
 *
 * Creating the notification:
 *
 * - When the app is killed or in background state, creating the notification is handled through the back-end services.
 *   When the app is in the foreground, we have full control of the notification. so in this case we build the notification from scratch.
 *
 * Handle notification click:
 *
 * - When the app is killed, there is a function called getInitialMessage which
 *   returns the remoteMessage in case we receive a notification otherwise returns null.
 *   It can be called at any point of the application (Preferred to be after defining GetMaterialApp so that we can go to any screen without getting any errors)
 * - When the app is in the background, there is a function called onMessageOpenedApp which is called when user clicks on the notification.
 *   It returns the remoteMessage.
 * - When the app is in the foreground, there is a function flutterLocalNotificationsPlugin, is passes a future function called onSelectNotification which
 *   is called when user clicks on the notification.
 *
 * */

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  if (message.data.isNotEmpty) {
    // var res = PushNotificationResponse.fromJson(message.data);
    // //      printInfo(info: 'type : ${res.type}');
    // if (res.type == '2') {
    //   //cource
    //   var leanController = Get.put(LearnController(repository: Get.find()));
    //   Get.to(
    //     LearnDetailsView(),
    //   );
    //   await leanController.getCourceDetailView(int.tryParse(res.referneceId!)!);
    // } else if (res.type == '3') {
    //   //budget
    //   Get.to(
    //     EditBudgetView(),
    //     binding: EditBudgetBinding(),
    //     arguments: int.tryParse(res.referneceId!),
    //   );
    // } else if (res.type == '5') {
    //   //blogs
    //   Get.to(
    //     BlogsDetailsView(),
    //     binding: BlogsDetailBinding(),
    //     arguments: [res.referneceId.toString(), ''],
    //   );
    // }
    // else if (res.type == '12') {
    //   //goal
    //   Get.to(BlogsDetailsView(),
    //       binding: BlogsDetailBinding(),
    //       arguments: [res.referneceId.toString(), '']);
    // } else if (res.type == '13') {
    //   //debts
    //   Get.to(BlogsDetailsView(),
    //       binding: BlogsDetailBinding(),
    //       arguments: [res.referneceId.toString(), '']);
    // }
    //     print('xzcd');
  } else {
    // printInfo(info: 'notification');
  }
  // AndroidNotificationChannel channel = const AndroidNotificationChannel(
  //   'high_importance_channel', // id
  //   'High Importance Notifications', // title

  //   importance: Importance.high,
  //   description: 'This channel is used for important notifications.',
  // );
  // final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  //     FlutterLocalNotificationsPlugin();
  // // If you're going to use other Firebase services in the background, such as Firestore,
  // // make sure you call `initializeApp` before using other Firebase services.
  // await flutterLocalNotificationsPlugin.show(
  //   message.data.hashCode,
  //   message.data["title"],
  //   "",
  //   NotificationDetails(
  //     android: AndroidNotificationDetails(
  //       channel.id,
  //       channel.name,
  //       channelDescription: channel.description,
  //       icon: message.notification?.android?.smallIcon,
  //       playSound: true,
  //       importance: Importance.max,
  //       priority: Priority.high,
  //       ticker: 'ticker',
  //     ),
  //   ),
  // );
  print('Handling a background message ${message.messageId}');
}

class PushNotificationService {
  PushNotificationService({required this.apiRepository, required this.context});
  BuildContext context;
  final ApiRepository apiRepository;

  // It is assumed that all messages contain a data field with the key 'type'

  Future<void> setupInteractedMessage() async {
    // Set the background messaging handler early on, as a named top-level function
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    // final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    // String? deviceId;

    // if (Platform.isAndroid) {
    //   AndroidDeviceInfo androidDeviceInfo = await deviceInfoPlugin.androidInfo;
    //   deviceId = androidDeviceInfo.id;
    // } else if (Platform.isIOS) {
    //   IosDeviceInfo iosDeviceInfo = await deviceInfoPlugin.iosInfo;
    //   deviceId = iosDeviceInfo.identifierForVendor;
    // }

    // Get any messages which caused the application to open from a terminated state.
    // If you want to handle a notification click when the app is terminated, you can use `getInitialMessage`
    // to get the initial message, and depending in the remoteMessage, you can decide to handle the click
    //This function can be called from anywhere in your app, there is an example in main file.

    await FirebaseMessaging.instance.getToken().then((token) async {
      print('FCM Token===>:$token');
      // DependencyInjection.showLoader.value = false;
      // await apiRepository.addfcmTocken(
      //   body: {
      //     "deviceId": deviceId,
      //     "platform": Platform.isAndroid ? "Android" : "iOS",
      //     "token": token
      //   },
      // );
      // DependencyInjection.showLoader.value = true;
      // return;
    });

    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();
    // If the message also contains a data property with a "type" of "chat",
    // navigate to a chat screen

    if (initialMessage != null) {
      print("===>>InitialMessage::${initialMessage.notification}");
      // if (initialMessage.data.isNotEmpty) {
      //   var res = PushNotificationResponse.fromJson(initialMessage.data);
      //   //      printInfo(info: 'type : ${res.type}');
      //   if (res.type == '2') {
      //     //cource
      //     var leanController = Get.put(LearnController(repository: Get.find()));
      //     Get.to(
      //       LearnDetailsView(),
      //     );
      //     await leanController
      //         .getCourceDetailView(int.tryParse(res.referneceId!)!);
      //   } else if (res.type == '3') {
      //     //budget
      //     Get.to(
      //       EditBudgetView(),
      //       binding: EditBudgetBinding(),
      //       arguments: int.tryParse(res.referneceId!),
      //     );
      //   } else if (res.type == '5') {
      //     //blogs
      //     Get.to(
      //       BlogsDetailsView(),
      //       binding: BlogsDetailBinding(),
      //       arguments: [res.referneceId.toString(), ''],
      //     );
      //   }
      //   // else if (res.type == '12') {
      //   //   //goal
      //   //   Get.to(BlogsDetailsView(),
      //   //       binding: BlogsDetailBinding(),
      //   //       arguments: [res.referneceId.toString(), '']);
      //   // } else if (res.type == '13') {
      //   //   //debts
      //   //   Get.to(BlogsDetailsView(),
      //   //       binding: BlogsDetailBinding(),
      //   //       arguments: [res.referneceId.toString(), '']);
      //   // }
      //   //     print('xzcd');
      // } else {
      //   printInfo(info: 'notification');
      // }
      // Navigator.pushNamed(context, '/chat',
      //     arguments: ChatArguments(initialMessage));
    }

    // Also handle any interaction when the app is in the background via a
    // Stream listener
    // This function is called when the app is in the background and user clicks on the notification
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
      print("===>>onMessageOpenedApp::${message.data}");
      if (message.data.isNotEmpty) {
        //   var res = PushNotificationResponse.fromJson(message.data);
        //   //      printInfo(info: 'type : ${res.type}');
        //   if (res.type == '2') {
        //     //cource
        //     var leanController =
        //         Get.put(LearnController(repository: Get.find()));
        //     Get.to(
        //       LearnDetailsView(),
        //     );
        //     await leanController
        //         .getCourceDetailView(int.tryParse(res.referneceId!)!);
        //   } else if (res.type == '3') {
        //     //budget
        //     Get.to(
        //       EditBudgetView(),
        //       binding: EditBudgetBinding(),
        //       arguments: int.tryParse(res.referneceId!),
        //     );
        //   } else if (res.type == '5') {
        //     //blogs
        //     Get.to(
        //       BlogsDetailsView(),
        //       binding: BlogsDetailBinding(),
        //       arguments: [res.referneceId.toString(), ''],
        //     );
        //   }
        //   // else if (res.type == '12') {
        //   //   //goal
        //   //   Get.to(BlogsDetailsView(),
        //   //       binding: BlogsDetailBinding(),
        //   //       arguments: [res.referneceId.toString(), '']);
        //   // } else if (res.type == '13') {
        //   //   //debts
        //   //   Get.to(BlogsDetailsView(),
        //   //       binding: BlogsDetailBinding(),
        //   //       arguments: [res.referneceId.toString(), '']);
        //   // }
        //   //     print('xzcd');
        // } else {
        //   printInfo(info: 'notification');
        // }
        // if (message.data.isNotEmpty) {
        //   var res = NotificationResponse.fromJson(message.data);
        //   if (res.notificationType == "1") {
        //     Get.toNamed(Routes.CHAT_CONVERSATION, arguments: [
        //       CommonChatData(
        //         user: CommonChatDataUser(
        //           name: res.fullName,
        //           profile: res.avatar,
        //           userId: int.tryParse(res.senderId!),
        //         ),
        //         type: int.tryParse(res.type!),
        //         message: res.message,
        //         requestStatus: int.tryParse(res.userStatus!)!.obs,
        //       ),
        //     ]);
        //     // Navigator.pushNamed(context, '/chat',
        //     //     arguments: ChatArguments(message));
        //   }
        // }

        // Get.toNamed(NOTIFICATIOINS_ROUTE);

        //[[MapEntry(senderId: 5), MapEntry(fullName: Axay), MapEntry(avatar: https://demo.iroidsolutions.com/2meeters/public/storage/user/profile/APbB14vgsl8N3g31euse4HQnlgdR9bfQ1KaoquZs.jpg), MapEntry(notificationType: 1), MapEntry(body: text message 123), MapEntry(type: 1), MapEntry(title: New message), MapEntry(message: text message 123)]]

        //  [MapEntry(senderId: 5), MapEntry(fullName: Axay), MapEntry(avatar: https://demo.iroidsolutions.com/2meeters/public/storage/user/profile/APbB14vgsl8N3g31euse4HQnlgdR9bfQ1KaoquZs.jpg), MapEntry(notificationType: 1), MapEntry(body: https://demo.iroidsolutions.com/2meeters/public/storage/attachments/FNNYClnpxjQf0nA5tjRmdMoG9j4CEFUfuB8GFnIz.jpg), MapEntry(type: 2), MapEntry(title: New message), MapEntry(message: Sent you a file )]
      }
    });
    if (Platform.isIOS) {
      await enableIOSNotifications();
    }

    await registerNotificationListeners();
  }

  registerNotificationListeners() async {
    AndroidNotificationChannel channel = androidNotificationChannel();
    final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();
    if (!Platform.isAndroid) {
      _requestPermissions(flutterLocalNotificationsPlugin);
      // if (DependencyInjection.prefs
      //         .getBool(StorageConstants.showNotificationDialogOnHome) ==
      //     null) {
      //   NotificationRequest().getNotificationReqestView(
      //     context,
      //     onClosePressed: () async {
      //       Get.back();
      //       await DependencyInjection.prefs
      //           .setBool(StorageConstants.showNotificationDialogOnHome, true);
      //     },
      //     onPressed: () async {
      //       Get.back();
      //       await DependencyInjection.prefs
      //           .setBool(StorageConstants.showNotificationDialogOnHome, true);
      //       getCheckNotificationPermStatus();
      //       //_requestPermissions(flutterLocalNotificationsPlugin);
      //     },
      //   );
      // }
    }

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
    var androidSettings =
        const AndroidInitializationSettings('@mipmap/ic_launcher');
    var iOSSettings = const IOSInitializationSettings();
    var initSetttings =
        InitializationSettings(android: androidSettings, iOS: iOSSettings);
    flutterLocalNotificationsPlugin.initialize(
      initSetttings,
      onSelectNotification: (message) async {
        print("===>Message2323:$message");
        // This function handles the click in the notification when the app is in foreground
        // if (message.data.isNotEmpty) {
        //   var res = NotificationResponse.fromJson(message.data);
        //   if (res.notificationType == 1) {
        //     Get.toNamed(
        //       Routes.CHAT_CONVERSATION,
        //       arguments: CommonChatData(
        //         user: CommonChatDataUser(
        //           name: res.fullName,
        //           profile: res.avatar,
        //           userId: int.tryParse(res.senderId!),
        //         ),
        //         type: int.tryParse(res.type!),
        //         message: res.message,
        //       ),
        //     );
        //     // Navigator.pushNamed(context, '/chat',
        //     //     arguments: ChatArguments(message));
        //   }
        // }
        // Get.toNamed(NOTIFICATIOINS_ROUTE);
      },
    );
    // onMessage is called when the app is in foreground and a notification is received
    FirebaseMessaging.onMessage.listen(
      (RemoteMessage? message) async {
        // Get.find<HomeController>().getNotificationsNumber();
        print("===>Message:${message!.data}");
        if (message.data.isNotEmpty) {
          // var res = PushNotificationResponse.fromJson(message.data);
          // //      printInfo(info: 'type : ${res.type}');
          // if (res.type == '2') {
          //   //cource
          //   var leanController =
          //       Get.put(LearnController(repository: Get.find()));
          //   Get.to(
          //     LearnDetailsView(),
          //   );
          //   await leanController
          //       .getCourceDetailView(int.tryParse(res.referneceId!)!);
          // } else if (res.type == '3') {
          //   //budget
          //   Get.to(
          //     EditBudgetView(),
          //     binding: EditBudgetBinding(),
          //     arguments: int.tryParse(res.referneceId!),
          //   );
          // } else if (res.type == '5') {
          //   //blogs
          //   Get.to(
          //     BlogsDetailsView(),
          //     binding: BlogsDetailBinding(),
          //     arguments: [res.referneceId.toString(), ''],
          //   );
          // }
          // else if (res.type == '12') {
          //   //goal
          //   Get.to(BlogsDetailsView(),
          //       binding: BlogsDetailBinding(),
          //       arguments: [res.referneceId.toString(), '']);
          // } else if (res.type == '13') {
          //   //debts
          //   Get.to(BlogsDetailsView(),
          //       binding: BlogsDetailBinding(),
          //       arguments: [res.referneceId.toString(), '']);
          // }
          //     print('xzcd');
        } else {
          printInfo(info: 'notification');
        }
        RemoteNotification? notification = message.notification;
        AndroidNotification? android = message.notification?.android;

        // If `onMessage` is triggered with a notification, construct our own
        // local notification to show to users using the created channel.
        if (notification != null && android != null) {
          await flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel.id,
                channel.name,
                channelDescription: channel.description,
                icon: android.smallIcon,
                playSound: true,
                importance: Importance.max,
                priority: Priority.high,
                ticker: 'ticker',
              ),
            ),
          );
        }
      },
    );
  }

  enableIOSNotifications() async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true, // Required to display a heads up notification
      badge: true,
      sound: true,
    );
  }

  androidNotificationChannel() => const AndroidNotificationChannel(
        'high_importance_channel', // id
        'High Importance Notifications', // title

        importance: Importance.high,
        description: 'This channel is used for important notifications.',
      );

  void _requestPermissions(
      FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) {
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );
  }

  /// Checks the notification permission status
  // getCheckNotificationPermStatus() async {
  //   await NotificationPermissions.getNotificationPermissionStatus()
  //       .then((status) {
  //     printInfo(info: '$status');
  //     if (status == ph.PermissionStatus.denied) {
  //       return showPermissionAlertDialog();
  //     } else if (status == PermissionStatus.granted) {
  //       Get.back();
  //     }
  //   });
  // }

  static Future<void> showPermissionAlertDialog() async {
    var state = true.obs;

    // return Get.bottomSheet(
    //   Container(
    //     padding: EdgeInsets.only(
    //       left: getSize(20),
    //       right: getSize(20),
    //       top: getSize(12),
    //     ),
    //     decoration: BoxDecoration(
    //       color: ColorConstants.white,
    //       borderRadius: BorderRadius.only(
    //         topLeft: Radius.circular(getSize(14)),
    //         topRight: Radius.circular(getSize(14)),
    //       ),
    //     ),
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       mainAxisSize: MainAxisSize.min,
    //       children: [
    //         Align(
    //           alignment: Alignment.centerRight,
    //           child: GestureDetector(
    //             onTap: () {
    //               Get.back();
    //             },
    //             child: SvgPicture.asset(SvgImageConstant.close),
    //           ),
    //         ),
    //         SizedBox(
    //           height: getSize(8),
    //         ),
    //         BaseText(
    //           text: 'Ok! If you change your mind...',
    //           textAlign: TextAlign.center,
    //           fontSize: 20,
    //           fontWeight: FontWeight.w600,
    //         ),
    //         SizedBox(
    //           height: getSize(10),
    //         ),
    //         ListTile(
    //           contentPadding: EdgeInsets.zero,
    //           leading: Image.asset(
    //             PngImageConstants.iosSetting,
    //             height: getSize(44),
    //             width: getSize(44),
    //           ),
    //           title: Text.rich(
    //             TextSpan(
    //               style: TextStyle(
    //                 //shadows: [Shadow(color: Colors.black, offset: Offset(0, -5))],
    //                 color: ColorConstants.primaryBlack,

    //                 fontFamily: 'GeneralSans',
    //                 fontSize: getFontSize(13),
    //                 letterSpacing: 0,
    //                 fontWeight: FontWeight.w600,
    //               ),
    //               children: [
    //                 TextSpan(
    //                   text: 'Open ',
    //                 ),
    //                 TextSpan(
    //                   text: 'Financielle settings on iPhone',
    //                   recognizer: TapGestureRecognizer()
    //                     ..onTap = () {
    //                       Get.back();
    //                       ph.openAppSettings();
    //                     },
    //                   style: TextStyle(decoration: TextDecoration.underline),
    //                 ),
    //               ],
    //             ),
    //           ),
    //         ),
    //         SizedBox(
    //           height: getSize(4),
    //         ),
    //         ListTile(
    //           contentPadding: EdgeInsets.zero,
    //           leading: Image.asset(
    //             PngImageConstants.iosNotification,
    //             height: getSize(44),
    //             width: getSize(44),
    //           ),
    //           title: BaseText(
    //             text: 'Select Notifications',
    //             fontSize: 13,
    //             fontWeight: FontWeight.w600,
    //           ),
    //         ),
    //         SizedBox(
    //           height: getSize(4),
    //         ),
    //         Obx(
    //           () => ListTile(
    //             contentPadding: EdgeInsets.zero,
    //             leading: SizedBox(
    //               height: getSize(44),
    //               width: getSize(44),
    //               child: CupertinoSwitch(
    //                 value: state.value,
    //                 onChanged: (value) {
    //                   state.value = value;
    //                   // state = value;
    //                   // setState(() {});
    //                 },
    //                 activeColor: Color(0xFF2DD151),
    //                 //  trackColor: CupertinoColors.systemBlue,
    //               ),
    //             ),
    //             title: BaseText(
    //               text: 'Turn on all of the settings',
    //               fontSize: 13,
    //               fontWeight: FontWeight.w600,
    //             ),
    //           ),
    //         ),
    //         SizedBox(
    //           height: getSize(24),
    //         ),
    //         CommonButton(
    //           onPressed: () {
    //             Get.until((route) => route.isFirst);
    //           },
    //           buttonText: StringConstant.gotIt,
    //         ),
    //         SizedBox(
    //           height: getSize(24),
    //         ),
    //       ],
    //     ),
    //   ),
    //   //backgroundColor: ColorConstants.white,
    //   enableDrag: false,
    // );
  }
}
