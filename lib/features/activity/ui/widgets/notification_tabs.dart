import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sayer_app/common/constants/app_sizes.dart';
import 'package:sayer_app/features/activity/ui/widgets/sayer_notification.dart';
import 'package:sayer_app/features/activity/ui/widgets/user_orders.dart';

class NotificationTabs extends StatelessWidget {
  const NotificationTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.defaultSpace.sp / 2,
        vertical: AppSizes.defaultSpace.sp,
      ),
      child: TabBarView(children: [UserOrders(), SayerNotification()]),
    );
  }
}
