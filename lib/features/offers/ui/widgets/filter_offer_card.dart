import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FilterOfferCard extends StatelessWidget {
  final String label;
  final String imagePath;
  final Color color;
  final VoidCallback? onTap;

  const FilterOfferCard({
    super.key,
    required this.label,
    required this.imagePath,
    required this.color,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 175.w,
        padding: EdgeInsets.all(12.sp),
        decoration: BoxDecoration(
          color: color.withOpacity(0.08),
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Container(
                width: 28.w,
                height: 28.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: color.withOpacity(0.5)),
                  color: Colors.white,
                ),
                padding: EdgeInsets.all(6.w),
                child: Image.network(imagePath, fit: BoxFit.fill),
              ),
            ),
            SizedBox(height: 8.h),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                label,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w600,
                  color: color,
                ),
                textAlign: TextAlign.right,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
