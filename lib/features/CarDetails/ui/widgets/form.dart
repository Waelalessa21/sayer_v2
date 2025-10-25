import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sayer_app/common/theming/app_colors.dart';

class FormWidget extends StatefulWidget {
  const FormWidget({super.key});

  @override
  State<FormWidget> createState() => FormWidgetState();
}

class FormWidgetState extends State<FormWidget> {
  final salaryFocus = FocusNode();
  final obligationFocus = FocusNode();
  final companyFocus = FocusNode();
  final bankFocus = FocusNode();
  final birthdateFocus = FocusNode();

  @override
  void dispose() {
    salaryFocus.dispose();
    obligationFocus.dispose();
    companyFocus.dispose();
    bankFocus.dispose();
    birthdateFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          children: [
            _buildField(
              label: 'الراتب الشهري',
              hint: 'أدخل الراتب الشهري',
              keyboard: TextInputType.number,
              focusNode: salaryFocus,
              nextFocus: obligationFocus,
            ),
            SizedBox(height: 12.h),
            _buildField(
              label: 'الالتزامات الشهرية',
              hint: 'أدخل الالتزامات',
              keyboard: TextInputType.number,
              focusNode: obligationFocus,
              nextFocus: companyFocus,
            ),
            SizedBox(height: 12.h),
            _buildField(
              label: 'اسم الشركة',
              hint: 'أدخل اسم الشركة',
              focusNode: companyFocus,
              nextFocus: bankFocus,
            ),
            SizedBox(height: 12.h),
            _buildField(
              label: 'اسم البنك',
              hint: 'أدخل اسم البنك',
              focusNode: bankFocus,
              nextFocus: birthdateFocus,
            ),
            SizedBox(height: 12.h),
            _buildField(
              label: 'تاريخ الميلاد',
              hint: 'مثال: 1995-01-01',
              keyboard: TextInputType.datetime,
              focusNode: birthdateFocus,
              nextFocus: null,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildField({
    required String label,
    required String hint,
    required FocusNode focusNode,
    FocusNode? nextFocus,
    TextInputType keyboard = TextInputType.text,
  }) {
    return TextFormField(
      focusNode: focusNode,
      keyboardType: keyboard,
      textInputAction: nextFocus != null
          ? TextInputAction.next
          : TextInputAction.done,
      onFieldSubmitted: (_) {
        if (nextFocus != null) {
          FocusScope.of(context).requestFocus(nextFocus);
        } else {
          FocusScope.of(context).unfocus();
        }
      },
      textDirection: TextDirection.rtl,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        labelStyle: TextStyle(color: AppColors.black, fontSize: 14.sp),
        hintStyle: TextStyle(color: AppColors.darkGrey, fontSize: 13.sp),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.sButtomColor, width: 1.8),
          borderRadius: BorderRadius.circular(8.r),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.grey, width: 1.0),
          borderRadius: BorderRadius.circular(8.r),
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.r)),
      ),
    );
  }
}
