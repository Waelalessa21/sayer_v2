import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingThree extends StatefulWidget {
  final PageController controller;

  const OnBoardingThree({super.key, required this.controller});

  @override
  State<OnBoardingThree> createState() => _OnBoardingThreeState();
}

class _OnBoardingThreeState extends State<OnBoardingThree> {
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
        SizedBox(height: 30.h),
        Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              top: 595 - (_offset * 250),
              left: -35 + (_offset * 100),
              child: Transform.rotate(
                angle: 0.1,
                child: Image.asset(
                  'assets/images/questionMark.png',
                  height: 120.h,
                ),
              ),
            ),
            Positioned(
              top: 510 - (_offset * 250),
              left: -150 + (_offset * 100),
              child: Image.asset(
                'assets/images/on_boardingthree_monthly.png',
                height: 150.h,
              ),
            ),
            Transform.translate(
              offset: Offset(0, 180),
              child: Image.asset(
                'assets/images/mehtar.png',
                height: 55 + (_offset * 150).h,
              ),
            ),
            Positioned(
              top: 465 - (_offset * 100),
              left: -230 + (_offset * 100),
              child: Image.asset('assets/images/retaired.png', height: 30.h),
            ),
            Positioned(
              top: 560 - (_offset * 100),
              left: -5 + (_offset * 100),
              child: Image.asset('assets/images/any_fees.png', height: 32.h),
            ),
            Positioned(
              top: 475 - (_offset * 100),
              left: -90 + (_offset * 100),
              child: Image.asset('assets/images/salary.png', height: 62.h),
            ),
            Positioned(
              top: 530 - (_offset * 100),
              right: -60 + (_offset * 100),
              child: Image.asset('assets/images/total_fees.png', height: 60.h),
            ),
          ],
        ),
      ],
    );
  }
}
