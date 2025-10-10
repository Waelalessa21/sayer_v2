import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sayer_app/common/helpers/extension.dart';
import 'package:sayer_app/common/theming/app_colors.dart';

class ConfirmButton extends StatelessWidget {
  final bool isConfirm;
  final String? text;
  final VoidCallback? onPressed;

  const ConfirmButton({
    super.key,
    this.text,
    this.isConfirm = false,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onPressed != null) {
          onPressed!();
        } else {
          context.pop();
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10.sp),
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.lightGrey,
          borderRadius: BorderRadius.circular(20.sp),
        ),
        child: Center(
          child: Text(
            text ?? (isConfirm ? "تأكيد الطلب" : "لا، هوّنت"),
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
              color: isConfirm ? AppColors.textDarkBlue : AppColors.error,
            ),
          ),
        ),
      ),
    );
  }
}
