import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sayer_app/common/constants/app_sizes.dart';
import 'package:sayer_app/common/theming/app_colors.dart';

class AppElevatedButton {
  AppElevatedButton._();

  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: AppColors.light,
      backgroundColor: AppColors.sButtomColor,
      disabledForegroundColor: AppColors.darkGrey,
      disabledBackgroundColor: AppColors.buttonDisabled,
      side: const BorderSide(color: AppColors.sButtomColor),
      padding: EdgeInsets.symmetric(vertical: AppSizes.buttonHeight.sp),
      textStyle: TextStyle(
        fontSize: 16.sp,
        color: AppColors.textWhite,
        fontWeight: FontWeight.w600,
        fontFamily: 'sayerNewFont',
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSizes.buttonRadius.r),
      ),
    ),
  );

  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: AppColors.light,
      backgroundColor: AppColors.sButtomColor,
      disabledForegroundColor: AppColors.darkGrey,
      disabledBackgroundColor: AppColors.darkerGrey,
      side: const BorderSide(color: AppColors.sButtomColor),
      padding: EdgeInsets.symmetric(vertical: AppSizes.buttonHeight.sp),
      textStyle: TextStyle(
        fontSize: 16.sp,
        color: AppColors.textWhite,
        fontWeight: FontWeight.w600,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSizes.buttonRadius.r),
      ),
    ),
  );
}
