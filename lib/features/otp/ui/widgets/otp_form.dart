import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:sayer_app/common/theming/app_colors.dart';
import 'package:sayer_app/features/otp/logic/otp_cubit.dart';

class OTPForm extends StatelessWidget {
  OTPForm({super.key});

  final TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      controller: otpController,
      appContext: context,
      autoFocus: true,
      cursorColor: Colors.black,
      keyboardType: TextInputType.number,
      length: 4,
      obscureText: false,
      animationType: AnimationType.fade,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.underline,
        borderRadius: BorderRadius.circular(10.r),
        fieldHeight: 50.h,
        fieldWidth: 43.w,
        activeFillColor: AppColors.middleColor,
        borderWidth: 3,
        activeColor: AppColors.middleColor,
        inactiveColor: AppColors.middleColor.withOpacity(0.6),
        inactiveFillColor: Colors.white,
        selectedColor: Colors.blue,
        selectedFillColor: AppColors.middleColor,
      ),
      onCompleted: (value) {
        context.read<OtpCubit>().otpcode = value;
      },
    );
  }
}
