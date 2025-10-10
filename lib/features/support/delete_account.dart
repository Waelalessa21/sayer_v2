import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sayer_app/common/constants/app_sizes.dart';
import 'package:sayer_app/common/theming/app_colors.dart';
import 'package:sayer_app/features/support/logic/support_cubit.dart';

class DeleteAccount extends StatelessWidget {
  const DeleteAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.lightGrey,
      padding: EdgeInsets.all(AppSizes.spaceBtwSections.sp),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text(
              'نأسف لسماع انك تريد حذف حسابك، ماهي الاسباب التي دعتك لحذف حسابك',
              style: TextStyle(
                fontSize: 16.0.sp,
                color: AppColors.textDarkBlue,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: AppSizes.spaceBtwSections.h),
          TextField(
            controller: BlocProvider.of<SupportCubit>(context).supportTextfield,
            maxLines: 6,
            maxLength: 400,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'ماهي الاسباب؟',
            ),
          ),
          SizedBox(height: AppSizes.spaceBtwSections.h),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                BlocProvider.of<SupportCubit>(context).requestAccountDeletion();
              },
              child: Text(
                'إرسال',
                style: Theme.of(
                  context,
                ).textTheme.titleSmall!.apply(color: AppColors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
