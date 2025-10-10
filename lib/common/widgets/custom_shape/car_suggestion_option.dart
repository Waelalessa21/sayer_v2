import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CarSuggestionOptions extends StatelessWidget {
  final String text;
  final Color borderColor;
  final VoidCallback? onTap;
  final bool isUsed;

  const CarSuggestionOptions({
    super.key,
    required this.text,
    required this.borderColor,
    this.onTap,
    this.isUsed = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isUsed ? null : onTap,
      child: Opacity(
        opacity: isUsed ? 0.5 : 1.0,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
          decoration: BoxDecoration(
            color: borderColor.withOpacity(0.05),
            borderRadius: BorderRadius.circular(24.r),
            border: Border.all(color: borderColor),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                text,
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium!.apply(color: borderColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
