import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sayer_app/common/theming/app_colors.dart';

class EmptyOrders extends StatefulWidget {
  const EmptyOrders({super.key});

  @override
  State<EmptyOrders> createState() => _EmptyOrdersState();
}

class _EmptyOrdersState extends State<EmptyOrders> {
  final List _images = [
    'assets/images/empty-order1.png',
    'assets/images/empty-order2.png',
    'assets/images/empty-order3.png',
  ];

  final List imgScale = [1.0, 0.85, 0.7];
  final List imgSpace = [0.0, 30.0, 54.0];

  List imgvisibilty = [false, false, false];

  @override
  void initState() {
    super.initState();
    _startStaggeredFadeIn();
  }

  void _startStaggeredFadeIn() {
    for (int i = 0; i < _images.length; i++) {
      Future.delayed(Duration(milliseconds: i * 700), () {
        if (mounted) {
          setState(() {
            imgvisibilty[i] = true;
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0.sp),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.lightGrey,
          border: Border.all(color: Colors.grey.shade300, width: 1.w),
          borderRadius: BorderRadius.circular(20.r),
        ),
        padding: EdgeInsets.all(24.0.sp),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Text(
                "طلباتك الحالية",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            const SizedBox(height: 40),
            SizedBox(
              height: 160.h,
              child: Stack(
                alignment: Alignment.center,
                children: List.generate(_images.length, (index) {
                  int reversedIndex = _images.length - 1 - index;
                  return Positioned(
                    top: imgSpace[reversedIndex],
                    child: AnimatedOpacity(
                      opacity: imgvisibilty[reversedIndex] ? 1.0 : 0.0,
                      duration: const Duration(milliseconds: 700),
                      curve: Curves.easeInOut,
                      child: Transform.scale(
                        scale: imgScale[reversedIndex],
                        child: Image.asset(
                          _images[reversedIndex],
                          width: 300.w,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
            Text(
              "لا يوجد لك طلبات",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ],
        ),
      ),
    );
  }
}
