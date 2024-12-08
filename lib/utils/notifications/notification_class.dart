import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'dart:developer';

class NotificationService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _localNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  // Initialize notification service
  Future<void> initialize() async {
    // Request notification permissions
    NotificationSettings settings = await _firebaseMessaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      log("Notification permissions granted.");

      // Initialize local notifications
      const AndroidInitializationSettings androidInitializationSettings =
          AndroidInitializationSettings('@mipmap/ic_launcher');
      const InitializationSettings initializationSettings =
          InitializationSettings(android: androidInitializationSettings);
      await _localNotificationsPlugin.initialize(initializationSettings);

      // Handle foreground notifications
      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        log("Received notification in foreground: ${message.notification?.title}");
        _showLocalNotification(
          title: message.notification?.title,
          body: message.notification?.body,
        );
      });

      // Handle background and terminated notifications
      FirebaseMessaging.onBackgroundMessage(_firebaseBackgroundHandler);
    } else {
      log("Notification permissions denied.");
    }
  }

  // Show local notification
  Future<void> _showLocalNotification({String? title, String? body}) async {
    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
      'default_channel',
      'Default Channel',
      channelDescription: 'This is the default notification channel',
      importance: Importance.high,
      priority: Priority.high,
    );

    const NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);

    await _localNotificationsPlugin.show(
      0, // Notification ID
      title,
      body,
      notificationDetails,
    );
  }
}

// Background notification handler
Future<void> _firebaseBackgroundHandler(RemoteMessage message) async {
  log("Received notification in background: ${message.notification?.title}");
}
