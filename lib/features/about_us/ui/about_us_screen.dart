import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:sayer_app/common/constants/app_sizes.dart';
import 'package:sayer_app/common/constants/app_text.dart';
import 'package:sayer_app/common/layout/app_default_bar.dart';
import 'package:sayer_app/common/layout/app_white_pattern.dart';
import 'package:sayer_app/common/theming/app_colors.dart';
import 'package:sayer_app/features/about_us/ui/widgets/about_us_footer.dart';
import 'package:sayer_app/features/about_us/ui/widgets/about_us_text.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({super.key});

  @override
  AboutUsScreenState createState() => AboutUsScreenState();
}

class AboutUsScreenState extends State<AboutUsScreen> {
  String _version = '';

  @override
  void initState() {
    super.initState();
    _loadVersion();
  }

  Future<void> _loadVersion() async {
    final info = await PackageInfo.fromPlatform();
    setState(() {
      _version = info.version;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppWhitePattern(
      appBar: AppDefaultBar(showbackArrow: true, arrowColor: AppColors.black),
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(AppSizes.spaceBtwItems.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: AppSizes.spaceBtwSections.h),
              const AboutUsText(
                title: 'من نحن',
                description: AppTexts.whoWeAre,
              ),
              const AboutUsText(title: 'هدفنا', description: AppTexts.goal),
              const AboutUsFooter(),
              SizedBox(height: 20.h),
              Text("الإصدار: v$_version"),
            ],
          ),
        ),
      ),
    );
  }
}
