import 'package:flutter/material.dart';
import 'package:sayer_app/common/widgets/popup/show_toast_message.dart';

///Handle input validation in Mehtar!
class MehtarValidator extends StatelessWidget {
  final TextEditingController monthlySalaryController;
  final TextEditingController liabilityController;
  final bool isCheckboxCheckedLiability;
  final bool isCheckboxCheckedEmployers;

  const MehtarValidator({
    super.key,
    required this.monthlySalaryController,
    required this.liabilityController,
    required this.isCheckboxCheckedLiability,
    required this.isCheckboxCheckedEmployers,
  });

  bool validateSalary(BuildContext context, String salary) {
    if (salary.isEmpty) {
      showToastMessage(
        context,
        "الرجاء ملء جميع الحقول",
        "assets/icons/question.png",
        isError: true,
      );
      return false;
    }
    int salaryValue = int.tryParse(salary) ?? 0;
    if (salaryValue <= 0) {
      showToastMessage(
        context,
        "الرجاء إدخال قيمة صحيحة للراتب",
        "assets/icons/moneybags.png",
        isError: true,
      );

      return false;
    }
    return true;
  }

  bool validateLiability(BuildContext context, String liability) {
    if (isCheckboxCheckedLiability && liability.isEmpty) {
      showToastMessage(
        context,
        "الرجاء إدخال قيمة الالتزامات",
        "assets/icons/moneybags.png",
        isError: true,
      );
      return false;
    }
    int liabilityValue = int.tryParse(liability) ?? 0;
    if (isCheckboxCheckedLiability && liabilityValue <= 0) {
      showToastMessage(
        context,
        "يجب ان تكون قيمة الالتزامات اكبر من صفر",
        "assets/icons/moneybags.png",
        isError: true,
      );
      return false;
    }
    return true;
  }

  bool validateSalaryGreaterThanLiability(
    BuildContext context,
    String salary,
    String liability,
  ) {
    int salaryValue = int.tryParse(salary) ?? 0;
    int liabilityValue = int.tryParse(liability) ?? 0;
    if (isCheckboxCheckedLiability && salaryValue < liabilityValue) {
      showToastMessage(
        context,
        "يجب ان يكون الراتب اكبر من الالتزامات",
        "assets/icons/moneybags.png",
        isError: true,
      );
      return false;
    }
    return true;
  }

  bool validateInputs(BuildContext context) {
    String salary = monthlySalaryController.text;
    String liability = liabilityController.text;

    if (!validateSalary(context, salary)) return false;
    if (!validateLiability(context, liability)) return false;
    if (!validateSalaryGreaterThanLiability(context, salary, liability)) {
      return false;
    }

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
