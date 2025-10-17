import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:sayer_app/common/theming/app_colors.dart';

class OnBoardingOne extends StatefulWidget {
  final PageController controller;

  const OnBoardingOne({super.key, required this.controller});

  @override
  OnBoardingOneState createState() => OnBoardingOneState();
}

class OnBoardingOneState extends State<OnBoardingOne> {
  double _offset = 0.0;

  @override
  void initState() {
    super.initState();

    widget.controller.addListener(_pageListener);
  }

  void _pageListener() {
    if (mounted) {
      setState(() {
        _offset = widget.controller.page ?? 0;
      });
    }
  }

  @override
  void dispose() {
    widget.controller.removeListener(_pageListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 90.h),
        Stack(
          children: [
            Transform.translate(
              offset: Offset(0, 140),
              child: Lottie.asset(
                'assets/lottie/on_boarding_car.json',
                height: 420.h,
                width: 400.w,
              ),
            ),
            Positioned(
              top: (140 - (_offset * 100)).clamp(0.0, 140.0),
              right: 10,
              child: SizedBox(
                height: (62 - (_offset * 80)).clamp(
                  0.0,
                  62.0,
                ), // Ensure positive height
                child: Transform.rotate(
                  angle: 0,
                  child: Opacity(
                    opacity: 0.95,
                    child: Image.asset('assets/images/on_boarding_offers.png'),
                  ),
                ),
              ),
            ),
            Positioned(
              top: (220 - (_offset * 100)).clamp(0.0, 250.0),
              right: (160 - (_offset * 100)).clamp(0.0, 160.0),
              child: SizedBox(
                height: 60.h,
                child: Transform.rotate(
                  angle: (12.65 - (_offset * 0.5)).clamp(0.0, 12.65),
                  child: Opacity(
                    opacity: 0.8,
                    child: Image.asset('assets/images/on_boarding_mehtar.png'),
                  ),
                ),
              ),
            ),
            Positioned(
              top: (50 + (_offset * 100)).clamp(0.0, 150.0),
              left: (0 + (_offset * 250)).clamp(0.0, 250.0),
              child: SizedBox(
                height: (65 - (_offset * 50)).clamp(15.0, 65.0),
                child: Transform.rotate(
                  angle: 12.5,
                  child: Opacity(
                    opacity: 0.8,
                    child: Image.asset('assets/images/on_boarding_fees.png'),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 155,
              left: (30 + (_offset * 250)).clamp(0.0, 250.0),
              child: SizedBox(
                height: 65.h,
                child: Transform.rotate(
                  angle: 12.5,
                  child: Opacity(
                    opacity: .3,
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: -3,
                            blurRadius: 6,
                            offset: Offset(0, 0),
                          ),
                        ],
                      ),
                      child: CircleAvatar(
                        backgroundColor: AppColors.grey.withOpacity(0.5),
                        radius: 22.r,
                        child: Padding(
                          padding: EdgeInsets.all(7.0.sp),
                          child: Image.asset('assets/icons/small_car.png'),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: (-5 + (_offset * 100)).clamp(-5.0, 95.0),
              left: (80 + (_offset * 250)).clamp(80.0, 330.0),
              child: SizedBox(
                height: 65.h,
                child: Transform.rotate(
                  angle: 12.5,
                  child: Opacity(
                    opacity: 0.5,
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: -3,
                            blurRadius: 6,
                            offset: Offset(0, 0),
                          ),
                        ],
                      ),
                      child: CircleAvatar(
                        backgroundColor: AppColors.grey.withOpacity(0.5),
                        radius: 15.r,
                        child: Padding(
                          padding: EdgeInsets.all(7.0.sp),
                          child: Image.asset('assets/icons/car_with_ppl.png'),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: (230 - (_offset * 100)).clamp(0.0, 230.0),
              left: (290 + (_offset * 250)).clamp(0.0, 540.0),
              child: SizedBox(
                height: 65.h,
                child: Transform.rotate(
                  angle: 12.5,
                  child: Opacity(
                    opacity: .7,
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.green.withOpacity(0.9),
                            spreadRadius: -2.5,
                            blurRadius: 6,
                            offset: Offset(0, 0),
                          ),
                        ],
                      ),
                      child: CircleAvatar(
                        backgroundColor: AppColors.grey.withOpacity(0.5),
                        radius: 17.r,
                        child: Padding(
                          padding: EdgeInsets.all(8.0.sp),
                          child: Image.asset('assets/icons/percent.png'),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: (10 + (_offset * 259)).clamp(10.0, 269.0),
              left: 310,
              child: SizedBox(
                height: 65.h,
                child: Transform.rotate(
                  angle: 12.3,
                  child: Opacity(
                    opacity: 0.55,
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blue.withOpacity(0.6),
                            spreadRadius: -3,
                            blurRadius: 5,
                            offset: Offset(0, 0),
                          ),
                        ],
                      ),
                      child: CircleAvatar(
                        backgroundColor: AppColors.grey,
                        radius: 10.r,
                        child: Padding(
                          padding: EdgeInsets.all(8.0.sp),
                          child: Image.asset('assets/icons/Pickup.png'),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
