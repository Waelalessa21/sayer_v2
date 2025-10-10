import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sayer_app/common/constants/app_sizes.dart';
import 'package:sayer_app/common/layout/app_gradient_color.dart';
import 'package:sayer_app/common/widgets/animation/animated_item.dart';
import 'package:sayer_app/features/login/ui/widgets/login_cubit_listener.dart';
import 'package:sayer_app/features/login/ui/widgets/login_form.dart';
import 'package:sayer_app/features/login/ui/widgets/login_header.dart';
import 'package:sayer_app/features/login/ui/widgets/terms_and_conditions.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: AppGradientColor(
        child: Stack(
          children: [
            AnimatedItem(
              index: 1,
              duration: const Duration(milliseconds: 2000),
              child: Column(
                children: [
                  LoginHeader(),
                  LoginForm(),
                  SizedBox(height: AppSizes.spaceBtwItems.h),
                  TermsAndConditions(),
                  LoginCubitListener(context: context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
