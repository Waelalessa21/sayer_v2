import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sayer_app/common/helpers/extension.dart';
import 'package:sayer_app/common/routing/routes.dart';
import 'package:sayer_app/common/theming/app_colors.dart';

/// Show a guest toast message {only for features that require login}
void showGuestToastMessage(
  BuildContext context,
  String iconAssetPath,
  String message,
  String? desc, {
  String buttonText = "تسجيل الدخول",
}) {
  final Color backgroundColor = AppColors.lightGrey;

  showDialog(
    context: context,
    barrierDismissible: true,
    barrierColor: Colors.black.withOpacity(0.7),
    builder: (BuildContext context) {
      return Align(
        alignment: Alignment.topCenter,
        child: FadeInUp(
          from: 20,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20.w),
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(35.sp),
              gradient: LinearGradient(
                colors: [
                  backgroundColor.withOpacity(0.9),
                  backgroundColor.withOpacity(0.8),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  spreadRadius: 2,
                  offset: const Offset(0, 4),
                ),
              ],
              border: Border.all(
                color: AppColors.info.withOpacity(0.2),
                width: 1,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: Icon(
                        Icons.close,
                        color: Colors.black.withOpacity(0.6),
                        size: 20.w,
                      ),
                    ),
                    Container(
                      width: 36.w,
                      height: 36.w,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 4,
                            spreadRadius: 1,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Image.asset(
                          iconAssetPath,
                          width: 24.w,
                          height: 24.w,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    SizedBox(width: 20.w),
                  ],
                ),
                SizedBox(height: 8.h),
                Text(
                  message,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.none,
                    fontFamily: "sayerNewFont",
                  ),
                ),
                if (desc != null) ...[
                  SizedBox(height: 8.h),
                  Text(
                    desc,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.sSecondery,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.none,
                      fontFamily: "sayerNewFont",
                    ),
                  ),
                ],
                SizedBox(height: 24.h),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.r),
                      ),
                      overlayColor: Colors.transparent,
                    ),
                    onPressed: () {
                      context.pushNamed(Routes.login);
                    },
                    child: Text(
                      buttonText,
                      style: Theme.of(
                        context,
                      ).textTheme.titleSmall!.apply(color: AppColors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
