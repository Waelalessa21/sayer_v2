import 'package:flutter/material.dart';

class SearchAnimatedCards extends StatelessWidget {
  final Animation<double> animation;
  final double angle;
  final Offset offset;
  final double width;

  const SearchAnimatedCards({
    super.key,
    required this.animation,
    required this.angle,
    required this.offset,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(offset.dx, offset.dy + animation.value),
          child: Transform.rotate(angle: angle, child: child),
        );
      },
      child: Image.asset("assets/images/search_card.png", width: width),
    );
  }
}
