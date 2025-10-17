import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sayer_app/common/business/user/cubit/user_cubit.dart';
import 'package:sayer_app/common/constants/app_sizes.dart';
import 'package:sayer_app/common/di/dependency_injection.dart';
import 'package:sayer_app/common/helpers/extension.dart';
import 'package:sayer_app/common/helpers/user_session.dart';
import 'package:sayer_app/common/routing/routes.dart';
import 'package:sayer_app/common/theming/app_colors.dart';
import 'package:sayer_app/common/widgets/popup/guest_notification.dart';
import 'package:sayer_app/common/widgets/popup/profile_bottom_sheet.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key, this.leadingIcon, this.leadingOnPressed});

  final IconData? leadingIcon;
  final VoidCallback? leadingOnPressed;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: AppSizes.md.sp),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 8.0.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  style: IconButton.styleFrom(
                    splashFactory: NoSplash.splashFactory,
                    overlayColor: Colors.transparent,
                  ),
                  onPressed: leadingOnPressed,
                  icon: Icon(
                    leadingIcon ?? Icons.menu,
                    color: Colors.white,
                    size: 28.sp,
                  ),
                ),
                IconButton(
                  style: IconButton.styleFrom(
                    splashFactory: NoSplash.splashFactory,
                    overlayColor: Colors.transparent,
                  ),
                  onPressed: () {
                    if (isLoggedInUser) {
                      context.pushNamed(Routes.search);
                    } else {
                      showGuestToastMessage(
                        context,
                        "assets/icons/suggestion.png",
                        "الوصول لمميزات ساير",
                        "يرجى تسجيل الدخول للوصول لكافة المميزات",
                      );
                    }
                  },
                  icon: Icon(
                    Iconsax.search_normal,
                    color: Colors.white,
                    size: 28.sp,
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: _handleUserTap(context),
                    child: Text(
                      'أهلًا، ${userName.isEmpty ? 'عرفنا عليك؟' : userName} 👋',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontSize: 20.sp,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 4.h),
                  GestureDetector(
                    onTap: _handleUserTap(context),
                    child: Text(
                      'ســـاير رفيقك ويسهّل طــريقك',
                      style: Theme.of(context).textTheme.headlineSmall!
                          .copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 22.sp,
                            color: Colors.white,
                          ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  VoidCallback? _handleUserTap(BuildContext context) {
    return () {
      if (isLoggedInUser) {
        showModalBottomSheet(
          useRootNavigator: true,
          backgroundColor: AppColors.lightGrey,
          context: context,
          showDragHandle: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(10.r)),
          ),
          isScrollControlled: true,
          builder: (BuildContext context) {
            return Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: BlocProvider(
                create: (context) => UserCubit(getIt()),
                child: ProfileBottomSheet(),
              ),
            );
          },
        );
      } else {
        showGuestToastMessage(
          context,
          "assets/icons/question.png",
          "تحديث اسم المستخدم",
          "تغيير اسم المستخدم يتطلب تسجيل الدخول",
        );
      }
    };
  }

  @override
  Size get preferredSize => const Size.fromHeight(140);
}
