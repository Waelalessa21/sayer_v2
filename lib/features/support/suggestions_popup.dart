import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sayer_app/common/constants/app_sizes.dart';
import 'package:sayer_app/common/helpers/user_session.dart';
import 'package:sayer_app/common/theming/app_colors.dart';
import 'package:sayer_app/common/widgets/animation/animated_item.dart';
import 'package:sayer_app/common/widgets/popup/show_toast_message.dart';
import 'package:sayer_app/common/widgets/custom_shape/text_and_icon.dart';
import 'package:sayer_app/features/support/logic/support_cubit.dart';
import 'package:sayer_app/features/support/ui/widgets/suggestions_popup.dart';
import 'package:sayer_app/features/support/ui/widgets/support_cubit_lisener.dart';

class SuggestionsPopUp extends StatefulWidget {
  final String where;

  const SuggestionsPopUp({super.key, required this.where, e});

  @override
  State<SuggestionsPopUp> createState() => _SuggestionsPopUpState();
}

class _SuggestionsPopUpState extends State<SuggestionsPopUp> {
  bool isTyping = false;
  bool showNameFields = false;
  Set<String> usedSuggestions = {};
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();

  final Map suggestionData = {
    'موديل ٢٠٢٥': {'color': AppColors.primary},
    'لون اسود': {'color': AppColors.darkerGrey},
  };

  bool _isSuggestionInText(String suggestion, String text) {
    return text.contains(suggestion);
  }

  void _handleSuggestionTap(String text) {
    if (!usedSuggestions.contains(text)) {
      final textController = context.read<SupportCubit>().supportTextfield;
      textController.text = '${textController.text} $text';
      setState(() {
        usedSuggestions.add(text);
      });
    }
  }

  bool _isInvalidName(String? name) {
    return name == null || name.trim().isEmpty || name == "null" || name == "1";
  }

  void _onSend() {
    final cubit = context.read<SupportCubit>();
    final textController = cubit.supportTextfield;

    if (showNameFields) {
      if (_isInvalidName(firstNameController.text)) {
        showToastMessage(
          context,
          "الرجاء إدخال الاسم الأول",
          "assets/icons/question.png",
          isError: true,
        );
        return;
      }
      userName = firstNameController.text.trim();
      lastName = lastNameController.text.trim();
      setState(() {
        showNameFields = false;
      });
    }

    if (_isInvalidName(userName)) {
      setState(() {
        showNameFields = true;
      });
      return;
    }

    if (textController.text.trim().isEmpty) {
      showToastMessage(
        context,
        "الرجاء ادخال اسم السيارة",
        "assets/icons/question.png",
        isError: true,
      );
      return;
    }

    cubit.suggestionCars(widget.where);
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.lightGrey,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.r),
          topRight: Radius.circular(10.r),
        ),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.defaultSpace.sp,
        vertical: AppSizes.xs.sp,
      ),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withOpacity(0.05),
              blurRadius: 58,
              spreadRadius: 30,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: AppSizes.spaceBtwSections.h),
            if (!showNameFields) ...[
              Center(
                child: AnimatedItem(
                  index: 0,
                  fromRightToLeft: true,
                  child: TextAndIcon(
                    iconPath: "assets/icons/request.png",
                    label: "وش تامر عليه",
                    description: "علمنا السيارة اللي بخاطرك و ازهل!",
                    onPressed: () {},
                  ),
                ),
              ),
              SizedBox(height: AppSizes.spaceBtwSections.h),
            ],
            AnimatedSize(
              duration: const Duration(milliseconds: 300),
              child: showNameFields
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextAndIcon(
                          iconPath: "assets/icons/question.png",
                          label: "سعيدين بخدمتك",
                          description: "زودنا باسمك لمرة واحدة",
                          onPressed: () {},
                        ),
                        SizedBox(height: AppSizes.spaceBtwSections.h),
                        TextField(
                          controller: firstNameController,
                          decoration: InputDecoration(hintText: "الاسم الاول"),
                        ),
                        SizedBox(height: AppSizes.iconMd.h),
                        TextField(
                          controller: lastNameController,
                          decoration: InputDecoration(hintText: "الاسم الاخير"),
                        ),
                      ],
                    )
                  : Column(
                      children: [
                        TextField(
                          controller: context
                              .read<SupportCubit>()
                              .supportTextfield,
                          maxLines: 2,
                          onChanged: (value) {
                            setState(() {
                              isTyping = value.isNotEmpty;
                              for (String suggestion in suggestionData.keys) {
                                if (_isSuggestionInText(suggestion, value)) {
                                  usedSuggestions.add(suggestion);
                                } else {
                                  usedSuggestions.remove(suggestion);
                                }
                              }
                            });
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColors.borderPrimary,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColors.buttonDisabled,
                              ),
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            hintText: ' تايوتا كامري GLX 2025 ابيض ..',
                          ),
                        ),
                        SizedBox(height: AppSizes.spaceBtwItems.h),
                        AnimatedOpacity(
                          opacity: isTyping ? 1.0 : 0.0,
                          duration: const Duration(milliseconds: 300),
                          child: AnimatedSize(
                            duration: const Duration(milliseconds: 300),
                            alignment: Alignment.topRight,
                            child: isTyping
                                ? Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: suggestionData.entries.map((
                                      entry,
                                    ) {
                                      return Padding(
                                        padding: EdgeInsets.only(left: 16.h),
                                        child: CarSuggestionOptions(
                                          text: entry.key,
                                          borderColor: entry.value['color'],
                                          onTap: () =>
                                              _handleSuggestionTap(entry.key),
                                          isUsed: usedSuggestions.contains(
                                            entry.key,
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                  )
                                : const SizedBox.shrink(),
                          ),
                        ),
                      ],
                    ),
            ),
            SizedBox(height: AppSizes.spaceBtwSections.h),
            AnimatedItem(
              index: 3,
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _onSend,
                  child: Text(
                    'إرسال',
                    style: Theme.of(
                      context,
                    ).textTheme.titleSmall!.apply(color: AppColors.white),
                  ),
                ),
              ),
            ),
            SizedBox(height: AppSizes.spaceBtwSections.h),
            const SupportCubitLisener(),
          ],
        ),
      ),
    );
  }
}
