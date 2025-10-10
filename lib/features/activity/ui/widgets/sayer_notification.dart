import 'package:flutter/material.dart';
import 'package:sayer_app/common/business/notification/firebase_notification.dart';
import 'package:sayer_app/common/helpers/user_session.dart';
import 'package:sayer_app/common/theming/app_colors.dart';
import 'package:sayer_app/features/activity/ui/widgets/empty_sayer_notification.dart';

class SayerNotification extends StatefulWidget {
  const SayerNotification({super.key});

  @override
  SayerNotificationState createState() => SayerNotificationState();
}

class SayerNotificationState extends State<SayerNotification> {
  List<Widget> _notificationWidgets = [];

  @override
  void initState() {
    super.initState();
    _loadNotifications();
  }

  Future<void> _loadNotifications() async {
    await loadNotifications();
    setState(() {
      _notificationWidgets = List.from(notficationsList);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        color: AppColors.primary,
        backgroundColor: AppColors.white,
        onRefresh: _loadNotifications,
        child: _notificationWidgets.isEmpty
            ? EmptySayerNotification(onTapReload: _loadNotifications)
            : ListView(children: _notificationWidgets),
      ),
    );
  }
}
