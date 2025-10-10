import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:sayer_app/common/constants/app_sizes.dart';
import 'package:sayer_app/common/theming/app_colors.dart';
import 'package:sayer_app/common/widgets/animation/search_animated_card.dart';

class NoSearchYet extends StatefulWidget {
  const NoSearchYet({super.key});

  @override
  State<NoSearchYet> createState() => _NoSearchYetState();
}

class _NoSearchYetState extends State<NoSearchYet>
    with TickerProviderStateMixin {
  late AnimationController cardController;
  late AnimationController fadeTextController;
  late AnimationController scaleTextController;

  late Animation<double> lastCard;
  late Animation<double> secondCard;
  late Animation<double> centerCard;
  late Animation<double> fadeTextAnimation;
  late Animation<double> scaleTextAnimation;

  bool showTexts = false;

  @override
  void initState() {
    super.initState();

    cardController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    fadeTextController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    scaleTextController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    lastCard = Tween<double>(begin: 150, end: 0).animate(
      CurvedAnimation(
        parent: cardController,
        curve: const Interval(0.2, 0.6, curve: Curves.easeOut),
      ),
    );

    secondCard = Tween<double>(begin: 150, end: 0).animate(
      CurvedAnimation(
        parent: cardController,
        curve: const Interval(0.4, 0.8, curve: Curves.easeOut),
      ),
    );

    centerCard = Tween<double>(begin: 150, end: 0).animate(
      CurvedAnimation(
        parent: cardController,
        curve: const Interval(0.0, 0.4, curve: Curves.easeOut),
      ),
    );

    fadeTextAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: fadeTextController, curve: Curves.easeIn),
    );

    scaleTextAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: scaleTextController, curve: Curves.easeOutBack),
    );

    cardController.forward().whenComplete(() async {
      setState(() => showTexts = true);
      fadeTextController.forward();
      await Future.delayed(const Duration(milliseconds: 1000));
      scaleTextController.forward();
    });
  }

  @override
  void dispose() {
    cardController.dispose();
    fadeTextController.dispose();
    scaleTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double imageWidth = MediaQuery.of(context).size.width * 0.7;

    return Padding(
      padding: EdgeInsets.only(top: AppSizes.productItemHeight.sp),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              SearchAnimatedCards(
                animation: lastCard,
                angle: -0.15,
                offset: const Offset(-25, -50),
                width: imageWidth,
              ),
              SearchAnimatedCards(
                animation: secondCard,
                angle: 0.12,
                offset: const Offset(25, -30),
                width: imageWidth,
              ),
              SearchAnimatedCards(
                animation: centerCard,
                angle: 0,
                offset: Offset.zero,
                width: imageWidth,
              ),
            ],
          ),
          if (showTexts) ...[
            SizedBox(height: AppSizes.spaceBtwSections.h),
            FadeTransition(
              opacity: fadeTextAnimation,
              child: Text(
                'ما لك إلا اللي يرضيك ',
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.sp,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: AppSizes.spaceBtwItems.h),
            ScaleTransition(
              scale: scaleTextAnimation,
              child: Text(
                'إبحث عن سيارتك الان 🚀',
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.sp,
                  color: AppColors.textDarkBlue,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
