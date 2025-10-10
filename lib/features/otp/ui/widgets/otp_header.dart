import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sayer_app/common/constants/app_sizes.dart';
import 'package:sayer_app/common/constants/app_text.dart';

class OTPHeader extends StatelessWidget {
  const OTPHeader({super.key, required this.phoneNumber});

  final String phoneNumber;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppSizes.xs.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: AppSizes.iconSm.h),
          Text(
            AppTexts.confirmPhoneNum,
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: AppSizes.spaceBtwItems.h),
          Text(
            'تم إرسال كود على الرقم ( $phoneNumber )',
            style: Theme.of(context).textTheme.titleSmall,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: AppSizes.spaceBtwSections.h),
          Text(
            AppTexts.otpEnterText,
            style: Theme.of(context).textTheme.labelMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
