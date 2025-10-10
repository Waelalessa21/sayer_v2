import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sayer_app/common/constants/app_sizes.dart';
import 'package:sayer_app/common/helpers/extension.dart';
import 'package:sayer_app/common/helpers/user_session.dart';
import 'package:sayer_app/common/routing/routes.dart';
import 'package:sayer_app/common/theming/app_colors.dart';
import 'package:sayer_app/common/widgets/custom_shape/app_section_heading.dart';
import 'package:sayer_app/common/widgets/popup/guest_notification.dart';
import 'package:sayer_app/features/home/data/model/brands_model.dart';
import 'package:sayer_app/features/home/ui/widgets/home_brands_horizontal_list.dart';

class CarBrands extends StatelessWidget {
  final List<BrandData?>? brands;
  const CarBrands({super.key, required this.brands});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppSectionHeading(
          title: 'وكــلائنا',
          showActionButton: true,
          textColor: AppColors.darkerGrey,
          onPressed: () {
            isLoggedInUser
                ? context.pushNamed(Routes.brands)
                : showGuestToastMessage(
                    context,
                    "assets/icons/exclusive.png",
                    "عروض الوكلاء",
                    "الرجاء تسجيل الدخول لاستخدام هذه الميزة",
                  );
          },
        ),
        Column(
          children: [
            SizedBox(height: AppSizes.xxs.h),
            HomeBrandsHorizontalList(brand: brands),
          ],
        ),
      ],
    );
  }
}

//context.pushNamed(Routes.ShowallBrand, extra: brands)
