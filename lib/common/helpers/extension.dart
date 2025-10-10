import 'package:flutter/widgets.dart';
import 'package:sayer_app/common/helpers/shared_preference.dart';
import 'package:sayer_app/common/helpers/user_session.dart';
import 'package:sayer_app/common/routing/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';

extension Navigation on BuildContext {
  Future<dynamic> pushNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushReplacementNamed(String routeName, {Object? arguments}) {
    return Navigator.of(
      this,
    ).pushReplacementNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushNamedAndRemoveUntil(
    String routeName, {
    Object? arguments,
    required RoutePredicate predicate,
  }) {
    return Navigator.of(
      this,
    ).pushNamedAndRemoveUntil(routeName, predicate, arguments: arguments);
  }

  void pop() => Navigator.of(this).pop();
}

extension StringExtension on String? {
  bool isNullOrEmpty() => this == null || this == "";
}

extension ListExtension<T> on List<T>? {
  bool isNullOrEmpty() => this == null || this!.isEmpty;
}

void userLogOut(BuildContext context) async {
  await FirebaseAuth.instance.signOut();
  await SharedPrefHelper.clearAllData();
  await SharedPrefHelper.clearAllSecuredData();
  cleanCache();
  // ignore: use_build_context_synchronously
  context.pushReplacementNamed(Routes.login);
}
