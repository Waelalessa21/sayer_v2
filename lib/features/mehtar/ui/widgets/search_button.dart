import 'package:flutter/material.dart';

class SearchButton extends StatelessWidget {
  final VoidCallback onPressed;

  const SearchButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text('بحث'),
      ),
    );
  }
}
