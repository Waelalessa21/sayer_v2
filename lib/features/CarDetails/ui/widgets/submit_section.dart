import 'package:flutter/material.dart';
import 'package:sayer_app/common/theming/app_colors.dart';

class SubmitSection extends StatelessWidget {
  final VoidCallback onPressed;

  const SubmitSection({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: const BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0x1A000000),
            blurRadius: 8,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: onPressed,
            child: const Text('إرسال الطلب'),
          ),
        ),
      ),
    );
  }
}
