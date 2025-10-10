import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sayer_app/common/constants/app_sizes.dart';
import 'package:sayer_app/common/helpers/extension.dart';
import 'package:sayer_app/common/routing/routes.dart';
import 'package:sayer_app/common/theming/app_colors.dart';

class EmptyFavourite extends StatefulWidget {
  const EmptyFavourite({super.key});

  @override
  State<EmptyFavourite> createState() => _EmptyFavouriteState();
}

class _EmptyFavouriteState extends State<EmptyFavourite>
    with TickerProviderStateMixin {
  late AnimationController _imageController;
  late AnimationController _textController;
  late AnimationController _buttonController;

  late Animation<double> _imageOpacity;
  late Animation<double> _textOpacity;
  late Animation<double> _buttonScale;

  @override
  void initState() {
    super.initState();

    _imageController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _textController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _buttonController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    _imageOpacity = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: _imageController, curve: Curves.easeIn));

    _textOpacity = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: _textController, curve: Curves.easeIn));

    _buttonScale = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _buttonController, curve: Curves.easeOutBack),
    );

    _startAnimations();
  }

  Future<void> _startAnimations() async {
    await _imageController.forward();
    await _textController.forward();
    await Future.delayed(const Duration(milliseconds: 200));
    await _buttonController.forward();
  }

  @override
  void dispose() {
    _imageController.dispose();
    _textController.dispose();
    _buttonController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: AppSizes.spaceBtwSections.h),
        FadeTransition(
          opacity: _imageOpacity,
          child: Image.asset("assets/images/CantFindCar.png"),
        ),
        SizedBox(height: AppSizes.spaceBtwItems.h),
        FadeTransition(
          opacity: _textOpacity,
          child: Text(
            'لا يوجد لديك أي سيارة في المفضلة!',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              color: AppColors.textDarkBlue,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: AppSizes.spaceBtwSections.h),
        ScaleTransition(
          scale: _buttonScale,
          child: OutlinedButton(
            onPressed: () => context.pushNamed(Routes.search),
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.blue,
              padding: EdgeInsets.symmetric(
                horizontal: AppSizes.spaceBtwSections.sp,
                vertical: AppSizes.spaceBtwItems.sp / 2.sp,
              ),
              side: BorderSide(color: AppColors.middleColor),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
            child: Text(
              'ابحث الآن',
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.apply(color: AppColors.middleColor),
            ),
          ),
        ),
      ],
    );
  }
}
