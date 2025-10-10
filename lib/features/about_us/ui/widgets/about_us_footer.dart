import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sayer_app/common/constants/app_sizes.dart';
import 'package:sayer_app/common/theming/app_colors.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUsFooter extends StatelessWidget {
  const AboutUsFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: AppSizes.spaceBtwSections.sp),
          child: Row(
            children: [
              Expanded(child: Divider(thickness: 0.8, color: AppColors.black)),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppSizes.spaceBtwItems.sp,
                ),
                child: Text(
                  'تابعونا عبر',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: AppColors.black,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Expanded(child: Divider(thickness: 0.8, color: AppColors.black)),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: AppSizes.spaceBtwItems.sp),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () async {
                      const url = 'https://x.com/GetSayeer';
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                    child: Image.asset("assets/icons/twitter_logo.png"),
                  ),
                  SizedBox(width: AppSizes.spaceBtwItems.w),
                  GestureDetector(
                    onTap: () async {
                      const url = 'https://www.linkedin.com/company/sayeer/';
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                    child: Image.asset(
                      "assets/icons/linkdin.png",
                      width: 30.sp,
                    ),
                  ),
                  SizedBox(width: AppSizes.spaceBtwItems.w),
                  GestureDetector(
                    onTap: () async {
                      const url = 'https://www.tiktok.com/@getsayer';
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                    child: Image.asset("assets/icons/tiktok.png", width: 35.sp),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
