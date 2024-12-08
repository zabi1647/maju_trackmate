import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maju_trackmate/screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:maju_trackmate/utils/notifications/notification_class.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final notificationService = NotificationService();
  await notificationService.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      title: 'Maju Trackmate',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
