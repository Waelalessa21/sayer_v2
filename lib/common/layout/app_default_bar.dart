import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sayer_app/common/business/user/cubit/user_cubit.dart';
import 'package:sayer_app/common/constants/app_sizes.dart';
import 'package:sayer_app/common/di/dependency_injection.dart';
import 'package:sayer_app/common/helpers/extension.dart';
import 'package:sayer_app/common/helpers/user_session.dart';
import 'package:sayer_app/common/helpers/utility_device.dart';
import 'package:sayer_app/common/theming/app_colors.dart';
import 'package:sayer_app/common/widgets/animation/animated_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sayer_app/common/widgets/popup/guest_popup.dart';
import 'package:sayer_app/common/widgets/popup/profile_bottom_sheet.dart';

class AppDefaultBar extends StatelessWidget implements PreferredSizeWidget {
  const AppDefaultBar({
    super.key,
    this.title,
    this.showbackArrow = false,
    this.leadingIcon,
    this.action,
    this.leadingOnPressed,
    this.arrowColor,
    this.goBack,
    this.userNameDisplay = false,
  });
  final String? title;
  final bool showbackArrow;
  final IconData? leadingIcon;
  final List<Widget>? action;
  final VoidCallback? leadingOnPressed;
  final Color? arrowColor;
  final String? goBack;
  final bool userNameDisplay;

  @override
  Widget build(BuildContext context) {
    final double space = MediaQuery.of(context).size.width * 0.2;
    final double space2 = (action != null)
        ? MediaQuery.of(context).size.width.w * 0.2.w
        : MediaQuery.of(context).size.width.w * 0.09.w;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.md.sp),
      child: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        scrolledUnderElevation: 0,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: showbackArrow
            ? IconButton(
                onPressed: () {
                  context.pop();
                },
                icon: Theme(
                  data: ThemeData(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                  ),
                  child: Icon(
                    Icons.arrow_back,
                    color: arrowColor ?? Colors.white,
                  ),
                ),
              )
            : leadingIcon != null
            ? IconButton(
                onPressed: leadingOnPressed,
                icon: Icon(leadingIcon, color: arrowColor ?? Colors.white),
              )
            : SizedBox(width: 20.w),
        title: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(width: space2),
              Opacity(
                opacity: 0.65,
                child: Image.asset(
                  'assets/images/Sayer_Logo.png',
                  width: 45.w,
                  height: 45.w,
                ),
              ),
              if (userNameDisplay)
                GestureDetector(
                  onTap: () {
                    {
                      isLoggedInUser
                          ? showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AnimatedItem(
                                  index: 1,
                                  child: Dialog(
                                    backgroundColor: AppColors.lightGrey,
                                    child: BlocProvider(
                                      create: (context) => UserCubit(getIt()),
                                      child: ProfileBottomSheet(),
                                    ),
                                  ),
                                );
                              },
                            )
                          : showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AnimatedItem(
                                  index: 1,
                                  child: Dialog(
                                    backgroundColor: AppColors.lightGrey,
                                    child: GuestPopup(),
                                  ),
                                );
                              },
                            );
                    }
                  },
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'نورتنا و شرفتنا\n',
                          style: Theme.of(context).textTheme.titleLarge!
                              .copyWith(color: AppColors.white),
                        ),
                        TextSpan(
                          text: userName == ''
                              ? 'أكمل حسابك'
                              : userName.length > 13
                              ? '${userName.substring(0, 12)}..'
                              : userName,
                          style: Theme.of(context).textTheme.titleMedium!
                              .copyWith(color: AppColors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              if (userNameDisplay == false) SizedBox(width: space),
            ],
          ),
        ),
        actions: [if (action != null) ...action!],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(TDeviceUtils.getAppBarHeight());
}
