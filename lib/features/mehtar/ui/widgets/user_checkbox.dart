import 'package:flutter/material.dart';

class CheckboxRow extends StatelessWidget {
  final bool isLiabilityChecked;
  final bool isEmployerChecked;
  final Function(bool?) onLiabilityChanged;
  final Function(bool?) onEmployerChanged;

  const CheckboxRow({
    required this.isLiabilityChecked,
    required this.isEmployerChecked,
    required this.onLiabilityChanged,
    required this.onEmployerChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: isLiabilityChecked,
          onChanged: onLiabilityChanged,
        ),
        Text('هل لديك التزامات مادية؟'),
        Checkbox(
          value: isEmployerChecked,
          onChanged: onEmployerChanged,
        ),
        Text('هل انت متقاعد؟'),
      ],
    );
  }
}
