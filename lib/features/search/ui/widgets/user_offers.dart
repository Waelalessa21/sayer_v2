import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sayer_app/common/widgets/cards/newest_offer_card.dart';
import 'package:sayer_app/features/home/data/model/car_offers_model.dart';

class UserOffers extends StatelessWidget {
  final List<CarOfferData?>? carOffers;
  final bool isFav;
  const UserOffers({super.key, required this.carOffers, this.isFav = false});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: carOffers!.length,
      scrollDirection: Axis.vertical,
      itemBuilder: (_, index) {
        final carOffersData = carOffers![index];
        final carData = carOffersData!.car;
        final carType = carData.model != "" ? carData.model : carData.model;
        final isLastItem = index == carOffers!.length - 1;

        return Center(
          child: Padding(
            padding: EdgeInsets.only(
              top: 16.sp,
              bottom: isLastItem ? 80.sp : 16.sp,
            ),
            child: NewestOfferCard(
              brandName: carData.brand_id!.name!,
              carName: '${carData.name!} ${carType!}',
              imageUrl: carOffersData.image_ids.last.public_url!,
              monthlyPrice: carOffersData.monthlyPayment,
              originalPrice: carOffersData.originalPrice,
              discountAmount: carOffersData.discountAmount,
              offerName: carOffersData.name,
              isNetwork: true,
              carOfferData: carOffersData,
            ),
          ),
        );
      },
    );
  }
}
