import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sayer_app/common/constants/app_sizes.dart';
import 'package:sayer_app/common/layout/app_default_bar.dart';
import 'package:sayer_app/common/layout/app_white_pattern.dart';
import 'package:sayer_app/common/theming/app_colors.dart';
import 'package:sayer_app/features/brands/ui/widgets/brands_cubit_listener.dart';
import 'package:sayer_app/features/home/logic/brands_cubit.dart';

class BrandsScreen extends StatefulWidget {
  const BrandsScreen({super.key});

  @override
  State<BrandsScreen> createState() => _BrandsScreenState();
}

class _BrandsScreenState extends State<BrandsScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationControll;
  late Animation<double> fadeAnimation;
  late Animation<Offset> slideAnimation;

  @override
  void initState() {
    super.initState();
    context.read<BrandsCubit>().getBrands(1, 30);

    _animationControll = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationControll, curve: Curves.easeInOut),
    );

    slideAnimation =
        Tween<Offset>(begin: const Offset(0, -0.3), end: Offset.zero).animate(
          CurvedAnimation(
            parent: _animationControll,
            curve: Curves.easeOutCubic,
          ),
        );

    _animationControll.forward();
  }

  @override
  void dispose() {
    _animationControll.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppWhitePattern(
      appBar: AppDefaultBar(showbackArrow: true, arrowColor: Colors.black),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: AppSizes.spaceBtwSections.sp,
          horizontal: AppSizes.md.sp,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              FadeTransition(
                opacity: fadeAnimation,
                child: SlideTransition(
                  position: slideAnimation,
                  child: Text(
                    'وكــلاء ســاير',
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      fontSize: 20.sp,
                      color: AppColors.sSecondery,
                    ),
                  ),
                ),
              ),
              SizedBox(height: AppSizes.spaceBtwSections.h),
              BrandsCubitListener(),
            ],
          ),
        ),
      ),
    );
  }
}
