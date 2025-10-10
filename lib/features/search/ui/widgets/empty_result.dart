import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sayer_app/common/constants/app_sizes.dart';
import 'package:sayer_app/common/theming/app_colors.dart';
import 'package:sayer_app/features/support/logic/support_cubit.dart';
import 'package:sayer_app/features/support/suggestions_popup.dart';

class EmptyResult extends StatefulWidget {
  const EmptyResult({super.key});

  @override
  State<EmptyResult> createState() => _EmptyResultState();
}

class _EmptyResultState extends State<EmptyResult>
    with TickerProviderStateMixin {
  late AnimationController _imageController;
  late AnimationController _textController;
  late AnimationController _buttonController;

  late Animation<double> _imageOpacity;
  late Animation<double> _textOpacity;
  late Animation<double> _buttonScale;

  bool showContent = false;

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
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        FadeTransition(
          opacity: _imageOpacity,
          child: Image.asset("assets/images/CantFindCar.png"),
        ),
        SizedBox(height: AppSizes.spaceBtwSections.h),
        FadeTransition(
          opacity: _textOpacity,
          child: Text(
            "ما لقيت سيارتك؟ ســاير يساعدك!",
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: AppColors.textDarkBlue,
              fontWeight: FontWeight.bold,
              fontSize: 20.sp,
            ),
          ),
        ),
        SizedBox(height: AppSizes.spaceBtwItems.h),
        ScaleTransition(
          scale: _buttonScale,
          child: OutlinedButton(
            onPressed: () {
              showModalBottomSheet(
                backgroundColor: AppColors.lightGrey,
                context: context,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(10.r),
                  ),
                ),
                isScrollControlled: true,
                builder: (BuildContext context) {
                  return Padding(
                    padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom,
                    ),
                    child: BlocProvider(
                      create: (context) => SupportCubit(),
                      child: SuggestionsPopUp(where: 'Empty result Mehtar'),
                    ),
                  );
                },
              );
            },
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
              'سايـــرنـا',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
            ),
          ),
        ),
      ],
    );
  }
}
