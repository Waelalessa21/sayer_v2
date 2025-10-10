import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:sayer_app/common/constants/app_sizes.dart';
import 'package:sayer_app/common/theming/app_colors.dart';

/// A container with a border radius and a border color {customized container for app needs}
class AppContainer extends StatelessWidget {
  const AppContainer({
    super.key,
    this.width,
    this.height,
    this.radius,
    this.child,
    this.showBorder = false,
    this.borderColor = AppColors.borderPrimary,
    this.backgroundColor = AppColors.white,
    this.padding,
    this.margin,
    this.boxShadow,
  });

  final double? width;
  final double? height;
  final double? radius;
  final Widget? child;
  final bool showBorder;
  final Color borderColor;
  final Color backgroundColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final List<BoxShadow>? boxShadow;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        boxShadow: boxShadow,
        color: backgroundColor,
        borderRadius: BorderRadius.circular(radius ?? AppSizes.cardRadiusLg.r),
        border: showBorder ? Border.all(color: borderColor) : null,
      ),
      child: child,
    );
  }
}
