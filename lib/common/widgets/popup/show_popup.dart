import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sayer_app/common/helpers/extension.dart';
import 'package:sayer_app/common/theming/app_colors.dart';

/// This function is used to show a bottom sheet with a child widget
showpopupsheet(
  BuildContext context,
  Widget child, {
  bool isDismissible = true,
  String goWhere = '/login',
}) {
  showModalBottomSheet(
    backgroundColor: AppColors.lightGrey,
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(10.r)),
    ),
    isScrollControlled: true,
    isDismissible: isDismissible,
    enableDrag: isDismissible,
    builder: (BuildContext context) {
      return GestureDetector(
        onVerticalDragEnd: (details) {
          if (details.velocity.pixelsPerSecond.dy > 0) {
            if (!isDismissible) context.pushNamed(goWhere);
          }
        },
        child: Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: child,
        ),
      );
    },
  );
}
