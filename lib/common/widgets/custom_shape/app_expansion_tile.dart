import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sayer_app/common/constants/app_sizes.dart';
import 'package:sayer_app/common/theming/app_colors.dart';

class AppExpansionTile extends StatelessWidget {
  final String title;
  final String? content;
  final Widget? widgetContent;
  final bool initiallyExpanded;

  const AppExpansionTile({
    super.key,
    required this.title,
    this.content,
    this.widgetContent,
    this.initiallyExpanded = false,
  });

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        dividerColor: Colors.transparent,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      child: ExpansionTile(
        title: Text(title, style: Theme.of(context).textTheme.headlineSmall),
        tilePadding: EdgeInsets.symmetric(horizontal: 16.w),
        collapsedBackgroundColor: Colors.transparent,
        initiallyExpanded: initiallyExpanded,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppSizes.spaceBtwItems.sp,
            ),
            child:
                widgetContent ??
                Text(
                  content ?? '',
                  textAlign: TextAlign.justify,
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    fontSize: 16.sp,
                    color: AppColors.black.withOpacity(0.7),
                  ),
                ),
          ),
        ],
      ),
    );
  }
}
