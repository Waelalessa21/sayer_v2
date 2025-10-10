import 'package:flutter/material.dart';
import 'package:sayer_app/common/layout/app_default_bar.dart';
import 'package:sayer_app/common/layout/app_white_pattern.dart';
import 'package:sayer_app/features/activity/ui/widgets/activity_tabs.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({super.key});

  @override
  ActivityScreenState createState() => ActivityScreenState();
}

class ActivityScreenState extends State<ActivityScreen> {
  @override
  Widget build(BuildContext context) {
    return AppWhitePattern(
      appBar: AppDefaultBar(showbackArrow: false),
      child: const ActivityTabs(),
    );
  }
}
