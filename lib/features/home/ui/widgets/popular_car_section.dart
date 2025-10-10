import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sayer_app/common/constants/app_sizes.dart';
import 'package:sayer_app/common/data/Cars/model/cars_model.dart';
import 'package:sayer_app/common/helpers/user_session.dart';
import 'package:sayer_app/common/theming/app_colors.dart';
import 'package:sayer_app/common/widgets/cards/newest_offer_card.dart';
import 'package:sayer_app/common/widgets/custom_shape/app_section_heading.dart';
import 'package:sayer_app/common/widgets/popup/guest_notification.dart';

import 'package:sayer_app/features/home/data/model/car_offers_model.dart';

class PopularCarSection extends StatelessWidget {
  final List<CarOfferData?>? carOffer;
  const PopularCarSection({super.key, required this.carOffer});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppSectionHeading(
          title: 'أحــدث العروض',
          showActionButton: false,
          textColor: AppColors.darkerGrey,
          onPressed: () {
            isLoggedInUser
                ? print('carOffer: $carOffer')
                : showGuestToastMessage(
                    context,
                    "assets/icons/exclusive.png",
                    "عروض الوكلاء",
                    "الرجاء تسجيل الدخول لاستخدام هذه الميزة",
                  );
          },
        ),
        SizedBox(
          height: 310.h,
          width: double.infinity.w,
          child: ListView.builder(
            clipBehavior: Clip.none,
            physics: AlwaysScrollableScrollPhysics(),
            shrinkWrap: false,
            itemCount: carOffer!.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) {
              final CarData carData = carOffer![index]!.car;
              final carType = carData.model != ""
                  ? carData.model
                  : carData.description!;

              return Padding(
                padding: EdgeInsets.only(left: AppSizes.spaceBtwItems.sp),
                child: NewestOfferCard(
                  carOfferData: carOffer![index],
                  cardata: carData,
                  brandName: carData.brand_id!.name!,
                  carName: "${carData.name!} $carType",
                  imageUrl: carOffer![index]!.image_ids.last.public_url!,
                  monthlyPrice: carOffer![index]!.monthlyPayment,
                  originalPrice: carOffer![index]!.originalPrice,
                  offerName: carOffer![index]!.name,
                  discountAmount: carOffer![index]!.discountAmount,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
