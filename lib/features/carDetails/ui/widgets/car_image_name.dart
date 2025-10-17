import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sayer_app/common/constants/app_sizes.dart';

class CarImageAndIcons extends StatelessWidget {
  final List imageCarList;
  final String carName;
  final String carPrice;
  final String monthPrice;
  final bool hasDiscount;
  final String carDicountPrice;
  final String upfrontPayment;
  final String finalPayment;
  final String financeLength;
  final String financedBy;

  const CarImageAndIcons({
    super.key,
    required this.imageCarList,
    required this.carName,
    required this.carPrice,
    required this.monthPrice,
    this.hasDiscount = false,
    this.carDicountPrice = '',
    this.upfrontPayment = "",
    this.finalPayment = "",
    this.financeLength = "",
    this.financedBy = "",
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.spaceBtwItems.sp,
        vertical: AppSizes.xs.sp,
      ),
      child: Column(
        children: [
          CarImage(imagesList: imageCarList),
          SizedBox(height: AppSizes.spaceBtwSections.h),
          Text(carName, style: Theme.of(context).textTheme.headlineMedium),
          SizedBox(height: AppSizes.xxs.h),
          if (monthPrice != '0.0') ...[
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: '$monthPrice ',
                    style: Theme.of(context).textTheme.titleLarge!.apply(
                      fontSizeDelta: 2,
                      color: Colors.lightGreen,
                    ),
                  ),
                  WidgetSpan(
                    child: Image.asset(
                      'assets/icons/sar.png',
                      width: 20,
                      height: 20,
                      color: Colors.lightGreen,
                    ),
                  ),
                  TextSpan(
                    text: ' شهرياً',
                    style: Theme.of(
                      context,
                    ).textTheme.titleLarge!.apply(color: Colors.lightGreen),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'دفعة أولى ',
                        style: Theme.of(context).textTheme.bodySmall!.apply(),
                      ),
                      TextSpan(
                        text: '$upfrontPayment ',
                        style: Theme.of(
                          context,
                        ).textTheme.bodyMedium!.apply(fontSizeDelta: 1.2),
                      ),
                      WidgetSpan(
                        child: Image.asset(
                          'assets/icons/sar.png',
                          width: 16,
                          height: 16,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 20.w),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'دفعة أخيرة ',
                        style: Theme.of(context).textTheme.bodySmall!.apply(),
                      ),
                      TextSpan(
                        text: '$finalPayment ',
                        style: Theme.of(
                          context,
                        ).textTheme.bodyMedium!.apply(fontSizeDelta: 1.2),
                      ),
                      WidgetSpan(
                        child: Image.asset(
                          'assets/icons/sar.png',
                          width: 16,
                          height: 16,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'مدة التمويل : ',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      TextSpan(
                        text: '$financeLength ',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 20.w),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'مقدم التمويل : ',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          TextSpan(
                            text: '$financedBy ',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ] else
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "$carPrice ",
                        style: Theme.of(context).textTheme.headlineSmall!.apply(
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                      WidgetSpan(
                        child: Image.asset(
                          'assets/icons/sar.png',
                          width: 16,
                          height: 16,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 20.w),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: '$carDicountPrice ',
                        style: Theme.of(context).textTheme.headlineSmall!.apply(
                          fontSizeDelta: 4,
                          color: Colors.lightGreen,
                        ),
                      ),
                      WidgetSpan(
                        child: Image.asset(
                          'assets/icons/sar.png',
                          width: 16,
                          height: 16,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          SizedBox(height: AppSizes.xxs.h),
          Text(
            '(الاسعار مع الضريبة)',
            style: Theme.of(context).textTheme.labelMedium,
          ),
        ],
      ),
    );
  }
}

class CarImage extends StatelessWidget {
  final List imagesList;

  const CarImage({super.key, required this.imagesList});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230.h,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: Colors.transparent,
      ),
      child: imagesList.isNotEmpty
          ? ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: Image.network(
                imagesList.first,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey[300],
                    child: Icon(
                      Icons.car_rental,
                      size: 50.sp,
                      color: Colors.grey[600],
                    ),
                  );
                },
              ),
            )
          : Container(
              color: Colors.grey[300],
              child: Icon(
                Icons.car_rental,
                size: 50.sp,
                color: Colors.grey[600],
              ),
            ),
    );
  }
}
