import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sayer_app/common/constants/app_sizes.dart';
import 'package:sayer_app/common/theming/app_colors.dart';
import 'package:sayer_app/common/widgets/custom_shape/app_expansion_tile.dart';
import 'package:sayer_app/features/carDetails/ui/widgets/car_details_section.dart';
import 'package:sayer_app/features/carDetails/ui/widgets/sliderImage.dart';

import 'package:sayer_app/features/home/data/model/car_offers_model.dart';

class CarDetailsContent extends StatelessWidget {
  final CarOfferData carOfferData;

  const CarDetailsContent({super.key, required this.carOfferData});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.xs),
      child: Column(
        children: [
          AppExpansionTile(
            title: 'نظرة عامة',
            content: carOfferData.car.description ?? 'لا توجد تفاصيل.',
            initiallyExpanded: true,
          ),
          Divider(height: 8.h, color: AppColors.grey, thickness: 0.5.sp),
          AppExpansionTile(
            title: 'صور السيارة',
            widgetContent: carOfferData.image_ids.isNotEmpty
                ? ImageSlider(
                    imagesList: carOfferData.image_ids
                        .map((e) => e.public_url ?? '')
                        .where((url) => url.isNotEmpty)
                        .cast<String>()
                        .toList(),
                  )
                : Text('لا توجد صور متاحة.'),
            initiallyExpanded: false,
          ),
          Divider(height: 8.h, color: AppColors.grey, thickness: 0.5.sp),
          CarDetailsSection(carOfferData: carOfferData),
        ],
      ),
    );
  }
}
