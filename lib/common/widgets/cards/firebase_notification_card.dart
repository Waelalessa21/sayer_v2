import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sayer_app/common/constants/app_sizes.dart';
import 'package:sayer_app/common/theming/app_colors.dart';
import 'package:sayer_app/common/widgets/custom_shape/rounded_image.dart';

class FireBaeNotificationCard extends StatefulWidget {
  final String title;
  final String subtitle;
  final String time;
  final String logo;

  const FireBaeNotificationCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.time,
    this.logo = "assets/images/Sayer_Logo.png",
  });

  @override
  State<FireBaeNotificationCard> createState() =>
      _FireBaeNotificationCardState();
}

class _FireBaeNotificationCardState extends State<FireBaeNotificationCard>
    with SingleTickerProviderStateMixin {
  bool show = false;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'Card',
      child: AnimatedContainer(
        height: show ? 360.h : 125.h,
        duration: Duration(milliseconds: 750),
        curve: Curves.easeInOut,
        child: Card(
          color: Colors.white,
          shadowColor: AppColors.black,
          margin: EdgeInsets.all(AppSizes.spaceBtwItems.sp / 2.sp),
          child: Padding(
            padding: EdgeInsets.all(AppSizes.spaceBtwItems.sp),
            child: Column(
              children: [
                Row(
                  children: [
                    Image.asset(
                      widget.logo,
                      width: 40.w,
                      height: 40.h,
                      fit: BoxFit.contain,
                    ),
                    SizedBox(width: AppSizes.spaceBtwItems.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.title,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: AppSizes.xs.h),
                          Text(widget.subtitle),
                          SizedBox(height: AppSizes.xs.h),
                          Text(
                            widget.time,
                            style: const TextStyle(color: AppColors.darkerGrey),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                if (show) ...[
                  Expanded(
                    child: RoundedImage(
                      backgroundColor: Colors.transparent,
                      fit: BoxFit.fill,
                      imagmeUrl: "assets/images/Sayer_Logo.png",
                      isNetworkImage: false,
                      applyImageRadius: true,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class test extends StatelessWidget {
  final String title2;
  final String title;
  final String subtitle;
  final String time;
  final String logo;
  const test({
    super.key,
    required this.title,
    required this.title2,
    required this.subtitle,
    required this.time,
    required this.logo,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Hero(
        tag: title2,
        child: Stack(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                color: Colors.black.withOpacity(0.5),
                height: double.infinity,
                width: double.infinity,
              ),
            ),
            Align(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.r),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.black.withOpacity(0.2),
                      blurRadius: 20,
                      spreadRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                height: 125.h,
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.all(AppSizes.spaceBtwItems.sp),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            logo,
                            width: 40.w,
                            height: 40.h,
                            fit: BoxFit.contain,
                          ),
                          SizedBox(width: AppSizes.spaceBtwItems.w),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  title,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: AppSizes.xs.h),
                                Text(subtitle),
                                SizedBox(height: AppSizes.xs.h),
                                Text(
                                  time,
                                  style: const TextStyle(
                                    color: AppColors.darkerGrey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 20.sp,
                            color: AppColors.textDarkBlue,
                          ),
                        ],
                      ),
                      Expanded(
                        child: RoundedImage(
                          backgroundColor: Colors.transparent,
                          fit: BoxFit.fill,
                          imagmeUrl: "assets/images/Sayer_Logo.png",
                          isNetworkImage: false,
                          applyImageRadius: true,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
