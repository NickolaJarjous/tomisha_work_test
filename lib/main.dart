import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tomisha_work_test/app.dart';
import 'package:tomisha_work_test/di/async_bindings.dart';

// @pragma('vm:entry-point')
// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage event) async {
//   debugPrint("BackgroundDATA:${event.data.toString()}");
//   await Firebase.initializeApp();
//   NotificationsUtil.showNotification(
//     title: event.data['title'] ?? '',
//     body: event.data['body'] ?? '',
//   );
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );
  PaintingBinding.instance.imageCache.maximumSizeBytes = 1000 << 20;
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // NotificationsUtil.init();
  // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await GetStorage.init();
  InitBinding().dependencies();
  runApp(const App());
}
