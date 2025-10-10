import 'package:flutter/material.dart';
import 'package:sayer_app/common/theming/app_colors.dart';

class AppDrawerStyle extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onPressed;

  const AppDrawerStyle({
    super.key,
    required this.text,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(overlayColor: Colors.transparent),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            textAlign: TextAlign.right,
            style: TextStyle(color: AppColors.darkerGrey),
          ),
          Icon(icon, color: AppColors.darkerGrey),
        ],
      ),
    );
  }
}
