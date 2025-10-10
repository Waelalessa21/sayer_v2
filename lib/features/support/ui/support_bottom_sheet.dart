import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sayer_app/common/constants/app_sizes.dart';
import 'package:sayer_app/common/theming/app_colors.dart';
import 'package:sayer_app/features/support/logic/support_cubit.dart';
import 'package:sayer_app/features/support/ui/widgets/support_cubit_lisener.dart';

class SupportBottomSheet extends StatelessWidget {
  const SupportBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.lightGrey,
      padding: EdgeInsets.all(AppSizes.spaceBtwSections.sp),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              'أوصف لنا المشكلة و خلنا نساعدك!',
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
              hintText: 'وش المشكلة؟',
            ),
          ),

          SizedBox(height: AppSizes.spaceBtwSections.h),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                BlocProvider.of<SupportCubit>(context).saveMessage();
              },
              child: Text(
                'إرسال',
                style: Theme.of(
                  context,
                ).textTheme.titleSmall!.apply(color: AppColors.white),
              ),
            ),
          ),

          SupportCubitLisener(),
        ],
      ),
    );
  }
}
