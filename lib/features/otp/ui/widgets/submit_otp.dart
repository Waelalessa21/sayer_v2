import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sayer_app/common/widgets/popup/show_toast_message.dart';
import 'package:sayer_app/features/login/ui/widgets/phone_validator.dart';
import 'package:sayer_app/features/otp/logic/otp_cubit.dart';

Widget submitOTP(BuildContext context) {
  final otp = context.read<OtpCubit>().otpcode;

  if (!PhoneValidator.validateOTP(otp)) {
    showToastMessage(
      context,
      "رمز التحقق يجب ان يكون من اربع ارقام",
      "assets/icons/question.png",
      isError: true,
    );
  } else {
    try {
      context.read<OtpCubit>().verifyOtpRequest();
    } catch (e) {
      showToastMessage(
        context,
        "حدث خطا ما",
        "assets/icons/question.png",
        isError: true,
      );
    }
  }
  return SizedBox.shrink();
}
