import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sayer_app/common/constants/app_sizes.dart';
import 'package:sayer_app/common/theming/app_colors.dart';
import 'package:sayer_app/features/support/logic/support_cubit.dart';
import 'package:sayer_app/features/support/ui/widgets/support_cubit_lisener.dart';

class SuggestionBottomSheet extends StatefulWidget {
  final TextEditingController suggestionController;

  const SuggestionBottomSheet({super.key, required this.suggestionController});

  @override
  SuggestionBottomSheetState createState() => SuggestionBottomSheetState();
}

class SuggestionBottomSheetState extends State<SuggestionBottomSheet> {
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  void _dismissKeyboard() {
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _dismissKeyboard,
      child: SingleChildScrollView(
        padding: EdgeInsets.only(
          bottom:
              MediaQuery.of(context).viewInsets.bottom + AppSizes.defaultSpace,
        ),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.lightContainer,
            borderRadius: BorderRadius.vertical(top: Radius.circular(10.r)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.sp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset("assets/images/sayer_rate.png"),
                    Text(
                      'وش ودك في ســاير؟',
                      style: TextStyle(
                        color: AppColors.sSecondery,
                        fontSize: 18.0.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: AppSizes.spaceBtwItems),
                    Wrap(
                      spacing: 8.0,
                      runSpacing: 8.0,
                      children: [
                        _buildFaqItem('واجهات المستخدم غير واضحة'),
                        _buildFaqItem('مشكله في التطبيق'),
                        _buildFaqItem('خدمة ودك فيها'),
                      ],
                    ),
                    SizedBox(height: AppSizes.spaceBtwSections),
                    TextField(
                      controller: context.read<SupportCubit>().supportTextfield,
                      focusNode: _focusNode,
                      maxLines: 2,
                      decoration: InputDecoration(
                        hintText: 'أقتراحاتكم محل اهتمامنا؟',
                      ),
                    ),
                    SizedBox(height: AppSizes.spaceBtwSections),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          context.read<SupportCubit>().suggestions();
                        },
                        child: Text('إرسال'),
                      ),
                    ),
                    SizedBox(height: AppSizes.spaceBtwSections),
                    SupportCubitLisener(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFaqItem(String question) {
    return Container(
      padding: EdgeInsets.all(8.sp),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.primary.withOpacity(0.2)),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: GestureDetector(
        onTap: () {
          context.read<SupportCubit>().supportTextfield.text = question;
          FocusScope.of(context).requestFocus(_focusNode);
        },
        child: Text(
          question,
          style: TextStyle(color: AppColors.black, fontSize: 14.0.sp),
        ),
      ),
    );
  }
}
