import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sayer_app/common/constants/app_sizes.dart';

///this layout provides 2 items toghter in col
class AppGridLayout extends StatelessWidget {
  const AppGridLayout({
    super.key,
    required this.itemCount,
    this.maixAxisEctent = 288,
    required this.itemBuilder,
  });

  final int itemCount;
  final double? maixAxisEctent;
  final Widget? Function(BuildContext, int) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: itemCount,
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: AppSizes.gridViewSpacing.sp,
        mainAxisSpacing: AppSizes.gridViewSpacing.sp,
        mainAxisExtent: maixAxisEctent,
      ),
      itemBuilder: itemBuilder,
    );
  }
}
