import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sayer_app/common/helpers/extension.dart';
import 'package:sayer_app/common/routing/routes.dart';
import 'package:sayer_app/common/theming/app_colors.dart';
import 'package:sayer_app/common/widgets/popup/show_toast_message.dart';
import 'package:sayer_app/features/login/logic/login_cubit.dart';
import 'package:sayer_app/features/login/logic/login_state.dart';

class LoginCubitListener extends StatelessWidget {
  final BuildContext context;
  const LoginCubitListener({super.key, required this.context});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) =>
          current is Loading ||
          current is PhoneNumberSubmitted ||
          current is Error ||
          current is PhoneOTPVerified,
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
              "خطا في تسجيل الدخول",
              "assets/icons/question.png",
              isError: true,
            );
          },
          phoneNumberSubmitted: () {
            final phoneNumber = context.read<LoginCubit>().phoneNumber;
            Navigator.pop(context);
            context.pushNamed(Routes.otp, arguments: phoneNumber);
          },
          phoneOTPVerified: () {
            Navigator.pop(context);
            context.pushNamed(Routes.home);
          },
        );
      },
      child: SizedBox.shrink(),
    );
  }
}
