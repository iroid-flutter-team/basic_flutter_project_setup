// import 'dart:convert';
// import 'dart:io';
// import 'package:device_info_plus/device_info_plus.dart';

// @pragma('vm:entry-point')
// void notificationTapBackground(NotificationResponse details) async {}

// class PushNotificationService {
//   final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//       FlutterLocalNotificationsPlugin();
//   bool notificationsEnabled = false;

//   Future<void> setupInteractedMessage() async {
//     FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
//       printInfo(info: 'Notification 2 : ${message.data}');
//       DependencyInjection.authUserResponse.value.unreadNotification = true;
//       DependencyInjection.authUserResponse.refresh();
//     });
//     _isAndroidPermissionGranted();
//     _requestPermissions();
//     await registerNotificationListeners();
//   }

//   Future<void> _isAndroidPermissionGranted() async {
//     if (Platform.isAndroid) {
//       final bool granted = await flutterLocalNotificationsPlugin
//               .resolvePlatformSpecificImplementation<
//                   AndroidFlutterLocalNotificationsPlugin>()
//               ?.areNotificationsEnabled() ??
//           false;

//       notificationsEnabled = granted;
//     }
//   }

//   Future<void> _requestPermissions() async {
//     if (Platform.isIOS) {
//       await flutterLocalNotificationsPlugin
//           .resolvePlatformSpecificImplementation<
//               IOSFlutterLocalNotificationsPlugin>()
//           ?.requestPermissions(
//             alert: true,
//             badge: true,
//             sound: true,
//           );
//     } else if (Platform.isAndroid) {
//       final AndroidFlutterLocalNotificationsPlugin? androidImplementation =
//           flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<
//               AndroidFlutterLocalNotificationsPlugin>();

//       final bool? granted =
//           await androidImplementation?.requestNotificationsPermission();
//       // final bool? granted = await androidImplementation?.requestPermission();

//       notificationsEnabled = granted ?? false;
//     }
//   }

//   Future<void> registerNotificationListeners() async {
//     final AndroidNotificationChannel channel = androidNotificationChannel();
//     final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
//     String? deviceId;

//     if (Platform.isAndroid) {
//       AndroidDeviceInfo androidDeviceInfo = await deviceInfoPlugin.androidInfo;
//       deviceId = androidDeviceInfo.id;
//     } else if (Platform.isIOS) {
//       IosDeviceInfo iosDeviceInfo = await deviceInfoPlugin.iosInfo;
//       deviceId = iosDeviceInfo.identifierForVendor;
//     }

//     await flutterLocalNotificationsPlugin
//         .resolvePlatformSpecificImplementation<
//             AndroidFlutterLocalNotificationsPlugin>()
//         ?.createNotificationChannel(channel);
//     await FirebaseMessaging.instance.getToken().then((token) async {
//       printInfo(info: 'FCM Token===>:$token');
//       print('FCM Token===>:$token');
//       if (token != null && deviceId != null) {
//         DependencyInjection.showLoader.value = false;
//         await Get.find<ApiRepository>().registerForPush(
//           {
//             "device_id": deviceId,
//             "device_type": Platform.isIOS ? 1 : 2,
//             "token": token
//           },
//         );
//         DependencyInjection.showLoader.value = true;
//         return;
//       }
//     });
//     const AndroidInitializationSettings androidSettings =
//         AndroidInitializationSettings('@mipmap/ic_launcher');
//     const DarwinInitializationSettings iOSSettings =
//         DarwinInitializationSettings(
//       requestSoundPermission: false,
//       requestBadgePermission: false,
//       requestAlertPermission: false,
//     );
//     const InitializationSettings initSettings =
//         InitializationSettings(android: androidSettings, iOS: iOSSettings);
//     flutterLocalNotificationsPlugin.initialize(
//       initSettings,
//       onDidReceiveNotificationResponse: (NotificationResponse details) async {
//         switch (details.notificationResponseType) {
//           case NotificationResponseType.selectedNotification:
//             printInfo(
//                 info:
//                     '${NotificationResponseType.selectedNotification}: abc ${details.payload}');
//             if (details.payload != null) {}
//             break;

//           case NotificationResponseType.selectedNotificationAction:
//             printInfo(
//                 info:
//                     '${NotificationResponseType.selectedNotificationAction}: ${details.payload}');
//             if (details.payload != null) {}
//             break;
//           default:
//         }
//       },
//       onDidReceiveBackgroundNotificationResponse: notificationTapBackground,
//     );

//     FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
//         alert: true, badge: true, sound: true);
//     // onMessage is called when the app is in foreground and a notification is received
//     FirebaseMessaging.onMessage.listen((RemoteMessage? message) async {
//       // await DependencyInjection.getNotificationCountAPI();
//       printInfo(info: 'Notification 3 : ${message?.data}');

//       if (message?.data != null) {}

//       final RemoteNotification? notification = message!.notification;
//       final AndroidNotification? android = message.notification?.android;
//       // If `onMessage` is triggered with a notification, construct our own
//       // local notification to show to users using the created channel.
//       if (notification != null && android != null) {
//         flutterLocalNotificationsPlugin.show(
//           notification.hashCode,
//           notification.title,
//           notification.body,
//           NotificationDetails(
//             android: AndroidNotificationDetails(
//               channel.id,
//               channel.name,
//               channelDescription: channel.description,
//               icon: android.smallIcon,
//               //styleInformation: bigPictureStyleInformation,
//             ),
//           ),
//           payload: jsonEncode(message.data),
//         );
//       }
//     });
//   }

//   // Future<Uint8List> _getByteArrayFromUrl(String url) async {
//   //   final http.Response response = await http.get(Uri.parse(url));
//   //   return response.bodyBytes;
//   // }

//   AndroidNotificationChannel androidNotificationChannel() =>
//       const AndroidNotificationChannel(
//         'high_importance_channel', // id
//         'High Importance Notifications', // title
//         description:
//             'This channel is used for important notifications.', // description
//         importance: Importance.max,
//       );
// }
