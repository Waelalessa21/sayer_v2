import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sayer_app/common/theming/app_colors.dart';

class CarSearchBar extends StatefulWidget {
  final Function(String) onSearch;
  final TextEditingController controller;

  const CarSearchBar({
    super.key,
    required this.onSearch,
    required this.controller,
  });

  @override
  CarSearchBarState createState() => CarSearchBarState();
}

class CarSearchBarState extends State<CarSearchBar> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 10.h),
      child: MouseRegion(
        onEnter: (_) => setState(() {
          _isHovered = true;
        }),
        onExit: (_) => setState(() {
          _isHovered = false;
        }),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: Offset(0, 5),
              ),
            ],
          ),
          padding: EdgeInsets.all(_isHovered ? 5 : 0),
          child: TextField(
            controller: widget.controller,
            decoration: InputDecoration(
              hintText: 'البحث مع ســاير أسهل',
              hintStyle: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.textDarkBlue,
              ),
              prefixIcon: Padding(
                padding: EdgeInsets.only(left: 10.0.w, right: 10.0.w),
                child: Icon(
                  Iconsax.search_normal,
                  color: AppColors.darkGrey,
                  size: 26.sp,
                ),
              ),
              prefixIconConstraints: BoxConstraints(
                minWidth: 40.w,
                minHeight: 40.h,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.sp),
                borderSide: BorderSide(
                  color: AppColors.primary.withOpacity(0.2),
                  width: 1.5,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.sp),
                borderSide: BorderSide(
                  color: AppColors.primary.withOpacity(0.2),
                  width: 1.5,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.sp),
                borderSide: BorderSide(
                  color: AppColors.primary.withOpacity(0.5),
                  width: 2.0.w,
                ),
              ),
              filled: true,
              fillColor: AppColors.lightContainer,
              contentPadding: EdgeInsets.symmetric(
                vertical: 12.h,
                horizontal: 16.w,
              ),
            ),
            style: TextStyle(
              fontSize: 16.sp,
              color: AppColors.textDarkBlue,
              fontWeight: FontWeight.w500,
            ),
            cursorColor: AppColors.primary,
            onChanged: widget.onSearch,
          ),
        ),
      ),
    );
  }
}
