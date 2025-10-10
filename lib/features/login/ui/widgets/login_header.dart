import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sayer_app/common/constants/app_sizes.dart';
import 'package:sayer_app/common/constants/app_text.dart';
import 'package:sayer_app/common/theming/app_colors.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: AppSizes.productItemHeight / 2,
      ),
      child: Column(
        children: [
          Image(
            fit: BoxFit.cover,
            height: 150.h,
            image: AssetImage('assets/images/Sayer_Logo.png'),
          ),
          SizedBox(height: 30.h),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSizes.defaultSpace,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text.rich(
                  TextSpan(
                    text: '${AppTexts.loginTitle} ',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: AppColors.darkgrey,
                      fontWeight: FontWeight.bold,
                      fontSize: 22.sp,
                    ),
                    children: [
                      TextSpan(
                        text: AppTexts.appName,
                        style: Theme.of(context).textTheme.headlineSmall
                            ?.copyWith(
                              color: AppColors.sSecondery,
                              fontWeight: FontWeight.bold,
                              fontSize: 22.sp,
                            ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: AppSizes.md.h),
                Text(
                  '${AppTexts.loginsubTitle}\n${AppTexts.verify}',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.textDarkBlue,
                    fontSize: 17.sp,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
