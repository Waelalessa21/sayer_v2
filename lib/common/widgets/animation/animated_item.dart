import 'dart:math';

import 'package:flutter/material.dart';

/// A widget that animates a child item as fading the children by indexes
class AnimatedItem extends StatefulWidget {
  final int index;
  final Widget child;
  final bool fromRightToLeft;
  final Duration duration;

  const AnimatedItem({
    super.key,
    required this.index,
    required this.child,
    this.fromRightToLeft = false,
    this.duration = const Duration(milliseconds: 1500),
  });

  @override
  State<AnimatedItem> createState() => _AnimatedItemState();
}

class _AnimatedItemState extends State<AnimatedItem>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this, duration: widget.duration);

    final Offset beginOffset = widget.fromRightToLeft
        ? const Offset(1.5, 0)
        : const Offset(0, 1.5);

    _slideAnimation = Tween<Offset>(begin: beginOffset, end: Offset.zero)
        .animate(
          CurvedAnimation(
            parent: _controller,
            curve: Interval(
              0.01 * widget.index,
              min(1.0, 0.1 * widget.index + 0.5),
              curve: Curves.easeOut,
            ),
          ),
        );

    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(
          0.01 * widget.index,
          min(1.0, 0.1 * widget.index + 0.5),
          curve: Curves.easeOut,
        ),
      ),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        return SlideTransition(
          position: _slideAnimation,
          child: FadeTransition(opacity: _fadeAnimation, child: widget.child),
        );
      },
    );
  }
}
