import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sayer_app/common/helpers/extension.dart';
import 'package:sayer_app/common/theming/app_colors.dart';
import 'package:sayer_app/common/widgets/buttons/confirm_button.dart';
import 'package:sayer_app/common/widgets/popup/show_toast_message.dart';

class MehtarNotAvailable extends StatelessWidget {
  const MehtarNotAvailable({super.key});

  @override
  Widget build(BuildContext context) {
    return FadeInDown(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.lightContainer,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20.sp)),
            ),
            padding: EdgeInsets.all(16.sp),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.sp),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary.withOpacity(0.12),
                    blurRadius: 41,
                    spreadRadius: 6,
                    offset: Offset(50, 1),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Text(
                    "خدمة محــتار",
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Container(
                    padding: EdgeInsets.all(4.sp),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppColors.borderPrimary,
                        width: 1,
                      ),
                    ),
                    child: Image.asset(
                      "assets/images/Sayer_Logo.png",
                      width: 35.w,
                      height: 35.h,
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(height: 1, color: AppColors.lightGrey.withOpacity(0.8)),
          Container(
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(20.sp),
              ),
            ),
            padding: EdgeInsets.all(16.sp),
            child: Column(
              children: [
                Text(
                  "نحن نعمل على تطوير الخدمة حاليًا، اضغط على الزر ليتم إشعارك عند تفعيلها.",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.w400,
                    color: AppColors.darkGrey,
                    fontSize: 15.sp,
                    height: 1.8,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20.h),
                ConfirmButton(
                  isConfirm: true,
                  text: "ابلغني",
                  onPressed: () {
                    context.pop();
                    showToastMessage(
                      context,
                      "سيتم إبلاغك فور تفعيل الخدمة",
                      "assets/icons/send.png",
                      isError: false,
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
