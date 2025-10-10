import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconsax/iconsax.dart';

class SalaryInput extends StatelessWidget {
  final TextEditingController controller;

  const SalaryInput({required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        prefixIcon: Icon(Iconsax.money),
        labelText: 'الراتب الشهري',
      ),
    );
  }
}
