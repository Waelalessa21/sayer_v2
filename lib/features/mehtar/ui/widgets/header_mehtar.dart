import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sayer_app/common/constants/app_sizes.dart';

class HeaderMehtar extends StatelessWidget {
  const HeaderMehtar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: AppSizes.spaceBtwSections / 2.h),
        RichText(
          text: TextSpan(
            text: 'محتار!\n',
            style: Theme.of(context).textTheme.headlineMedium,
            children: [
              TextSpan(
                text: 'ساير حلها، ',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              TextSpan(
                text:
                    'قم بإدخال معلومات دخلك لمساعدتك في اختبار السيارة المناسبة لك',
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
