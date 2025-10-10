import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class LiabilityInput extends StatelessWidget {
  final TextEditingController controller;

  const LiabilityInput({required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        prefixIcon: Icon(Iconsax.moneys),
        labelText: 'مجموع الالتزامات',
      ),
    );
  }
}
