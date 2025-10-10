import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sayer_app/common/constants/app_sizes.dart';
import 'package:sayer_app/common/theming/app_colors.dart';
import 'package:sayer_app/common/widgets/animation/animated_glow_line.dart';
import 'package:sayer_app/features/home/ui/widgets/small_home_offers.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({
    super.key,
    required this.child,
    this.appBar,
    this.drawer,
    this.bottomNavigationBar,
  });

  final Widget child;
  final PreferredSizeWidget? appBar;
  final Widget? drawer;
  final Widget? bottomNavigationBar;

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Container(
      color: AppColors.white,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: 235.h,
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                final value = _controller.value;
                return Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color.lerp(
                          const Color(0xFF0052D4),
                          const Color.fromARGB(255, 97, 168, 250),
                          value,
                        )!,
                        Color.lerp(
                          const Color(0xFF4364F7),
                          const Color(0xFF0052D4),
                          value,
                        )!,
                      ],
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(AppSizes.cardRadiusLg),
                      bottomRight: Radius.circular(AppSizes.cardRadiusLg),
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(AppSizes.cardRadiusLg),
                      bottomRight: Radius.circular(AppSizes.cardRadiusLg),
                    ),
                    child: Stack(
                      children: [
                        AnimatedGlowLine(width: screenSize.width),
                        Positioned.fill(
                          child: Image.asset(
                            'assets/images/Noise.png',
                            fit: BoxFit.cover,
                            opacity: const AlwaysStoppedAnimation(0.02),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Positioned.fill(
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: widget.appBar,
              drawer: widget.drawer,
              bottomNavigationBar: widget.bottomNavigationBar,
              body: Column(
                children: [
                  SizedBox(height: screenSize.height * 0.1.h),
                  Expanded(child: widget.child),
                ],
              ),
            ),
          ),
          Positioned(
            top: screenSize.height * 0.21,
            left: AppSizes.defaultSpace,
            right: AppSizes.defaultSpace,
            child: IgnorePointer(ignoring: false, child: SmallHomeOffers()),
          ),
        ],
      ),
    );
  }
}
