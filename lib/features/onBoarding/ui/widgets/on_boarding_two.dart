import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingTwo extends StatefulWidget {
  final PageController controller;

  const OnBoardingTwo({super.key, required this.controller});

  @override
  OnBoardingTwoState createState() => OnBoardingTwoState();
}

class OnBoardingTwoState extends State<OnBoardingTwo> {
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
        SizedBox(height: 0),
        Stack(
          children: [
            Positioned(
              top: -255 + (_offset * 250),
              left: -320 + (_offset * 250),
              child: Transform.translate(
                offset: Offset(50, 100),
                child: Image.asset(
                  'assets/images/on_boardingtwo_offer.png',
                  height: 125.h,
                ),
              ),
            ),
            Positioned(
              top: -250 + (_offset * 250),
              right: -225 + (_offset * 250),
              child: Transform.translate(
                offset: Offset(50, 100),
                child: Image.asset(
                  'assets/images/on_boardingtwo_pay.png',
                  height: 125.h,
                ),
              ),
            ),
            Transform.translate(
              offset: Offset(40, 10),
              child: SizedBox(
                height: 300 + (_offset * 250).h,
                child: Image.asset(
                  'assets/images/on_boarding_mock.png',
                  width: double.infinity,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
