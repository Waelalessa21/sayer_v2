import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sayer_app/common/theming/app_colors.dart';
import 'package:sayer_app/common/widgets/popup/show_toast_message.dart';
import 'package:sayer_app/features/support/logic/support_cubit.dart';
import 'package:sayer_app/features/support/logic/support_state.dart';

class SupportCubitLisener extends StatelessWidget {
  const SupportCubitLisener({super.key});

  @override
  Widget build(context) {
    return BlocListener<SupportCubit, SupportState>(
      listenWhen: (previous, current) =>
          current is SuccessfulSend || current is Error || current is Loading,
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
          successfulSend: () {
            Navigator.pop(context);
            showToastMessage(
              context,
              "تم إرسال الرسالة، شكرا لتواصلك معنا",
              "assets/icons/send.png",
              isError: false,
            );
          },
          error: (e) {
            if (Navigator.of(context).canPop()) Navigator.pop(context);
            showToastMessage(
              context,
              "خطأ في الإرسال، حدث خطا ما",
              "assets/icons/question.png",
              isError: true,
            );
          },
        );
      },
      child: SizedBox.shrink(),
    );
  }
}
