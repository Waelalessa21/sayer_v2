import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sayer_app/common/constants/app_sizes.dart';
import 'package:sayer_app/common/theming/app_colors.dart';

class CustomPopup extends StatelessWidget {
  final String title;
  final String subtitle;
  final String? imgageUrl;
  const CustomPopup({
    super.key,
    required this.title,
    required this.subtitle,
    this.imgageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.lightGrey,
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.defaultSpace.sp * 2,
        vertical: AppSizes.defaultSpace.sp,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 24.0.sp,
                color: AppColors.textDarkBlue,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          //
          SizedBox(height: AppSizes.spaceBtwItems.h),
          Align(
            alignment: Alignment.center,
            child: Text(
              subtitle,
              style: TextStyle(
                fontSize: 20.0.sp,
                color: AppColors.textDarkBlue,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Center(
            child: imgageUrl != null
                ? Image.asset(imgageUrl!, width: 350.w, height: 350.h)
                : Container(),
          ),
          SizedBox(height: AppSizes.appBarHeight.h * 2),
        ],
      ),
    );
  }
}
