import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:sayer_app/common/constants/app_sizes.dart';
import 'package:sayer_app/common/theming/app_colors.dart';

class AppTextField {
  AppTextField._();

  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: AppColors.darkGrey,
    suffixIconColor: AppColors.darkGrey,
    labelStyle: TextStyle().copyWith(
      fontSize: AppSizes.fontSizeMd.sp,
      color: AppColors.black,
    ),
    hintStyle: const TextStyle().copyWith(
      fontSize: AppSizes.fontSizeSm.sp,
      color: AppColors.black,
    ),
    errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
    floatingLabelStyle: const TextStyle().copyWith(
      color: AppColors.black.withOpacity(0.8),
    ),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(AppSizes.inputFieldRadius.r),
      borderSide: BorderSide(width: 1.sp, color: AppColors.grey),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(AppSizes.inputFieldRadius.r),
      borderSide: BorderSide(width: 1.sp, color: AppColors.grey),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(AppSizes.inputFieldRadius.r),
      borderSide: BorderSide(width: 1, color: AppColors.dark),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(AppSizes.inputFieldRadius.r),
      borderSide: BorderSide(width: 1.sp, color: AppColors.warning),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(AppSizes.inputFieldRadius.r),
      borderSide: BorderSide(width: 2.sp, color: AppColors.warning),
    ),
  );

  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 2,
    prefixIconColor: AppColors.darkGrey,
    suffixIconColor: AppColors.darkGrey,
    labelStyle: const TextStyle().copyWith(
      fontSize: AppSizes.fontSizeMd.sp,
      color: AppColors.white,
    ),
    hintStyle: const TextStyle().copyWith(
      fontSize: AppSizes.fontSizeSm.sp,
      color: AppColors.white,
    ),
    floatingLabelStyle: const TextStyle().copyWith(
      color: AppColors.white.withOpacity(0.8),
    ),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(AppSizes.inputFieldRadius.r),
      borderSide: BorderSide(width: 1.sp, color: AppColors.darkGrey),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(AppSizes.inputFieldRadius),
      borderSide: BorderSide(width: 1.sp, color: AppColors.darkGrey),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(AppSizes.inputFieldRadius.r),
      borderSide: BorderSide(width: 1.sp, color: AppColors.white),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(AppSizes.inputFieldRadius.r),
      borderSide: BorderSide(width: 1.sp, color: AppColors.warning),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(AppSizes.inputFieldRadius.r),
      borderSide: BorderSide(width: 2.sp, color: AppColors.warning),
    ),
  );
}
