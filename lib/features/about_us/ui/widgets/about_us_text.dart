import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sayer_app/common/constants/app_sizes.dart';
import 'package:sayer_app/common/theming/app_colors.dart';

class AboutUsText extends StatelessWidget {
  final String title;
  final String description;

  const AboutUsText({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppSizes.defaultSpace.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            textAlign: TextAlign.justify,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: AppColors.textDarkBlue,
              fontWeight: FontWeight.bold,
              fontSize: 20.sp,
            ),
          ),
          SizedBox(height: AppSizes.spaceBtwSections.h / 4.h),
          Text(
            textAlign: TextAlign.justify,
            description,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(fontSize: 15.sp, height: 1.5),
          ),
        ],
      ),
    );
  }
}
