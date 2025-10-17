import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sayer_app/common/constants/app_sizes.dart';
import 'package:sayer_app/common/helpers/extension.dart';
import 'package:sayer_app/common/helpers/shared_preference.dart';
import 'package:sayer_app/common/helpers/user_session.dart';
import 'package:sayer_app/common/routing/routes.dart';
import 'package:sayer_app/common/theming/app_colors.dart';
import 'package:sayer_app/common/widgets/drawer/app_drawer_style.dart';
import 'package:sayer_app/features/mehtar/ui/widgets/mehtar_not_available.dart';
import 'package:sayer_app/features/support/logic/support_cubit.dart';
import 'package:sayer_app/features/support/ui/support_bottom_sheet.dart';
import 'package:sayer_app/features/support/ui/widgets/delete_account.dart';

import 'package:url_launcher/url_launcher.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: AppSizes.spaceBtwSections * 2.5.sp,
          horizontal: AppSizes.md.sp,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppDrawerStyle(
              text: 'الصفحة الرئيسية',
              icon: Iconsax.home,
              onPressed: () {
                context.pop();
              },
            ),
            AppDrawerStyle(
              text: 'محتار',
              icon: Iconsax.wallet,
              onPressed: () {
                // context.pushNamed(Routes.mehtar);
                context.pop();
                showDialog(
                  barrierDismissible: true,
                  context: context,
                  builder: (context) => Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Center(child: MehtarNotAvailable()),
                  ),
                );
              },
            ),
            AppDrawerStyle(
              text: 'البحث',
              icon: Iconsax.search_favorite,
              onPressed: () {
                context.pop();
                context.pushNamed(Routes.search);
              },
            ),
            AppDrawerStyle(
              text: 'الوكالات',
              icon: Iconsax.car,
              onPressed: () {
                context.pop();
                context.pushNamed(Routes.brands);
              },
            ),
            AppDrawerStyle(
              text: 'من نحن ',
              icon: Iconsax.people,
              onPressed: () {
                context.pop();
                context.pushNamed(Routes.aboutUs);
              },
            ),
            Divider(),
            AppDrawerStyle(
              text: 'خـدمات ســـاير',
              icon: Iconsax.mobile_programming,
              onPressed: () {
                context.pop();
                context.pushNamed(Routes.services);
              },
            ),
            AppDrawerStyle(
              text: 'الدعم الفني',
              icon: Iconsax.call,
              onPressed: () {
                Navigator.pop(context);
                showModalBottomSheet(
                  backgroundColor: AppColors.lightGrey,
                  context: context,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(10.r),
                    ),
                  ),
                  isScrollControlled: true,
                  builder: (BuildContext context) {
                    return Padding(
                      padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom,
                      ),
                      child: BlocProvider(
                        create: (context) => SupportCubit(),
                        child: SupportBottomSheet(),
                      ),
                    );
                  },
                );
              },
            ),

            AppDrawerStyle(
              text: 'حذف الحساب',
              icon: Iconsax.profile_delete,
              onPressed: () {
                Navigator.pop(context);
                showModalBottomSheet(
                  backgroundColor: AppColors.lightGrey,
                  context: context,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(10.r),
                    ),
                  ),
                  isScrollControlled: true,
                  builder: (BuildContext context) {
                    return Padding(
                      padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom,
                      ),
                      child: BlocProvider(
                        create: (context) => SupportCubit(),
                        child: DeleteAccount(),
                      ),
                    );
                  },
                );
              },
            ),
            AppDrawerStyle(
              text: 'الشروط و الاحكام',
              icon: Iconsax.document_text,
              onPressed: () async {
                const url =
                    'https://sayeer.sa/#/policyScreen'; // Replace The new Policy URL
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  throw 'Could not launch $url';
                }
              },
            ),
            AppDrawerStyle(
              text: 'تسجيل الخروج',
              icon: Iconsax.logout,
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                await SharedPrefHelper.clearAllData();
                await SharedPrefHelper.clearAllSecuredData();
                cleanCache();
                userId = 0;
                userName = '';
                // ignore: use_build_context_synchronously
                context.pushNamed(Routes.login);
              },
            ),
          ],
        ),
      ),
    );
  }
}
