// import 'dart:io';

// import 'package:dio/dio.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:get/get.dart';
// import 'package:permission_handler/permission_handler.dart';

// import '../data/local/get_storage_helper.dart';
// import '../data/models/api_response.dart';
// import '../data/models/user.dart';
// import '../data/remote/repository.dart';
// import 'dio_error_util.dart';

// class NotificationsUtil {
//   static final _notification = FlutterLocalNotificationsPlugin();

//   static void init() {
//     if (Platform.isIOS) {
//       FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
//         alert: true,
//         badge: true,
//         sound: true,
//       );
//     }
//     FirebaseMessaging.instance.onTokenRefresh.listen((fcmToken) {
//       _addNotificationToken(token: fcmToken);
//     }).onError((err) {
//       // Error getting token.
//     });
//     FirebaseMessaging.onMessage.listen((event) {
//       debugPrint("FCM message $event");
//       if (Platform.isAndroid) {
//         showNotification(
//           title: event.notification!.title,
//           body: event.notification!.body,
//         );
//       }
//     });
//   }

//   static showNotification({
//     String? title,
//     String? body,
//   }) async {
//     var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
//       'kglam_channel',
//       'kglam_channel',
//       channelDescription: 'Kglam notification channel to display updates',
//       importance: Importance.max,
//       priority: Priority.high,
//     );
//     var iOSPlatformChannelSpecifics = const DarwinNotificationDetails(
//       presentAlert: true,
//       presentBadge: true,
//       presentSound: true,
//       sound: 'default',
//     );
//     var platformChannelSpecifics = NotificationDetails(
//       android: androidPlatformChannelSpecifics,
//       iOS: iOSPlatformChannelSpecifics,
//     );
//     await _notification.show(
//       1,
//       title ?? "",
//       body ?? "",
//       platformChannelSpecifics,
//     );
//   }

//   static Future<String?> getNotificationsToken() async {
//     try {
//       if (Platform.isIOS) {
//         final apnsToken = await FirebaseMessaging.instance.getAPNSToken();
//         if (apnsToken != null) {
//           var fcmToken = await FirebaseMessaging.instance.getToken();
//           debugPrint("FCM");
//           debugPrint(fcmToken);
//           return fcmToken;
//         } else {
//           return null;
//         }
//       } else {
//         var fcmToken = await FirebaseMessaging.instance.getToken();
//         debugPrint("FCM");
//         debugPrint(fcmToken);
//         return fcmToken;
//       }
//     } catch (e) {
//       debugPrint(e.toString());
//       return null;
//     }
//   }

//   static _addNotificationToken({required String token}) async {
//     if (!Get.find<GetStorageHelper>().isLoggedIn) {
//       return;
//     }
//     var addNotificationTokenResponse = ApiResponse<dynamic>.completed([]).obs;
//     Repository repository = Get.find();
//     addNotificationTokenResponse.value = ApiResponse<User>.loading('');
//     try {
//       var res = await repository.addNotificationToken(token: token);
//       addNotificationTokenResponse.value = res;
//     } on DioException catch (error) {
//       addNotificationTokenResponse.value =
//           ApiResponse<User>.error(DioErrorUtil.handleError(error));
//     }
//   }

//   static askNotificationPermission() async {
//     _notification.initialize(
//       const InitializationSettings(
//         android: AndroidInitializationSettings('@drawable/ic_notifications'),
//         iOS: DarwinInitializationSettings(),
//       ),
//     );
//   }

//   static askNotificationsPermissionUsingPermissionHandler() async {
//     final PermissionStatus status = await Permission.notification.request();
//     if (status.isGranted) {
//       // Notification permissions granted
//     } else if (status.isDenied) {
//       // Notification permissions denied
//     } else if (status.isPermanentlyDenied) {
//       await openAppSettings();
//     }
//   }

//   static askNotificationPermission2() async {
//     FirebaseMessaging messaging = FirebaseMessaging.instance;

//     await messaging.requestPermission(
//       alert: true,
//       announcement: false,
//       badge: true,
//       carPlay: false,
//       criticalAlert: false,
//       provisional: false,
//       sound: true,
//     );
//   }
// }
