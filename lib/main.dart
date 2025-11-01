import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sayer_app/common/di/dependency_injection.dart';
import 'package:sayer_app/common/helpers/shared_preference.dart';
import 'package:sayer_app/common/helpers/user_session.dart';
import 'package:sayer_app/common/networking/dio_factory.dart';
import 'package:sayer_app/common/routing/app_router.dart';
import 'package:sayer_app/firebase_options.dart';
import 'package:sayer_app/sayer_app.dart';

bool isFirebaseInitialized = false;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    isFirebaseInitialized = true;
  } catch (e) {
    isFirebaseInitialized = false;
  }

  await setupGetIt();
  await checkIfLoggedInUser();

  final GoRouter router = createGoRouter(isLoggedInUser);

  runApp(SayerApp(appRouter: router));
}

Future<void> checkIfLoggedInUser() async {
  String? phoneToken = await SharedPrefHelper.getSecuredString("PhoneToken");
  userPhoneNumber = phoneToken ?? '';
  token = await SharedPrefHelper.getSecuredString("Token") ?? '';
  if (token.isNotEmpty) {
    isLoggedInUser = true;
    DioFactory.setTokenIntoHeaderAfterLogin(token);
  } else if (demoMode == true) {
    isLoggedInUser = true;
  } else {
    isLoggedInUser = false;
  }
}
