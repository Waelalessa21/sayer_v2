import 'package:flutter/material.dart';
import 'package:sayer_app/common/theming/app_colors.dart';

class InfoBox extends StatefulWidget {
  final IconData icon;
  final String title;
  final String value;
  final Duration delay;

  const InfoBox({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
    this.delay = Duration.zero,
  });

  static const Color iconColor = AppColors.textDarkBlue;
  static const Color borderColor = AppColors.grey;

  static const TextStyle titleStyle = TextStyle(
    fontSize: 11,
    color: AppColors.darkGrey,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle valueStyle = TextStyle(
    fontSize: 13.5,
    color: AppColors.black,
    fontWeight: FontWeight.bold,
  );

  @override
  State<InfoBox> createState() => _InfoBoxState();
}

class _InfoBoxState extends State<InfoBox> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Offset> offsetAnimation;
  late Animation<double> fadeAnimation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    offsetAnimation = Tween<Offset>(
      begin: const Offset(1.2, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: controller, curve: Curves.easeOutExpo));

    fadeAnimation = CurvedAnimation(parent: controller, curve: Curves.easeIn);

    Future.delayed(widget.delay, () {
      if (mounted) controller.forward();
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: fadeAnimation,
      child: SlideTransition(
        position: offsetAnimation,
        child: Container(
          width: 115,
          height: 95,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: InfoBox.borderColor),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(widget.icon, size: 22, color: InfoBox.iconColor),
              const SizedBox(height: 6),
              Text(
                widget.title,
                style: InfoBox.titleStyle,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 2),
              Text(
                widget.value,
                style: InfoBox.valueStyle,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
