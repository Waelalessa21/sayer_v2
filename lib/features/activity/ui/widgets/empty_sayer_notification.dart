import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sayer_app/common/theming/app_colors.dart';
import 'package:sayer_app/common/widgets/loader/notification_loader.dart';

class EmptySayerNotification extends StatefulWidget {
  final VoidCallback onTapReload;

  const EmptySayerNotification({super.key, required this.onTapReload});

  @override
  State<EmptySayerNotification> createState() => _EmptySayerNotificationState();
}

class _EmptySayerNotificationState extends State<EmptySayerNotification>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  late AnimationController _animationController;
  bool _showAnimation = true;
  static bool _animationPlayed = false;
  List<bool> _showImage = List.generate(6, (_) => false);
  bool _showText = false;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    if (!_animationPlayed) {
      imageAnimation();
      showImagesInSequence();
      _animationPlayed = true;
    } else {
      _showAnimation = false;
      _showImage = List.generate(6, (_) => true);
      _showText = true;
    }
  }

  void imageAnimation() {
    _animationController.forward();

    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        setState(() {
          _showAnimation = false;
        });
      }
    });
  }

  Future<void> showImagesInSequence() async {
    for (int i = 0; i < _showImage.length; i++) {
      await Future.delayed(const Duration(milliseconds: 400));
      if (mounted) {
        setState(() {
          _showImage[i] = true;
        });
      }
    }

    await Future.delayed(const Duration(milliseconds: 400));
    if (mounted) {
      setState(() {
        _showText = true;
      });
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return GestureDetector(
      onTap: widget.onTapReload,
      child: Column(
        children: [
          SizedBox(height: 24.h),
          Stack(
            alignment: Alignment.center,
            children: [
              NotificationLoader(
                animation: _animationController,
                animate: _showAnimation,
              ),
              Image.asset(
                "assets/images/Sayer_Logo.png",
                width: MediaQuery.of(context).size.width * 0.15,
              ),
              ...dealerImages(),
            ],
          ),
          SizedBox(height: 24.h),
          AnimatedOpacity(
            opacity: _showText ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 200),
            child: Text(
              "الجديد جايك!",
              style: TextStyle(
                color: Colors.black,
                fontSize: 22.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(height: 16.h),
          AnimatedOpacity(
            opacity: _showText ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 1000),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Text(
                "في ســاير، نحرص على أن نوفر لك أفضل العروض بشكل حصري، لتتمتع بتجربة  مميزة وفرص لا تجدها في أي مكان آخر.",
                style: TextStyle(
                  color: AppColors.buttonSecondary,
                  fontSize: 16.sp,
                  height: 1.6,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }

  List dealerImages() {
    return [
      showDelaerImg(
        "assets/images/notification1.png",
        90.h,
        40.w,
        Alignment.topLeft,
        index: 0,
      ),
      showDelaerImg(
        "assets/images/notification2.png",
        90.h,
        40.w,
        Alignment.topRight,
        index: 1,
      ),
      showDelaerImg(
        "assets/images/notification3.png",
        40.h,
        10.w,
        Alignment.topLeft,
        index: 2,
      ),
      showDelaerImg(
        "assets/images/notification4.png",
        10.h,
        120.w,
        Alignment.topRight,
        index: 3,
      ),
      showDelaerImg(
        "assets/images/notification5.png",
        25.h,
        20.w,
        Alignment.topRight,
        index: 4,
      ),
    ];
  }

  Widget showDelaerImg(
    String assetPath,
    double top,
    double offset,
    Alignment alignment, {
    required int index,
  }) {
    return Positioned(
      top: top,
      left: alignment == Alignment.topLeft ? offset : null,
      right: alignment == Alignment.topRight ? offset : null,
      child: AnimatedOpacity(
        opacity: _showImage[index] ? 1.0 : 0.0,
        duration: const Duration(milliseconds: 500),
        child: Image.asset(assetPath, width: 55.w),
      ),
    );
  }
}
