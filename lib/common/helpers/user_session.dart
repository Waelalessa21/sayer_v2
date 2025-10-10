import 'dart:io';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/widgets.dart';
import 'package:sayer_app/main.dart';

bool isLoggedInUser = false;
bool demoMode = false;

String userName = '';
String lastName = '';

int userId = 0;

bool takeInterest = false;

List<Widget> notficationsList = [];
ValueNotifier<bool> notificationNotifier = ValueNotifier(false);

String userPhoneNumber = '';
String token = "";

void cleanCache() {
  userPhoneNumber = '';
  isLoggedInUser = false;
  userName = '';
  lastName = '';
  userId = 0;
  token = "";
}

class RemoteConfigService {
  static Future<bool> initializeRemoteConfig(String name) async {
    if (!isFirebaseInitialized) {
      debugPrint(
        '⚠️ Firebase not initialized, returning default value for $name',
      );
      return true;
    }

    try {
      final remoteConfig = FirebaseRemoteConfig.instance;
      remoteConfig.setConfigSettings(
        RemoteConfigSettings(
          fetchTimeout: Duration(seconds: 60),
          minimumFetchInterval: Duration(seconds: 5),
        ),
      );

      remoteConfig.setDefaults(<String, dynamic>{name: true});

      if (await _hasNetworkConnection()) {
        await remoteConfig.fetchAndActivate();
      }

      return remoteConfig.getBool(name);
    } catch (e) {
      debugPrint('⚠️ Remote Config error: $e');
      return true;
    }
  }

  static Future<bool> _hasNetworkConnection() async {
    try {
      final result = await InternetAddress.lookup('example.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    }
  }
}
