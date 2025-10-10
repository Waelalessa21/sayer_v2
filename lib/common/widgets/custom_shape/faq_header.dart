import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FaqHeader extends StatefulWidget {
  const FaqHeader({super.key, this.qusation = false});

  final bool qusation;

  @override
  FaqHeaderState createState() => FaqHeaderState();
}

class FaqHeaderState extends State<FaqHeader>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: -6.0, end: 6.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool qusation = widget.qusation;
    return ClipRRect(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(45.0.r),
        bottomRight: Radius.circular(45.0.r),
      ),
      child: Container(
        height: 320.0.h,
        decoration: BoxDecoration(color: Color(0xFF031C9E)),
        child: Stack(
          children: [
            Positioned(
              top: 10.0,
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  height: 5.0.h,
                  width: 50.0.w,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 50.0,
              left: 0,
              right: 0,
              child: Center(
                child: Column(
                  children: [
                    Text(
                      qusation ? 'أسئلتكم' : 'اقتراحاتكم',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      height: 2.5.h,
                      width: 160.0.w,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black,
                            blurRadius: 11,
                            offset: Offset(0, 5),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 0.0,
              left: 0,
              right: 0,
              child: SizedBox(
                height: 320.h,
                width: double.infinity,
                child: Image.asset(fit: BoxFit.fill, 'assets/images/Noise.png'),
              ),
            ),
            Positioned(
              top: 25.0,
              left: 265,
              right: 0,
              child: SizedBox(
                height: 55.h,
                child: Image.asset(
                  'assets/images/star.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Positioned(
              top: 20.0,
              left: 0,
              right: 285,
              child: SizedBox(
                height: 35.h,
                child: Image.asset(
                  'assets/images/star.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Positioned(
              top: 100.0,
              left: 0,
              right: 50,
              child: SizedBox(
                height: 65.h,
                child: Image.asset(
                  'assets/images/star.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Positioned(
              top: 120.0,
              left: 0,
              right: 0,
              child: SizedBox(
                height: 200.h,
                child: Image.asset(
                  'assets/images/empty_mock.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
            // Animated star 1
            AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Positioned(
                  top: 70.0 + _animation.value,
                  left: 0,
                  right: 250,
                  child: SizedBox(height: 100, child: child),
                );
              },
              child: Image.asset(
                qusation
                    ? 'assets/images/question75.png'
                    : 'assets/images/bubble_with_stars.png',
                fit: BoxFit.contain,
              ),
            ),
            // Animated star 2
            AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Positioned(
                  top: 120.0 - _animation.value,
                  left: 250,
                  right: 0,
                  child: SizedBox(height: 100.h, child: child),
                );
              },
              child: Image.asset(
                qusation
                    ? 'assets/images/question100.png'
                    : 'assets/images/bubble_with_stars.png',
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
