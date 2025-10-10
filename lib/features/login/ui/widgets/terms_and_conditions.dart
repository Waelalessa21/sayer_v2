import 'package:flutter/material.dart';
import 'package:sayer_app/common/theming/app_colors.dart';
import 'package:url_launcher/url_launcher.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        const url = 'https://sayeer.sa/#/policyScreen';
        if (await canLaunch(url)) {
          await launch(url);
        } else {
          throw 'Could not launch $url';
        }
      },
      child: Text(
        'بمجرد تسجيل دخولك أنت توافق على الشروط و الأحكام',
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
          fontSize: 14,
          color: AppColors.sSecondery,
        ),
      ),
    );
  }
}
