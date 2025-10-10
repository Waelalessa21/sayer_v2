import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sayer_app/common/helpers/user_session.dart';
import 'package:sayer_app/common/widgets/cards/firebase_notification_card.dart';

DateTime now = DateTime.now();
String formattedTime = DateFormat('hh:mm a').format(now);

bool thereNotification = false;

Future<void> handlerBackgroundMessage(RemoteMessage message) async {
  String receptionTime = DateFormat(
    'yyyy-MM-dd HH:mm:ss',
  ).format(DateTime.now());

  thereNotification = true;

  await addNotification(
    message.notification?.title ?? '',
    message.notification?.body ?? '',
    receptionTime,
  );
}

class FirebaseApi {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  final CollectionReference notificationsRef = FirebaseFirestore.instance
      .collection('notifications');

  Future<void> initNotification() async {
    NotificationSettings settings = await _firebaseMessaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
    } else {
      return;
    }

    _setupListeners();
  }

  void _setupListeners() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      String receptionTime = DateFormat(
        'yyyy-MM-dd HH:mm:ss',
      ).format(DateTime.now());

      thereNotification = true;

      await addNotification(
        message.notification?.title ?? '',
        message.notification?.body ?? '',
        receptionTime,
      );
    });

    FirebaseMessaging.onBackgroundMessage(handlerBackgroundMessage);

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
      String receptionTime = DateFormat(
        'yyyy-MM-dd HH:mm:ss',
      ).format(DateTime.now());

      thereNotification = true;

      await addNotification(
        message.notification?.title ?? '',
        message.notification?.body ?? '',
        receptionTime,
      );
    });

    FirebaseMessaging.instance.onTokenRefresh.listen((String newToken) {});
  }
}

Future<void> addNotification(
  String title,
  String subtitle,
  String receptionTime,
) async {
  String storageTime = DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());

  final CollectionReference notificationsRef = FirebaseFirestore.instance
      .collection('notifications');

  await notificationsRef.add({
    'title': title,
    'subtitle': subtitle,
    'reception_time': receptionTime,
    'storage_time': storageTime,
    'time': DateTime.now().toIso8601String(),
  });

  await loadNotifications();
}

Future<void> loadNotifications() async {
  final CollectionReference notificationsRef = FirebaseFirestore.instance
      .collection('notifications');
  QuerySnapshot snapshot = await notificationsRef
      .orderBy('time', descending: true)
      .get();

  notficationsList.clear();

  DateTime now = DateTime.now();

  for (var doc in snapshot.docs) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    DateTime notifTime = DateTime.parse(data['time']);

    String displayTime = DateFormat('hh:mm a').format(notifTime);

    if (now.difference(notifTime).inDays >= 2) {
      await doc.reference.delete();
    } else {
      notficationsList.add(
        FireBaeNotificationCard(
          title: data['title'],
          subtitle: data['subtitle'],
          time: displayTime,
          logo: "assets/logos/Sayer_Logo.png",
        ),
      );
    }
  }
}
