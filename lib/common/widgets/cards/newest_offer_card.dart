import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sayer_app/common/constants/app_sizes.dart';
import 'package:sayer_app/common/data/Cars/model/cars_model.dart';
import 'package:sayer_app/common/helpers/product_price.dart';
import 'package:sayer_app/common/helpers/user_session.dart';
import 'package:sayer_app/common/theming/app_colors.dart';
import 'package:sayer_app/common/widgets/custom_shape/app_container.dart';
import 'package:sayer_app/common/helpers/app_product_text_title.dart';
import 'package:sayer_app/common/widgets/custom_shape/circular_icon.dart';
import 'package:sayer_app/common/widgets/custom_shape/rounded_image.dart';
import 'package:sayer_app/common/widgets/popup/guest_notification.dart';
import 'package:sayer_app/features/home/data/model/car_offers_model.dart';
import 'package:intl/intl.dart';

///design of the card used in home screen to show the latest/newest offers
class NewestOfferCard extends StatelessWidget {
  final String brandName, offerName;
  final String carName;
  final String imageUrl;
  final double monthlyPrice;
  final double originalPrice;
  final double discountAmount;
  final CarData? cardata;
  final CarOfferData? carOfferData;
  final bool isNetwork;

  const NewestOfferCard({
    super.key,
    required this.brandName,
    required this.carName,
    required this.imageUrl,
    required this.monthlyPrice,
    required this.originalPrice,
    this.discountAmount = 0,
    this.offerName = '',
    this.cardata,
    this.carOfferData,
    this.isNetwork = false,
  });

  @override
  Widget build(BuildContext context) {
    final bool offers = offerName == '' ? false : true;

    return GestureDetector(
      onTap: () {
        isLoggedInUser
            ? print('carOfferData: $carOfferData')
            : showGuestToastMessage(
                context,
                "assets/icons/question.png",
                "جازت لك السيارة؟",
                "الرجاء تسجيل الدخول للوصول لتفاصيل أكثر  ",
              );
      },
      child: Stack(
        children: [
          if (offers)
            Positioned(
              child: Transform.rotate(
                angle: 7.85.spMax,
                child: AppContainer(
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.darkGrey.withOpacity(0.2),
                      blurRadius: 20,
                      spreadRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ],
                  height: 300.h,
                  width: 300.w,
                  backgroundColor: AppColors.white,
                  child: GradientText(
                    text: offerName,
                    style: Theme.of(
                      context,
                    ).textTheme.titleLarge!.copyWith(fontSize: 19.sp),
                  ),
                ),
              ),
            ),
          Padding(
            padding: EdgeInsets.only(right: offers ? 33.sp : 0.sp),
            child: AppContainer(
              boxShadow: [
                BoxShadow(
                  color: AppColors.darkGrey.withOpacity(0.2),
                  blurRadius: 20,
                  spreadRadius: 4,
                  offset: Offset(0, 1),
                ),
                BoxShadow(
                  color: AppColors.darkGrey.withOpacity(0.2),
                  blurRadius: 20,
                  spreadRadius: 1,
                  offset: Offset(4, 0),
                ),
                if (offers)
                  BoxShadow(
                    color: Colors.blue.withOpacity(0.12),
                    blurRadius: 20,
                    spreadRadius: 0,
                    offset: Offset(23, 0),
                  ),
              ],
              width: 270.w,
              padding: EdgeInsets.all(AppSizes.xs.sp),
              backgroundColor: AppColors.white,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 5.sp, left: 10.sp),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (offers)
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.sp),
                            child: CircularIcon(
                              width: 95.w,
                              height: 30.h,
                              backgroundColor: Colors.lightGreen.withOpacity(
                                0.9,
                              ),
                              icon: Iconsax.discount_shape,
                              size: AppSizes.lg.sp,
                              color: Colors.white,
                              dicountAmount: NumberFormat(
                                "##,###",
                              ).format(originalPrice / (100 / discountAmount)),
                            ),
                          ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            AppProductTextTitle(title: brandName),
                            AppProductTextTitle(
                              title: carName,
                              smallSize: true,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: AppSizes.sm.h),
                  SizedBox(
                    height: 150.h,
                    child: RoundedImage(
                      backgroundColor: Colors.transparent,
                      fit: BoxFit.contain,
                      imagmeUrl: imageUrl,
                      isNetworkImage: isNetwork,
                      applyImageRadius: true,
                    ),
                  ),
                  SizedBox(height: AppSizes.sm.h),
                  Text(
                    "البائع ${carOfferData!.dealership.name!}",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Divider(
                    color: AppColors.darkGrey,
                    thickness: 0.5,
                    indent: 10,
                    endIndent: 5,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: AppSizes.sm.sp),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ProductPrice(
                          upfrontPayment: NumberFormat(
                            "##,###",
                          ).format(carOfferData!.upfrontPayment),
                          finalPayment: NumberFormat(
                            "##,###",
                          ).format((carOfferData!.finalPayment)),
                          monthlyPrice: NumberFormat(
                            "##,###",
                          ).format(monthlyPrice),
                          carPrice: NumberFormat(
                            "##,###",
                          ).format(originalPrice),
                          carDicountPrice: NumberFormat("##,###").format(
                            (originalPrice -
                                (originalPrice / (100 / discountAmount))),
                          ),
                          discount: discountAmount != 0,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class GradientText extends StatelessWidget {
  final String text;
  final TextStyle style;

  const GradientText({super.key, required this.text, required this.style});

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => LinearGradient(
        colors: [Colors.blue, Colors.lightGreen],
        tileMode: TileMode.decal,
      ).createShader(bounds),
      child: Text(
        text,
        style: style.copyWith(color: Colors.blue.shade100),
        textAlign: TextAlign.center,
      ),
    );
  }
}
