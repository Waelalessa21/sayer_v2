// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:sayer_app/common/helpers/extension.dart';
import 'package:sayer_app/common/routing/routes.dart';
import 'package:sayer_app/common/theming/app_colors.dart';
import 'package:sayer_app/common/widgets/popup/custom_popup.dart';
import 'package:sayer_app/common/widgets/popup/show_popup.dart';

class Visitor extends StatelessWidget {
  final bool isLoginEnabled;

  const Visitor({super.key, required this.isLoginEnabled});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {
          if (isLoginEnabled) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) => Center(
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  backgroundColor: AppColors.sSecondery.withOpacity(0.3),
                  valueColor: AlwaysStoppedAnimation<Color>(
                    AppColors.sSecondery,
                  ),
                ),
              ),
            );
            Future.delayed(const Duration(seconds: 1), () {
              context.pop();
              context.pushNamed(Routes.home);
            });
          } else {
            showpopupsheet(
              context,
              CustomPopup(
                title: ' عذرا!',
                subtitle:
                    ' لا يمكنك تسجيل الدخول في الوقت الحالي ، نعمل على تحسين تجربتكم',
              ),
              isDismissible: false,
            );
          }
        },
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: AppColors.primary.withOpacity(0.2),
                blurRadius: 12,
                offset: const Offset(1, 5),
              ),
            ],
            shape: BoxShape.rectangle,
          ),
          child: Text(
            'زائر ؟',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              fontSize: 15,
              letterSpacing: 1.2,
              color: AppColors.darkerGrey.withOpacity(0.9),
            ),
          ),
        ),
      ),
    );
  }
}
