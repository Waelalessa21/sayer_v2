import 'package:flutter/material.dart';
import 'package:sayer_app/common/theming/app_colors.dart';
import 'package:sayer_app/features/activity/ui/widgets/notification_tabs.dart';

class ActivityTabs extends StatelessWidget {
  const ActivityTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          Container(
            color: Colors.transparent,
            child: TabBar(
              labelStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: AppColors.textDarkBlue,
                fontWeight: FontWeight.bold,
              ),
              unselectedLabelStyle: Theme.of(
                context,
              ).textTheme.titleSmall?.copyWith(color: AppColors.darkGrey),
              indicatorColor: AppColors.textDarkBlue,
              overlayColor: WidgetStatePropertyAll(Colors.transparent),
              tabs: const [
                Tab(text: 'طــلباتك'),
                Tab(text: 'ســاير'),
              ],
            ),
          ),
          const Expanded(child: NotificationTabs()),
        ],
      ),
    );
  }
}
