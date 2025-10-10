import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sayer_app/common/constants/app_sizes.dart';
import 'package:sayer_app/common/theming/app_colors.dart';

class CompanyCardDesign extends StatelessWidget {
  final String brandName;
  final String imageUrl;
  final String numberOfProducts;
  final bool isNotAsset;

  const CompanyCardDesign({
    super.key,
    required this.brandName,
    required this.imageUrl,
    required this.numberOfProducts,
    required this.isNotAsset,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppSizes.sm.sp),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(color: AppColors.grey),
      ),
      child: Row(
        children: [
          Container(
            width: 50.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.white,
            ),
            child: Center(
              child: Image.network(
                imageUrl,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    "assets/images/ImageNotLoading.png",
                    fit: BoxFit.contain,
                  );
                },
              ),
            ),
          ),
          SizedBox(width: AppSizes.md.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(brandName, style: Theme.of(context).textTheme.headlineSmall),
            ],
          ),
        ],
      ),
    );
  }
}
