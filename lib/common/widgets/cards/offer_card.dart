import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sayer_app/common/widgets/animation/animated_item.dart';
import 'package:sayer_app/common/widgets/cards/newest_offer_card.dart';
import 'package:sayer_app/features/home/data/model/car_offers_model.dart';

class OfferCard extends StatelessWidget {
  final List<CarOfferData?>? carOffers;
  final ScrollController scrollController;

  const OfferCard({
    super.key,
    required this.carOffers,
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height.h * 0.85,
          child: ListView.builder(
            clipBehavior: Clip.hardEdge,
            controller: scrollController,
            shrinkWrap: false,
            physics: const AlwaysScrollableScrollPhysics(),
            itemCount: carOffers!.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (_, index) {
              final carOffersData = carOffers![index];
              final carData = carOffersData!.car;
              final carType = carData.model != ""
                  ? carData.model
                  : carData.brand_id!.name!;
              final isLastItem = index == carOffers!.length - 1;

              return Center(
                child: AnimatedItem(
                  index: index,
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 16.sp,
                      right: 16.sp,
                      top: 16.sp,
                      bottom: isLastItem ? 80.sp : 16.sp,
                    ),
                    child: NewestOfferCard(
                      brandName: carData.brand_id!.name!,
                      carName: '${carData.name!} $carType',
                      imageUrl: carOffersData.image_ids.last.public_url!,
                      monthlyPrice: carOffersData.monthlyPayment,
                      originalPrice: carOffersData.originalPrice,
                      discountAmount: carOffersData.discountAmount,
                      offerName: carOffersData.name,
                      isNetwork: true,
                      carOfferData: carOffersData,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          height: 60.h,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.white, Colors.white.withOpacity(0.0)],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
