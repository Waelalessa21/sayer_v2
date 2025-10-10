import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sayer_app/common/helpers/extension.dart';
import 'package:sayer_app/common/layout/app_white_pattern.dart';
import 'package:sayer_app/common/routing/routes.dart';
import 'package:sayer_app/common/theming/app_colors.dart';
import 'package:sayer_app/common/layout/app_default_bar.dart';
import 'package:animated_introduction/animated_introduction.dart';
import 'package:sayer_app/features/onBoarding/ui/widgets/on_boarding_three.dart';
import 'package:sayer_app/features/onBoarding/ui/widgets/on_boarding_two.dart';
import 'package:sayer_app/features/onBoarding/ui/widgets/on_boardnig_one.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final List<SingleIntroScreen> pages = [];
  late PageController _pageController;
  int currentPageIndex = 0;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();

    pages.addAll([
      SingleIntroScreen(
        slidePagePadding: EdgeInsets.all(0),
        imageHeightMultiple: 0,
        title: 'اهلًا وسهلًا!',
        description: 'حياك الله في منصة ساير',
        headerWidget: OnBoardingOne(controller: _pageController),
      ),
      SingleIntroScreen(
        imageHeightMultiple: 0,
        slidePagePadding: EdgeInsets.all(0),
        title: 'جمعناها',
        description: 'ما يحتاج تلف و تدور ساير جمعها لك بمكان واحد',
        headerWidget: OnBoardingTwo(controller: _pageController),
      ),
      SingleIntroScreen(
        imageHeightMultiple: 0,
        headerWidget: OnBoardingThree(controller: _pageController),
        slidePagePadding: EdgeInsets.all(0),
        title: 'محتااار؟',
        description: "ساير يساعدك! حنا ندور لك السيارة اللي تناسبك",
      ),
    ]);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextPage() {
    if (_pageController.page! < pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut,
      );
    } else {
      context.pushNamed(Routes.login);
    }
  }

  void _skip() {
    context.pushNamed(Routes.login);
  }

  void _onPageChanged(int index) {
    setState(() {
      currentPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppWhitePattern(
      noPettern: true,
      appBar: AppDefaultBar(showbackArrow: false),
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: _onPageChanged,
                children: pages.map((page) {
                  return AnimatedIntroduction(
                    containerBg: AppColors.white,
                    textColor: AppColors.sSecondery,
                    footerBgColor: AppColors.white,
                    topHeightForFooter: 450.sp,
                    footerRadius: 30.r,
                    nextText: '',
                    skipText: '',
                    doneText: '',
                    slides: [page],
                    indicatorType: IndicatorType.circle,
                    onDone: () {},
                    onSkip: _skip,
                  );
                }).toList(),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 65.sp),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: 60.w,
                    height: 60.h,
                    child: CircularProgressIndicator(
                      value: (currentPageIndex + 1) / pages.length,
                      strokeWidth: 2,
                      backgroundColor: AppColors.sSecondery.withOpacity(0.3),
                      valueColor: AlwaysStoppedAnimation<Color>(
                        AppColors.sSecondery,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: _nextPage,
                    child: CircleAvatar(
                      radius: 25.r,
                      backgroundColor: AppColors.textDarkBlue,
                      child: const Icon(
                        Icons.arrow_forward,
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
}
