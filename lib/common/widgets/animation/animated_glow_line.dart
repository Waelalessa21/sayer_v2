import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnimatedGlowLine extends StatefulWidget {
  final double width;
  const AnimatedGlowLine({super.key, required this.width});

  @override
  State<AnimatedGlowLine> createState() => _AnimatedGlowLineState();
}

class _AnimatedGlowLineState extends State<AnimatedGlowLine>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _position;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 6),
    )..repeat(reverse: true);

    _position = Tween<double>(
      begin: -0.3,
      end: 1.3,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _position,
      builder: (context, child) {
        return Positioned(
          left: _position.value * widget.width,
          top: 0,
          bottom: 0,
          child: Transform.rotate(
            angle: -0.4,
            child: Container(
              width: 250.w,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.transparent,
                    Colors.white.withOpacity(0.08),
                    const Color(0xFF6FB1FC).withOpacity(0.12),
                    Colors.transparent,
                  ],
                  stops: const [0.0, 0.4, 0.6, 1.0],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
