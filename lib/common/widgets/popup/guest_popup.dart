import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sayer_app/common/constants/app_sizes.dart';
import 'package:sayer_app/common/theming/app_colors.dart';
import 'package:sayer_app/common/widgets/custom_shape/text_and_icon.dart';

class GuestPopup extends StatelessWidget {
  const GuestPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFE5E5E5),
        borderRadius: BorderRadius.all(Radius.circular(20.sp)),
      ),
      padding: EdgeInsets.all(AppSizes.spaceBtwSections.sp),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: TextAndIcon(
              iconPath: "assets/icons/add-group.png",
              label: "نتشرف بخدمتك",
              description: "سجل دخولك في ساير و أكمل رحلتك معنا",
              onPressed: () {},
            ),
          ),
          SizedBox(height: AppSizes.spaceBtwSections.h),
          SizedBox(
            width: double.infinity.w,
            child: ElevatedButton(
              onPressed: () {},
              child: Text(
                ' تسجيل الدخول',
                style: Theme.of(
                  context,
                ).textTheme.titleSmall!.apply(color: AppColors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
