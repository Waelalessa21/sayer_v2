import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sayer_app/common/constants/app_sizes.dart';
import 'package:sayer_app/common/layout/app_default_bar.dart';
import 'package:sayer_app/common/layout/app_white_pattern.dart';
import 'package:sayer_app/features/services/ui/widgets/list_of_services.dart';
import 'package:sayer_app/features/services/ui/widgets/services_header.dart';

class ServicesScreen extends StatefulWidget {
  const ServicesScreen({super.key});

  @override
  ServicesScreenState createState() => ServicesScreenState();
}

class ServicesScreenState extends State<ServicesScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: AppWhitePattern(
        appBar: AppDefaultBar(
          showbackArrow: true,
          arrowColor: Colors.black,
          goBack: 'home',
        ),
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(AppSizes.defaultSpace.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ServicesHeader(),
                SizedBox(height: AppSizes.xl.h),
                ServicesCardList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
