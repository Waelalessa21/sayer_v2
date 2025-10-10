import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sayer_app/common/helpers/shared_preference.dart';
import 'package:sayer_app/common/helpers/user_session.dart';
import 'package:sayer_app/main.dart';

class FCMHelper {
  static final FirebaseMessaging _messaging = FirebaseMessaging.instance;
  static final FlutterLocalNotificationsPlugin _localNotifications =
      FlutterLocalNotificationsPlugin();

  static Future<void> initialize(BuildContext context, int userId) async {
    if (!isFirebaseInitialized) {
      debugPrint('⚠️ Firebase not initialized, skipping FCM setup');
      return;
    }

    try {
      const AndroidInitializationSettings initializationSettingsAndroid =
          AndroidInitializationSettings('@mipmap/ic_launcher');
      const DarwinInitializationSettings initializationSettingsDarwin =
          DarwinInitializationSettings();
      const InitializationSettings initializationSettings =
          InitializationSettings(
            android: initializationSettingsAndroid,
            iOS: initializationSettingsDarwin,
          );
      await _localNotifications.initialize(
        initializationSettings,
        onDidReceiveNotificationResponse: (response) {
          if (response.payload != null) {
            final data = jsonDecode(response.payload!);
            if (kDebugMode) {
              print(data);
            }
          }
        },
      );

      NotificationSettings settings = await _messaging.requestPermission(
        alert: true,
        badge: true,
        sound: true,
      );

      if (settings.authorizationStatus == AuthorizationStatus.authorized) {
        String? token = await _messaging.getToken();
        if (token != null) {
          await sendTokenToServer(token);
        }

        _messaging.onTokenRefresh.listen((newToken) async {
          await sendTokenToServer(newToken);
        });

        FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
          if (message.notification != null) {
            await _showLocalNotification(
              message.notification!.title ?? 'New Notification',
              message.notification!.body ?? '',
              message.data,
            );
          }
        });

        FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
          if (message.data.isNotEmpty) {}
        });
      } else {}
    } catch (e) {}
  }

  static Future<void> _showLocalNotification(
    String title,
    String body,
    Map<String, dynamic>? data,
  ) async {
    const AndroidNotificationDetails androidDetails =
        AndroidNotificationDetails(
          'default_channel',
          'Default Channel',
          channelDescription: 'Default notifications channel',
          importance: Importance.max,
          priority: Priority.high,
        );

    const DarwinNotificationDetails iOSDetails = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );

    const NotificationDetails platformChannelSpecifics = NotificationDetails(
      android: androidDetails,
      iOS: iOSDetails,
    );

    await _localNotifications.show(
      0,
      title,
      body,
      platformChannelSpecifics,
      payload: data != null ? jsonEncode(data) : null,
    );
  }

  static Future<void> sendTokenToServer(String token) async {
    try {
      String? lastSentToken = await SharedPrefHelper.getSecuredString(
        "LastFCMToken",
      );
      if (lastSentToken == token) {
        return;
      }

      final response = await http.post(
        Uri.parse('https://sayersa.systems/v1/fcm/save'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode({'user_id': userId, 'fcm_token': token}),
      );
      if (response.statusCode == 200) {
        await SharedPrefHelper.setSecuredString("LastFCMToken", token);
      } else {}
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
