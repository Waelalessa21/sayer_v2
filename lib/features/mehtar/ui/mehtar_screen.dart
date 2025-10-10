import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sayer_app/common/constants/app_sizes.dart';
import 'package:sayer_app/common/layout/app_default_bar.dart';
import 'package:sayer_app/common/layout/app_white_pattern.dart';
import 'package:sayer_app/common/widgets/animation/animated_item.dart';
import 'package:sayer_app/features/mehtar/ui/widgets/header_mehtar.dart';
import 'package:sayer_app/features/mehtar/ui/widgets/liabilty_textfield.dart';
import 'package:sayer_app/features/mehtar/ui/widgets/mehtar_validator.dart';
import 'package:sayer_app/features/mehtar/ui/widgets/salary_textfield.dart';
import 'package:sayer_app/features/mehtar/ui/widgets/search_button.dart';
import 'package:sayer_app/features/mehtar/ui/widgets/user_checkbox.dart';

class MehtarScreen extends StatefulWidget {
  const MehtarScreen({super.key});

  @override
  MehtarScreenState createState() => MehtarScreenState();
}

class MehtarScreenState extends State<MehtarScreen> {
  bool _isLiabilityChecked = false;
  bool _isEmployerChecked = false;
  final TextEditingController _monthlySalaryController =
      TextEditingController();
  final TextEditingController _liabilityController = TextEditingController();

  int _calculateMehtar() {
    int salary = int.tryParse(_monthlySalaryController.text) ?? 0;
    int liabilityAmount = _isEmployerChecked
        ? salary - (salary * 0.25).toInt()
        : salary - (salary * 0.33).toInt();

    if (_isLiabilityChecked) {
      int liability = int.tryParse(_liabilityController.text) ?? 0;
      return liabilityAmount - liability;
    }

    return liabilityAmount;
  }

  void openOffersScreen() {
    final validator = MehtarValidator(
      monthlySalaryController: _monthlySalaryController,
      liabilityController: _liabilityController,
      isCheckboxCheckedLiability: _isLiabilityChecked,
      isCheckboxCheckedEmployers: _isEmployerChecked,
    );

    if (validator.validateInputs(context)) {
      // int result = _calculateMehtar();
      // context.pushNamed('/search', extra: result);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: AppWhitePattern(
        appBar: AppDefaultBar(
          showbackArrow: true,
          arrowColor: Colors.black,
          goBack: 'home',
        ),
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(AppSizes.defaultSpace.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AnimatedItem(
                  fromRightToLeft: true,
                  duration: Duration(milliseconds: 1500),
                  index: 1,
                  child: HeaderMehtar(),
                ),
                SizedBox(height: AppSizes.spaceBtwSections.h),
                AnimatedItem(
                  fromRightToLeft: true,
                  index: 1,
                  duration: Duration(milliseconds: 1500),
                  child: SalaryInput(controller: _monthlySalaryController),
                ),
                SizedBox(height: AppSizes.spaceBtwItems.h),
                AnimatedItem(
                  index: 2,
                  child: CheckboxRow(
                    isLiabilityChecked: _isLiabilityChecked,
                    isEmployerChecked: _isEmployerChecked,
                    onLiabilityChanged: (value) =>
                        setState(() => _isLiabilityChecked = value ?? false),
                    onEmployerChanged: (value) =>
                        setState(() => _isEmployerChecked = value ?? false),
                  ),
                ),
                if (_isLiabilityChecked)
                  AnimatedItem(
                    index: 2,
                    fromRightToLeft: true,
                    child: LiabilityInput(controller: _liabilityController),
                  ),
                SizedBox(height: AppSizes.spaceBtwInputFields.h * 4.h),
                SearchButton(onPressed: openOffersScreen),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
