import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductPrice extends StatelessWidget {
  final String carPrice,
      monthlyPrice,
      carDicountPrice,
      upfrontPayment,
      finalPayment;
  final int maxLines;
  final bool isLarge;
  final bool lineThrough;
  final bool discount;

  const ProductPrice({
    super.key,
    this.carPrice = '',
    this.monthlyPrice = '',
    this.maxLines = 2,
    this.isLarge = false,
    this.lineThrough = false,
    this.discount = false,
    this.carDicountPrice = '',
    this.upfrontPayment = "",
    this.finalPayment = "",
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text.rich(
          TextSpan(
            children: [
              if (monthlyPrice != '0') ...[
                TextSpan(
                  text: '$monthlyPrice ',
                  style: Theme.of(context).textTheme.titleLarge!.apply(
                    decoration: lineThrough ? TextDecoration.lineThrough : null,
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
                  style: Theme.of(context).textTheme.titleLarge!.apply(
                    decoration: lineThrough ? TextDecoration.lineThrough : null,
                    color: Colors.lightGreen,
                  ),
                ),
                TextSpan(text: '\n'),
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'دفعة أولى   ',
                      style: Theme.of(
                        context,
                      ).textTheme.bodySmall!.apply(fontSizeDelta: -2),
                    ),
                    TextSpan(
                      text: '$upfrontPayment ',
                      style: Theme.of(context).textTheme.bodyMedium!.apply(),
                    ),
                    WidgetSpan(
                      child: Image.asset(
                        'assets/icons/sar.png',
                        width: 16.w,
                        height: 16.h,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                TextSpan(text: '\n'),
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'دفعة الاخيرة   ',
                      style: Theme.of(
                        context,
                      ).textTheme.bodySmall!.apply(fontSizeDelta: -2),
                    ),
                    TextSpan(
                      text: '$finalPayment ',
                      style: Theme.of(context).textTheme.bodyMedium!.apply(),
                    ),
                    WidgetSpan(
                      child: Image.asset(
                        'assets/icons/sar.png',
                        width: 16.w,
                        height: 16.h,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ] else ...[
                TextSpan(
                  children: [
                    TextSpan(
                      text: '$carPrice ',
                      style: Theme.of(context).textTheme.bodyMedium!.apply(
                        fontSizeDelta: 0.1,
                        decoration: discount
                            ? TextDecoration.lineThrough
                            : null,
                      ),
                    ),
                    WidgetSpan(
                      child: Image.asset(
                        'assets/icons/sar.png',
                        width: 16.w,
                        height: 16.h,
                        color: Colors.lightGreen,
                      ),
                    ),
                  ],
                ),
                discount
                    ? TextSpan(
                        children: [
                          const TextSpan(text: '  '),
                          TextSpan(
                            text: '$carDicountPrice ',
                            style: Theme.of(context).textTheme.bodySmall!.apply(
                              fontSizeDelta: 5,
                              color: Colors.lightGreen,
                            ),
                          ),
                          WidgetSpan(
                            child: Image.asset(
                              'assets/icons/sar.png',
                              width: 16.w,
                              height: 16.h,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      )
                    : const TextSpan(),
              ],
            ],
          ),
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          textHeightBehavior: const TextHeightBehavior(
            applyHeightToFirstAscent: false,
          ),
        ),
      ],
    );
  }
}
