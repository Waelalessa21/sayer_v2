import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sayer_app/common/theming/app_colors.dart';

class HomeSmallCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback? onPressed;
  final Widget? leading;

  const HomeSmallCard({
    super.key,
    this.onPressed,
    required this.title,
    required this.subtitle,
    this.leading,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 200.w,
        height: 80.h,
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: AppColors.lightGrey, width: 2.w),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            if (leading != null) ...[leading!, SizedBox(width: 10.w)],
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 13.sp,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 3.h),
                  Text(
                    subtitle,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontSize: 10.sp,
                      color: Colors.grey[600],
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
