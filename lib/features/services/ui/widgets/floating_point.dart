import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sayer_app/common/theming/app_colors.dart';
import 'package:sayer_app/common/widgets/floating/faq_bottom_sheet.dart';
import 'package:sayer_app/common/widgets/floating/suggestion_bottom_sheet.dart';
import 'package:sayer_app/common/widgets/floating/suggestion_options.dart';
import 'package:sayer_app/features/support/logic/support_cubit.dart';
import 'package:sayer_app/features/support/ui/widgets/suggestions_popup.dart';

class FloatingPoint extends StatefulWidget {
  final String? title;
  final String? imgPath;

  const FloatingPoint({super.key, this.title, this.imgPath});

  @override
  FloatingPointState createState() => FloatingPointState();
}

class FloatingPointState extends State<FloatingPoint> {
  bool isExpanded = false;
  Timer? _timer;
  final TextEditingController suggestionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    suggestionController.dispose();

    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      setState(() {
        isExpanded = !isExpanded;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showGeneralDialog(
          context: context,
          barrierDismissible: true,
          barrierLabel: '',
          barrierColor: Colors.transparent,
          transitionDuration: Duration(milliseconds: 300),
          pageBuilder: (context, animation, secondaryAnimation) {
            return WillPopScope(
              onWillPop: () async {
                return true;
              },
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Scaffold(
                  backgroundColor: Colors.transparent,
                  body: Stack(
                    children: [
                      BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 32.0, sigmaY: 32.0),
                        child: Container(color: Colors.white.withOpacity(0.6)),
                      ),
                      Center(
                        child: GestureDetector(
                          onTap: () {},
                          child: AnimatedOpacity(
                            opacity: 1.0,
                            duration: Duration(milliseconds: 300),
                            child: Hero(
                              tag: 'floatingActionHero',
                              child: SuggestionsOptions(
                                onSuggestionTap: (label) {
                                  if (label == 'سؤال') {
                                    showModalBottomSheet(
                                      showDragHandle: false,
                                      context: context,
                                      isScrollControlled: true,
                                      clipBehavior: Clip.none,
                                      isDismissible: true,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20.0),
                                          topRight: Radius.circular(20.0),
                                        ),
                                      ),
                                      builder: (BuildContext context) {
                                        return DraggableScrollableSheet(
                                          expand: false,
                                          initialChildSize: 0.92,
                                          minChildSize: 0.8,
                                          maxChildSize: 0.92,
                                          builder: (context, scrollController) {
                                            return BlocProvider(
                                              create: (context) =>
                                                  SupportCubit(),
                                              child: FaqBottomSheet(
                                                suggestionController:
                                                    suggestionController,
                                                scrollController:
                                                    scrollController,
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    );
                                  } else if (label == 'أقتراح') {
                                    showModalBottomSheet(
                                      showDragHandle: false,
                                      context: context,
                                      isScrollControlled: true,
                                      clipBehavior: Clip.none,
                                      isDismissible: true,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20.0),
                                          topRight: Radius.circular(20.0),
                                        ),
                                      ),
                                      builder: (BuildContext context) {
                                        return BlocProvider(
                                          create: (context) => SupportCubit(),
                                          child: SuggestionBottomSheet(
                                            suggestionController:
                                                suggestionController,
                                          ),
                                        );
                                      },
                                    );
                                  } else {
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
                                            bottom: MediaQuery.of(
                                              context,
                                            ).viewInsets.bottom,
                                          ),
                                          child: BlocProvider(
                                            create: (context) => SupportCubit(),
                                            child: SuggestionsPopUp(
                                              where: 'Floating Point',
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  }
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        padding: EdgeInsets.symmetric(
          horizontal: isExpanded ? 12.w : 10.w,
          vertical: 10.h,
        ),
        decoration: BoxDecoration(
          color: AppColors.light,
          borderRadius: BorderRadius.circular(50.h),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isExpanded)
              Padding(
                padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                child: Text(
                  "أحتاج مساعدة؟",
                  style: TextStyle(
                    color: AppColors.textDarkBlue,
                    fontSize: 12.sp,
                  ),
                ),
              ),
            CircleAvatar(
              radius: 14.r,
              backgroundColor: AppColors.primary.withOpacity(0.20),
              child: Image.asset(
                widget.imgPath ?? "assets/icons/question.png",
                width: 12.w,
                height: 12.h,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
