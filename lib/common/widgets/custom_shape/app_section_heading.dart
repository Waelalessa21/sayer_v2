import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sayer_app/common/constants/app_sizes.dart';
import 'package:sayer_app/common/theming/app_colors.dart';

class AppSectionHeading extends StatelessWidget {
  const AppSectionHeading({
    super.key,
    this.textColor,
    this.showActionButton = true,
    required this.title,
    this.buttonTitle = 'الكل ',
    this.onPressed,
  });

  final Color? textColor;
  final bool showActionButton;
  final String title, buttonTitle;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: AppSizes.defaultSpace.sp / 4.sp),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: Theme.of(
                  context,
                ).textTheme.headlineSmall!.apply(color: textColor),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              if (showActionButton)
                TextButton(
                  onPressed: onPressed,
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primary.withOpacity(0.3),
                          blurRadius: 12,
                          offset: Offset(1, 5),
                        ),
                      ],
                      shape: BoxShape.rectangle,
                    ),
                    child: Text(
                      buttonTitle,
                      style: Theme.of(
                        context,
                      ).textTheme.labelSmall!.apply(color: textColor),
                    ),
                  ),
                ),
              if (!showActionButton) SizedBox(height: 50.h, width: 50.w),
            ],
          ),
        ],
      ),
    );
  }
}
