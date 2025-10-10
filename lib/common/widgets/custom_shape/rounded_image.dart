import 'package:flutter/material.dart';
import 'package:sayer_app/common/constants/app_sizes.dart';

class RoundedImage extends StatelessWidget {
  const RoundedImage({
    super.key,
    this.width,
    this.height,
    this.imagmeUrl = '',
    this.applyImageRadius = true,
    this.border,
    this.backgroundColor = Colors.transparent,
    this.fit = BoxFit.contain,
    this.padding,
    this.isNetworkImage = true,
    this.onPressed,
    this.borderRadius = AppSizes.md,
  });

  final double? width, height;
  final String imagmeUrl;
  final bool applyImageRadius;
  final BoxBorder? border;
  final Color backgroundColor;
  final BoxFit? fit;
  final EdgeInsetsGeometry? padding;
  final bool isNetworkImage;
  final VoidCallback? onPressed;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        decoration: BoxDecoration(
          border: border,
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: ClipRRect(
          borderRadius: applyImageRadius
              ? BorderRadius.circular(borderRadius)
              : BorderRadius.zero,
          child: Image.network(
            imagmeUrl,
            fit: fit,
            errorBuilder: (context, error, stackTrace) {
              return Image.asset("assets/images/ImageNotLoading.png", fit: fit);
            },
          ),
        ),
      ),
    );
  }
}
