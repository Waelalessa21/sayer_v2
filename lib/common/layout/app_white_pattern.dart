import 'package:flutter/material.dart';
import 'package:sayer_app/common/theming/app_colors.dart';

/// A white pattern layout for the app
class AppWhitePattern extends StatelessWidget {
  const AppWhitePattern({
    super.key,
    required this.child,
    this.appBar,
    this.drawer,
    this.bottomNavigationBar,
    this.noPettern = false,
  });
  final bool noPettern;
  final Widget child;
  final PreferredSizeWidget? appBar;
  final Widget? drawer;
  final Widget? bottomNavigationBar;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      child: Stack(
        children: [
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: appBar,
            drawer: drawer ?? SizedBox.shrink(),
            bottomNavigationBar: bottomNavigationBar ?? SizedBox.shrink(),
            body: child,
          ),
          if (!noPettern)
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: IgnorePointer(
                child: Image(
                  image: AssetImage('assets/images/small_upper_pattern.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
