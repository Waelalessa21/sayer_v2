import 'package:flutter/material.dart';
import 'package:sayer_app/common/theming/app_colors.dart';

class NotificationLoader extends StatelessWidget {
  final Animation<double> animation;
  final bool animate;

  const NotificationLoader({
    super.key,
    required this.animation,
    required this.animate,
  });

  Widget circleLoader({
    required double size,
    required double delay,
    required double opacityStrength,
    required Color color,
  }) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        final progress = animation.value;

        final localProgress = ((progress - delay) / (1.0 - delay)).clamp(
          0.0,
          1.0,
        );

        final scale = animate ? (0.8 + (localProgress * 0.2)) : 1.0;

        final opacity = animate
            ? (localProgress * opacityStrength).clamp(0.0, opacityStrength)
            : opacityStrength;

        return Opacity(
          opacity: opacity,
          child: Transform.scale(
            scale: scale,
            child: Container(
              width: size,
              height: size,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: color.withOpacity(opacityStrength * 0.2),
                border: Border.all(color: color.withOpacity(0.01), width: 0.1),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final color = AppColors.sPrimary;

    return Stack(
      alignment: Alignment.center,
      children: [
        circleLoader(
          size: width * 0.65,
          delay: 0.0,
          opacityStrength: 0.35,
          color: color,
        ),
        circleLoader(
          size: width * 0.55,
          delay: 0.2,
          opacityStrength: 0.4,
          color: color,
        ),
        circleLoader(
          size: width * 0.45,
          delay: 0.4,
          opacityStrength: 0.45,
          color: color,
        ),
      ],
    );
  }
}
