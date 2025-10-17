import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sayer_app/common/constants/app_sizes.dart';
import 'package:sayer_app/common/theming/app_colors.dart';
import 'package:sayer_app/features/carDetails/ui/widgets/car_info.dart';

import 'package:sayer_app/features/home/data/model/car_offers_model.dart';

class CarDetailsSection extends StatefulWidget {
  const CarDetailsSection({super.key, required this.carOfferData});
  final CarOfferData carOfferData;

  @override
  State<CarDetailsSection> createState() => _CarDetailsSectionState();
}

class _CarDetailsSectionState extends State<CarDetailsSection> {
  bool showMore = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.defaultSpace.sp,
        vertical: AppSizes.spaceBtwItems.sp,
      ),
      child: Column(
        children: [
          Details(
            title: 'اسم السيارة',
            value: widget.carOfferData.car.name ?? 'غير متوفر',
          ),
          Details(
            title: 'سنة التصنيع',
            value: widget.carOfferData.car.year?.toString() ?? 'غير متوفر',
          ),
          if (showMore) ...[
            Details(
              title: 'اللون',
              value: widget.carOfferData.car.color ?? 'غير متوفر',
            ),
            Details(
              title: 'الفئة',
              value: widget.carOfferData.car.model ?? 'غير متوفر',
            ),
            Details(
              title: 'معدل استهلاك الوقود',
              value:
                  widget.carOfferData.car.fuelEconomyRate?.toString() ??
                  'غير متوفر',
            ),
            ...?widget.carOfferData.car.featureIds?.map((feature) {
              return Details(
                title: feature.key ?? 'ميزة غير معروفة',
                value: feature.value ?? 'غير متوفر',
              );
            }),
            ...widget.carOfferData.features.map((feature) {
              return Details(
                title: feature.key ?? 'ميزة غير معروفة',
                value: feature.value ?? 'غير متوفر',
              );
            }),
          ],
          _buildToggleButton(),
        ],
      ),
    );
  }

  Widget _buildToggleButton() {
    return Theme(
      data: ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      child: ListTile(
        title: Text(
          showMore ? 'عرض أقل من التفاصيل' : 'عرض المزيد من التفاصيل',
          style: TextStyle(
            color: AppColors.black.withOpacity(0.5),
            fontSize: 16.sp,
            fontFamily: "sayerNewFont",
          ),
          textAlign: TextAlign.center,
        ),
        onTap: () {
          setState(() {
            showMore = !showMore;
          });
        },
      ),
    );
  }
}
