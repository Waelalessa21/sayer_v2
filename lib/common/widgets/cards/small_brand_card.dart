import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sayer_app/common/constants/app_sizes.dart';
import 'package:sayer_app/common/theming/app_colors.dart';

class SmallBrandCard extends StatelessWidget {
  const SmallBrandCard({
    super.key,
    this.image,
    this.title = '',
    this.backgroundColor = AppColors.white,
    this.onTap,
  });

  final String? image, title;
  final Color? backgroundColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(left: AppSizes.spaceBtwItems.sp / 2.sp),
        child: Column(
          children: [
            Container(
              width: 75.w,
              height: 75.h,
              padding: EdgeInsets.all(AppSizes.sm.sp),
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.borderSecondary.withOpacity(0.550),
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.darkGrey.withOpacity(0.2),
                    blurRadius: 20,
                    spreadRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
                color: backgroundColor,
                borderRadius: BorderRadius.circular(15.r),
              ),
              child: Center(
                child: Image(
                  image: Image.network(image!).image,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Image.asset(
                      "assets/images/ImageNotLoading.png",
                      fit: BoxFit.cover,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
