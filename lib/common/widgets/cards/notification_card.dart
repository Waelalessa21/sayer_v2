import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sayer_app/common/constants/app_sizes.dart';
import 'package:sayer_app/common/theming/app_colors.dart';

class NotificationCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imagePath;

  const NotificationCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.imagePath,
  });

  final bool show = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.sp)),
      child: Padding(
        padding: EdgeInsets.all(AppSizes.spaceBtwItems.sp),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 50.w,
                  height: 50.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(
                      color: AppColors.grey.withOpacity(0.9),
                      width: 1,
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12.r),
                    child: Image.asset(
                      imagePath,
                      fit: BoxFit.scaleDown,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),
                ),
                SizedBox(width: AppSizes.spaceBtwSections.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: AppSizes.xs.h),
                      Text(subtitle),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
