import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:sayer_app/common/layout/app_default_bar.dart';
import 'package:sayer_app/common/layout/app_white_pattern.dart';
import 'package:sayer_app/common/theming/app_colors.dart';
import 'package:sayer_app/features/home/data/model/car_offers_model.dart';

class UpPart extends StatelessWidget {
  final CarOfferData offer;

  const UpPart({super.key, required this.offer});

  @override
  Widget build(BuildContext context) {
    final formatter = NumberFormat('#,###', 'en');
    final imageUrl = offer.image_ids.isNotEmpty
        ? offer.image_ids.last.public_url
        : null;

    final carName = offer.car.name ?? 'اسم غير معروف';
    final priceBefore = offer.originalPrice;
    final double discount = offer.discountAmount;
    final priceAfter = priceBefore * (1 - discount / 100);

    return SizedBox(
      height: 0.47.sh,
      child: AppWhitePattern(
        appBar: AppDefaultBar(
          showbackArrow: true,
          arrowColor: AppColors.black,
          action: [
            Icon(Icons.favorite_border, color: AppColors.black, size: 24.sp),
            SizedBox(width: 12.w),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 20.h),
              child: Text(
                carName,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22.sp,
                  color: AppColors.black,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
            ),

            // 🔹 صورة السيارة
            if (imageUrl != null)
              Padding(
                padding: EdgeInsets.only(top: 0.h, bottom: 0.h),
                child: Transform.translate(
                  offset: const Offset(0, -35),
                  child: Image.network(
                    imageUrl,
                    height: 180.h,
                    fit: BoxFit.contain,
                  ),
                ),
              ),

            Transform.translate(
              offset: const Offset(0, -32),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Text(
                            formatter.format(priceBefore),
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 17.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Positioned(
                            top: 9,
                            child: Container(
                              width:
                                  (formatter.format(priceBefore).length * 9).w,
                              height: 1,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 4.w),
                      Image.asset(
                        'assets/icons/sar.png',
                        color: Colors.black,
                        height: 16.h,
                      ),
                    ],
                  ),

                  SizedBox(width: 12.w),

                  Row(
                    children: [
                      Text(
                        formatter.format(priceAfter),
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          fontSize: 19.sp,
                        ),
                      ),
                      SizedBox(width: 4.w),
                      Image.asset(
                        'assets/icons/sar.png',
                        color: Colors.green,
                        height: 16.h,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Transform.translate(
              offset: const Offset(0, -28),
              child: Text(
                '(الأسعار مع الضريبة)',
                style: TextStyle(fontSize: 12.sp, color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
