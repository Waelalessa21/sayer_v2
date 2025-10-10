import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sayer_app/common/business/user/cubit/user_cubit.dart';
import 'package:sayer_app/common/business/user/cubit/user_cubit_listener.dart';
import 'package:sayer_app/common/constants/app_sizes.dart';
import 'package:sayer_app/common/helpers/extension.dart';
import 'package:sayer_app/common/helpers/user_session.dart';
import 'package:sayer_app/common/theming/app_colors.dart';
import 'package:sayer_app/common/widgets/custom_shape/text_and_icon.dart';

class ProfileBottomSheet extends StatefulWidget {
  const ProfileBottomSheet({super.key});

  @override
  State<ProfileBottomSheet> createState() => _ProfileBottomSheetState();
}

class _ProfileBottomSheetState extends State<ProfileBottomSheet> {
  final _formKey = GlobalKey<FormState>();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final maxH = MediaQuery.of(context).size.height * 0.6;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        padding: EdgeInsets.only(
          left: AppSizes.defaultSpace.sp,
          right: AppSizes.defaultSpace.sp,
          top: AppSizes.defaultSpace.sp,
        ),
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: AppColors.primary.withOpacity(0.09),
                blurRadius: 51,
                spreadRadius: 2,
                offset: const Offset(39, -1),
              ),
            ],
          ),
          child: ConstrainedBox(
            constraints: BoxConstraints(maxHeight: maxH),
            child: SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              child: Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextAndIcon(
                        iconPath: "assets/icons/question.png",
                        label: "حياك الله نورتنا",
                        description: "زودنا باسمك الكريم",
                        onPressed: () {},
                      ),
                    ),
                    SizedBox(height: AppSizes.spaceBtwSections.h),
                    TextFormField(
                      controller: firstNameController,
                      decoration: InputDecoration(
                        hintStyle: Theme.of(context).textTheme.labelSmall,
                        prefixIcon: const Icon(Iconsax.user),
                        labelText: 'الاسم الأول',
                      ),
                      validator: (v) => (v == null || v.trim().isEmpty)
                          ? 'الرجاء إدخال الاسم الأول'
                          : null,
                    ),
                    SizedBox(height: AppSizes.iconMd.h),
                    TextFormField(
                      controller: lastNameController,
                      decoration: InputDecoration(
                        hintStyle: Theme.of(context).textTheme.labelSmall,
                        prefixIcon: const Icon(Iconsax.user),
                        labelText: 'الاسم الأخير',
                      ),
                      validator: (v) => (v == null || v.trim().isEmpty)
                          ? 'الرجاء إدخال الاسم الأخير'
                          : null,
                    ),

                    SizedBox(height: AppSizes.spaceBtwSections.h),

                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () async {
                          if (!(_formKey.currentState?.validate() ?? false))
                            return;

                          context.read<UserCubit>().getUserID();
                          if ((userName).isEmpty) {
                            await context.read<UserCubit>().submitUser(
                              firstNameController.text.trim(),
                              lastNameController.text.trim(),
                            );
                          } else {
                            await context.read<UserCubit>().updateUser(
                              firstNameController.text.trim(),
                              lastNameController.text.trim(),
                            );
                          }
                          if (mounted) context.pop();
                        },
                        child: Text(
                          'إرسال',
                          style: Theme.of(
                            context,
                          ).textTheme.titleSmall!.apply(color: AppColors.white),
                        ),
                      ),
                    ),

                    SizedBox(height: AppSizes.spaceBtwSections.h),
                    UserCubitListener(parentContext: context),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
