import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sayer_app/common/theming/app_colors.dart';
import 'package:sayer_app/common/widgets/drawer/app_drawer_menu.dart';
import 'package:sayer_app/features/activity/ui/activity_screen.dart';
import 'package:sayer_app/features/favourite/ui/favourite_screen.dart';
import 'package:sayer_app/features/home/ui/home_screen.dart';
import 'package:sayer_app/features/offers/ui/offers_screen.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  NavBarState createState() => NavBarState();
}

class NavBarState extends State<NavBar> {
  int _selectedIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _isDrawerOpen = false;
  late final List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    _selectedIndex = 0;
    _screens = [
      HomeScreen(scaffoldKey: _scaffoldKey),
      FavouriteScreen(scaffoldKey: _scaffoldKey),
      OffersScreen(),
      ActivityScreen(),
    ];
  }

  void _goToBranch(int index) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const DrawerMenu(),
      onDrawerChanged: (isOpen) {
        setState(() {
          _isDrawerOpen = isOpen;
        });
      },
      body: _screens[_selectedIndex],
      bottomNavigationBar: _isDrawerOpen
          ? null
          : Theme(
              data: Theme.of(context).copyWith(
                splashFactory: NoSplash.splashFactory,
                highlightColor: Colors.transparent,
              ),
              child: BottomNavigationBar(
                elevation: 0,
                currentIndex: _selectedIndex,
                backgroundColor: AppColors.white,
                selectedItemColor: AppColors.sSecondery,
                unselectedItemColor: AppColors.sSecondery.withOpacity(0.2),
                type: BottomNavigationBarType.fixed,
                selectedFontSize: 11.sp,
                unselectedFontSize: 11.sp,
                onTap: (index) {
                  setState(() => _selectedIndex = index);

                  _goToBranch(index);
                },
                items: [
                  BottomNavigationBarItem(
                    icon: SizedBox(
                      width: 22.w,
                      height: 22.h,
                      child: ColorFiltered(
                        colorFilter: ColorFilter.mode(
                          _selectedIndex == 0
                              ? AppColors.sSecondery
                              : AppColors.sSecondery.withOpacity(0.2),
                          BlendMode.srcIn,
                        ),
                        child: Image.asset('assets/icons/home.png'),
                      ),
                    ),
                    label: 'الرئيسية',
                  ),
                  BottomNavigationBarItem(
                    icon: SizedBox(
                      width: 22.w,
                      height: 22.h,
                      child: ColorFiltered(
                        colorFilter: ColorFilter.mode(
                          _selectedIndex == 1
                              ? AppColors.sSecondery
                              : AppColors.sSecondery.withOpacity(0.2),
                          BlendMode.srcIn,
                        ),
                        child: Image.asset('assets/icons/like.png'),
                      ),
                    ),
                    label: 'المفضلة',
                  ),
                  BottomNavigationBarItem(
                    icon: SizedBox(
                      width: 22.w,
                      height: 22.h,
                      child: ColorFiltered(
                        colorFilter: ColorFilter.mode(
                          _selectedIndex == 2
                              ? AppColors.sSecondery
                              : AppColors.sSecondery.withOpacity(0.2),
                          BlendMode.srcIn,
                        ),
                        child: Image.asset('assets/icons/discount.png'),
                      ),
                    ),
                    label: 'العروض',
                  ),
                  BottomNavigationBarItem(
                    icon: SizedBox(
                      width: 22.w,
                      height: 22.h,
                      child: ColorFiltered(
                        colorFilter: ColorFilter.mode(
                          _selectedIndex == 3
                              ? AppColors.sSecondery
                              : AppColors.sSecondery.withOpacity(0.2),
                          BlendMode.srcIn,
                        ),
                        child: Image.asset('assets/icons/activity.png'),
                      ),
                    ),
                    label: 'النشاط',
                  ),
                ],
              ),
            ),
    );
  }
}
