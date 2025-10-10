import 'package:flutter/material.dart';
import 'package:sayer_app/common/helpers/user_session.dart';
import 'package:sayer_app/common/theming/app_colors.dart';

class AppGradientColor extends StatelessWidget {
  const AppGradientColor({
    super.key,
    required this.child,
    this.appBar,
    this.drawer,
    this.bottomNavigationBar,
    this.scaffoldMake = true,
  });
  final Widget child;
  final PreferredSizeWidget? appBar;
  final Widget? drawer;
  final bool scaffoldMake;
  final Widget? bottomNavigationBar;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment(0, -0.2),
          colors: [AppColors.gradientStart, AppColors.white],
        ),
      ),
      child: scaffoldMake
          ? Scaffold(
              resizeToAvoidBottomInset: false,
              bottomNavigationBar: bottomNavigationBar ?? SizedBox.shrink(),
              drawer: isLoggedInUser
                  ? drawer ?? SizedBox.shrink()
                  : SizedBox.shrink(),
              backgroundColor: Colors.transparent,
              appBar: appBar,
              body: child,
            )
          : child,
    );
  }
}
