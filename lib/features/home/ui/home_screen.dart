import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sayer_app/common/constants/app_sizes.dart';
import 'package:sayer_app/common/helpers/user_session.dart';
import 'package:sayer_app/common/theming/app_colors.dart';
import 'package:sayer_app/common/widgets/popup/guest_notification.dart';
import 'package:sayer_app/features/home/logic/home_service.dart';
import 'package:sayer_app/features/home/ui/widgets/car_offers_and_brand_listener.dart';
import 'package:sayer_app/features/home/ui/widgets/find_car_service.dart';
import 'package:sayer_app/features/home/ui/widgets/home_app_bar.dart';
import 'package:sayer_app/features/home/ui/widgets/home_controller.dart';
import 'package:sayer_app/features/home/ui/widgets/home_layout.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, this.scaffoldKey});

  final GlobalKey<ScaffoldState>? scaffoldKey;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeController homeController = Get.put(HomeController());
  bool _checkedUpdate = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initializePage();
      HomeService.initializeFCM(context);
    });
  }

  Future<void> _initializePage() async {
    await HomeService.initializePage(
      context,
      (value) => setState(() => _checkedUpdate = value),
      _checkedUpdate,
    );
    setState(() {});
  }

  Future<void> _refresh() async {
    await HomeService.refresh(context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return HomeLayout(
      appBar: HomeAppBar(
        leadingIcon: Iconsax.menu_14,
        leadingOnPressed: () {
          if (isLoggedInUser) {
            widget.scaffoldKey?.currentState?.openDrawer();
          } else {
            showGuestToastMessage(
              context,
              "assets/icons/suggestion.png",
              "الوصول لمميزات ساير",
              "يرجى تسجيل الدخول للوصول لكافة المميزات",
            );
          }
        },
      ),
      child: RefreshIndicator(
        color: AppColors.primary,
        backgroundColor: AppColors.white,
        onRefresh: _refresh,
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSizes.defaultSpace.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: AppSizes.spaceBtwInputFields.h),
                FindCarService(),
                SizedBox(height: AppSizes.spaceBtwInputFields.h),
                CarOffersAndBrandCubitLisiner(),
                SizedBox(height: AppSizes.spaceBtwInputFields.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
