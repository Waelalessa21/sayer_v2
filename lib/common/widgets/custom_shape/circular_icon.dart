import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sayer_app/common/constants/app_sizes.dart';
import 'package:sayer_app/common/theming/app_colors.dart';

class CircularIcon extends StatelessWidget {
  const CircularIcon({
    super.key,
    this.width,
    this.height,
    this.size = AppSizes.sm,
    required this.icon,
    this.color,
    this.backgroundColor,
    this.onPressed,
    required this.dicountAmount,
  });

  final double? width, height, size;
  final IconData icon;
  final Color? color;
  final Color? backgroundColor;
  final VoidCallback? onPressed;
  final String dicountAmount;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color: backgroundColor != null
            ? backgroundColor!
            : AppColors.white.withOpacity(0.9),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 3.0.sp),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: 5.w),
            Icon(icon, color: color ?? AppColors.primary, size: 20.sp),
            SizedBox(width: 3.w),
            Text(
              'وفر'
              ' $dicountAmount',
              style: Theme.of(
                context,
              ).textTheme.labelMedium!.copyWith(color: color),
            ),
            SizedBox(width: 5.w),
          ],
        ),
      ),
    );
  }
}
