import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sayer_app/common/constants/app_text.dart';
import 'package:sayer_app/common/routing/routes.dart';
import 'package:sayer_app/common/theming/app_colors.dart';
import 'package:sayer_app/common/widgets/popup/show_toast_message.dart';
import 'package:sayer_app/features/otp/logic/otp_cubit.dart';
import 'package:sayer_app/features/otp/logic/otp_state.dart';
import 'package:sayer_app/common/helpers/extension.dart';

class OtpCubitListener extends StatelessWidget {
  const OtpCubitListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<OtpCubit, OtpState>(
      listenWhen: (previous, current) =>
          current is Loading ||
          current is Error ||
          current is OtpVerified ||
          current is OtpResent,
      listener: (context, state) {
        state.whenOrNull(
          loading: () => showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
                backgroundColor: AppColors.sSecondery.withOpacity(0.3),
                valueColor: AlwaysStoppedAnimation<Color>(AppColors.sSecondery),
              ),
            ),
          ),
          error: (message) {
            Navigator.pop(context);
            showToastMessage(
              context,
              "خطأ في التحقق، حدث خطا ما",
              "assets/icons/question.png",
              isError: true,
            );
          },
          otpResent: () {
            Navigator.pop(context);
            showToastMessage(
              context,
              AppTexts.resendPhoneNumSucess,
              "assets/icons/send.png",
              isError: false,
            );
          },
          otpVerified: () {
            Navigator.pop(context);
            context.pushNamed(Routes.home);
          },
        );
      },
      child: SizedBox.shrink(),
    );
  }
}
