import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sayer_app/common/constants/app_sizes.dart';
import 'package:sayer_app/common/constants/app_text.dart';
import 'package:sayer_app/common/layout/app_default_bar.dart';
import 'package:sayer_app/common/layout/app_white_pattern.dart';
import 'package:sayer_app/common/theming/app_colors.dart';
import 'package:sayer_app/features/otp/ui/widgets/otp_form.dart';
import 'package:sayer_app/features/otp/ui/widgets/otp_header.dart';
import 'package:sayer_app/features/otp/ui/widgets/submit_otp.dart';
import 'package:sayer_app/features/otp/logic/otp_cubit.dart';
import 'package:sayer_app/features/otp/ui/widgets/otp_cubit_listener.dart';

class OtpScreen extends StatefulWidget {
  final String? phoneNumber;

  const OtpScreen({super.key, this.phoneNumber});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  late Timer _timer;
  bool _isResendEnabled = false;
  int _remainingTime = 120;

  @override
  void initState() {
    super.initState();
    context.read<OtpCubit>().phoneNumber = widget.phoneNumber ?? '';
    _startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _startTimer() {
    setState(() {
      _isResendEnabled = false;
      _remainingTime = 120;
    });

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingTime > 0) {
        setState(() {
          _remainingTime--;
        });
      } else {
        timer.cancel();
        setState(() {
          _isResendEnabled = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Localizations.override(
      context: context,
      locale: const Locale('ar'),
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: AppWhitePattern(
          appBar: AppDefaultBar(
            goBack: '/login',
            showbackArrow: false,
            arrowColor: Colors.black,
          ),
          child: Padding(
            padding: EdgeInsets.all(AppSizes.defaultSpace.sp),
            child: Column(
              children: [
                OTPHeader(phoneNumber: widget.phoneNumber!),
                SizedBox(height: AppSizes.spaceBtwSections.h / 2.h),
                Localizations.override(
                  context: context,
                  locale: const Locale('en'),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: OTPForm(),
                  ),
                ),
                SizedBox(height: AppSizes.spaceBtwItems.h / 2.h),
                SizedBox(
                  width: 170.w,
                  child: TextButton(
                    onPressed: _isResendEnabled
                        ? () {
                            context.read<OtpCubit>().regenerateOtpRequest();
                            _startTimer();
                          }
                        : null,
                    child: Text(
                      _isResendEnabled
                          ? AppTexts.resendPhoneNum
                          : "اعادة الارسال بعد $_remainingTime ثانية ",
                      style: const TextStyle(
                        color: AppColors.darkerGrey,
                        fontSize: 11.0,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity.w,
                  child: ElevatedButton(
                    onPressed: () {
                      submitOTP(context);
                    },
                    child: Text(
                      AppTexts.tContinue,
                      style: Theme.of(
                        context,
                      ).textTheme.titleSmall!.apply(color: Colors.white),
                    ),
                  ),
                ),
                OtpCubitListener(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
