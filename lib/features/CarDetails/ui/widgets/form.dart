import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sayer_app/common/theming/app_colors.dart';
import 'package:sayer_app/features/CarDetails/ui/widgets/bank_selector.dart';
import 'package:sayer_app/features/CarDetails/ui/widgets/birth_date_selector.dart';

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

  final TextEditingController bankController = TextEditingController();
  final TextEditingController birthdateController = TextEditingController();

  @override
  void dispose() {
    salaryFocus.dispose();
    obligationFocus.dispose();
    companyFocus.dispose();
    bankFocus.dispose();
    birthdateFocus.dispose();
    bankController.dispose();
    birthdateController.dispose();
    super.dispose();
  }

  void _showBankSelectorDialog() {
    FocusScope.of(context).unfocus();
    showDialog(
      context: context,
      builder: (_) => Dialog(
        backgroundColor: Colors.transparent,
        child: BankSelector(
          onBankSelected: (bankName) {
            setState(() {
              bankController.text = bankName;
            });
          },
        ),
      ),
    );
  }

  void _showBirthDateSelectorDialog() {
    FocusScope.of(context).unfocus();
    showDialog(
      context: context,
      builder: (_) => Dialog(
        backgroundColor: Colors.transparent,
        child: BirthDateSelector(
          onDateSelected: (birthDate) {
            setState(() {
              birthdateController.text = birthDate;
            });
          },
        ),
      ),
    );
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

            // حقل اختيار البنك
            GestureDetector(
              onTap: _showBankSelectorDialog,
              child: AbsorbPointer(
                child: TextFormField(
                  controller: bankController,
                  focusNode: bankFocus,
                  textDirection: TextDirection.rtl,
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_) =>
                      FocusScope.of(context).requestFocus(birthdateFocus),
                  decoration: _inputDecoration(
                    label: 'اسم البنك',
                    hint: 'اختر البنك',
                    suffixIcon: const Icon(Iconsax.card),
                  ),
                ),
              ),
            ),

            SizedBox(height: 12.h),
            GestureDetector(
              onTap: _showBirthDateSelectorDialog,
              child: AbsorbPointer(
                child: TextFormField(
                  controller: birthdateController,
                  focusNode: birthdateFocus,
                  textDirection: TextDirection.rtl,
                  textInputAction: TextInputAction.done,
                  decoration: _inputDecoration(
                    label: 'تاريخ الميلاد',
                    hint: 'اختر تاريخ الميلاد',
                    suffixIcon: const Icon(Iconsax.calendar),
                  ),
                ),
              ),
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
      decoration: _inputDecoration(label: label, hint: hint),
    );
  }

  InputDecoration _inputDecoration({
    required String label,
    required String hint,
    Widget? suffixIcon,
  }) {
    return InputDecoration(
      labelText: label,
      hintText: hint,
      suffixIcon: suffixIcon,
      labelStyle: TextStyle(color: AppColors.black, fontSize: 14.sp),
      hintStyle: TextStyle(color: AppColors.darkGrey, fontSize: 13.sp),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.sButtomColor, width: 1.8.w),
        borderRadius: BorderRadius.circular(8.r),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.grey, width: 1.0.w),
        borderRadius: BorderRadius.circular(8.r),
      ),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.r)),
    );
  }
}
