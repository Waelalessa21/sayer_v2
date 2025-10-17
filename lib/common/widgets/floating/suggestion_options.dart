import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sayer_app/common/theming/app_colors.dart';
import 'package:sayer_app/common/widgets/animation/animated_item.dart';

class SuggestionsOptions extends StatelessWidget {
  final void Function(String) onSuggestionTap;

  const SuggestionsOptions({super.key, required this.onSuggestionTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(50, 430, 45, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedItem(
            index: 1,
            child: suggestions(
              iconPath: 'assets/icons/suggestion.png',
              label: 'أقتراح',
              description: "ساير ما يستغني عنك! اقترح علينا",
              onPressed: () => onSuggestionTap('أقتراح'),
            ),
          ),
          SizedBox(height: 20),
          AnimatedItem(
            index: 3,
            child: suggestions(
              iconPath: 'assets/icons/question.png',
              label: 'سؤال',
              description: "كم المدة المتوقعة لاتمام الطلب؟",
              onPressed: () => onSuggestionTap('سؤال'),
            ),
          ),
        ],
      ),
    );
  }

  Widget suggestions({
    required String iconPath,
    required String label,
    required String description,
    required Function onPressed,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () => onPressed(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 10.r,
                backgroundColor: Color(0xFF0DFE0F2).withOpacity(0.1),
                child: ClipOval(
                  child: Image.asset(iconPath, width: 25, height: 25),
                ),
              ),
              SizedBox(width: 10.w),
              Text(
                label,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.textDarkBlue,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 4.h),
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: Opacity(
            opacity: 0.4,
            child: Text(
              description,
              style: TextStyle(fontSize: 12.sp, color: AppColors.sSecondery),
            ),
          ),
        ),
      ],
    );
  }
}
