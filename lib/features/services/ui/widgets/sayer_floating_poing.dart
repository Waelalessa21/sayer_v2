import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sayer_app/common/theming/app_colors.dart';
import 'package:sayer_app/common/widgets/floating/faq_bottom_sheet.dart';
import 'package:sayer_app/common/widgets/floating/suggestion_bottom_sheet.dart';
import 'package:sayer_app/common/widgets/floating/suggestion_options.dart';
import 'package:sayer_app/features/support/logic/support_cubit.dart';
import 'package:sayer_app/features/support/suggestions_popup.dart';

class SayerFloatingPoing extends StatefulWidget {
  const SayerFloatingPoing({super.key});

  @override
  SayerFloatingPoingState createState() => SayerFloatingPoingState();
}

class SayerFloatingPoingState extends State<SayerFloatingPoing> {
  final TextEditingController suggestionController = TextEditingController();

  @override
  void dispose() {
    suggestionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          right: 20.0,
          bottom: 20.0,
          child: Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Hero(
                tag: 'floatingActionHero',
                child: Container(
                  width: 48.0.w,
                  height: 48.0.h,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.primary.withOpacity(0.2),
                    ),
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primary.withOpacity(0.3),
                        blurRadius: 10,
                        offset: Offset(1, 8),
                      ),
                      BoxShadow(
                        color: AppColors.primary.withOpacity(0.3),
                        spreadRadius: -2,
                        blurRadius: 10,
                        offset: Offset(-1, -4),
                      ),
                    ],
                  ),
                ),
              ),
              FloatingActionButton.small(
                backgroundColor: Colors.white,
                onPressed: () {
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
                                  filter: ImageFilter.blur(
                                    sigmaX: 32.0,
                                    sigmaY: 32.0,
                                  ),
                                  child: Container(
                                    color: Colors.white.withOpacity(0.6),
                                  ),
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
                                                backgroundColor:
                                                    AppColors.borderSecondary,
                                                showDragHandle: false,
                                                context: context,
                                                isScrollControlled: true,
                                                clipBehavior: Clip.none,
                                                isDismissible: true,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                        topLeft:
                                                            Radius.circular(
                                                              20.0.r,
                                                            ),
                                                        topRight:
                                                            Radius.circular(
                                                              20.0,
                                                            ),
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
                                                backgroundColor:
                                                    AppColors.borderSecondary,
                                                showDragHandle: false,
                                                context: context,
                                                isScrollControlled: true,
                                                clipBehavior: Clip.none,
                                                isDismissible: true,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                        topLeft:
                                                            Radius.circular(
                                                              20.0.r,
                                                            ),
                                                        topRight:
                                                            Radius.circular(
                                                              20.0.r,
                                                            ),
                                                      ),
                                                ),
                                                builder: (BuildContext context) {
                                                  return BlocProvider(
                                                    create: (context) =>
                                                        SupportCubit(),
                                                    child: SuggestionBottomSheet(
                                                      suggestionController:
                                                          suggestionController,
                                                    ),
                                                  );
                                                },
                                              );
                                            } else {
                                              showModalBottomSheet(
                                                backgroundColor:
                                                    AppColors.lightGrey,
                                                context: context,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.vertical(
                                                        top: Radius.circular(
                                                          10.r,
                                                        ),
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
                                                      create: (context) =>
                                                          SupportCubit(),
                                                      child: SuggestionsPopUp(
                                                        where: 'Sayer Service',
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
                elevation: 0,
                child: Icon(
                  Icons.question_mark,
                  color: AppColors.textDarkBlue,
                  size: 18,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
