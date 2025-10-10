import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sayer_app/common/widgets/cards/newest_offer_card.dart';
import 'package:sayer_app/features/home/data/model/car_offers_model.dart';

class FavouriteCard extends StatelessWidget {
  final List<CarOfferData?>? carOffers;
  final bool isFav;
  const FavouriteCard({super.key, this.isFav = false, this.carOffers});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: carOffers!.length,
      scrollDirection: Axis.vertical,
      itemBuilder: (_, index) {
        final carOfferData = carOffers![index];
        final carData = carOfferData!.car;
        final isLastItem = index == carOffers!.length - 1;
        return Padding(
          padding: EdgeInsets.only(
            left: 16.sp,
            right: 16.sp,
            top: 16.sp,
            bottom: isLastItem ? 80.sp : 16.sp,
          ),
          child: NewestOfferCard(
            brandName: carData.brand_id!.name!,
            carName: '${carData.name!} ${carData.model!}',
            imageUrl: carOfferData.image_ids.last.public_url!,
            monthlyPrice: carOfferData.monthlyPayment,
            originalPrice: carOfferData.originalPrice,
            discountAmount: carOfferData.discountAmount,
            offerName: carOfferData.name,
            isNetwork: true,
            carOfferData: carOfferData,
          ),
        );
      },
    );
  }
}
