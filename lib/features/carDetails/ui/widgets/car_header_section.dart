import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:sayer_app/common/constants/app_sizes.dart';
import 'package:sayer_app/common/theming/app_colors.dart';

import 'package:sayer_app/features/carDetails/ui/widgets/car_image_name.dart';
import 'package:sayer_app/features/home/data/model/car_offers_model.dart';

class CarHeaderSection extends StatelessWidget {
  final CarOfferData carOfferData;

  const CarHeaderSection({super.key, required this.carOfferData});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarImageAndIcons(
          upfrontPayment: NumberFormat(
            "##,###",
          ).format(carOfferData.upfrontPayment),
          finalPayment: NumberFormat(
            "##,###",
          ).format(carOfferData.finalPayment),
          financeLength: carOfferData.financeLength ?? '',
          financedBy: carOfferData.financedBy ?? '',
          imageCarList: [carOfferData.image_ids.last.public_url],
          carName:
              '${carOfferData.car.name ?? 'غير معروف'} ${carOfferData.car.model ?? ''}',
          monthPrice: carOfferData.monthlyPayment.toString(),
          carPrice: carOfferData.originalPrice.toString(),
          carDicountPrice: NumberFormat("##,###").format(
            carOfferData.originalPrice -
                (carOfferData.originalPrice /
                    (100 / carOfferData.discountAmount)),
          ),
        ),
        SizedBox(height: AppSizes.xxs.h),
        Divider(height: 8.h, color: AppColors.grey, thickness: 1.5.sp),
      ],
    );
  }
}
