import 'package:flutter/material.dart';
import 'package:sayer_app/common/theming/app_colors.dart';
import 'package:sayer_app/features/services/ui/widgets/floating_point.dart';

class ServicesHeader extends StatelessWidget {
  const ServicesHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            'خـدمات ســـاير',
            style: Theme.of(
              context,
            ).textTheme.headlineMedium?.copyWith(color: AppColors.sSecondery),
          ),
        ),
        FloatingPoint(),
      ],
    );
  }
}
