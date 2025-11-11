import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sayer_app/common/theming/app_colors.dart';

class BirthDateSelector extends StatefulWidget {
  final Function(String birthDate) onDateSelected;

  const BirthDateSelector({super.key, required this.onDateSelected});

  @override
  State<BirthDateSelector> createState() => _BirthDateSelectorState();
}

class _BirthDateSelectorState extends State<BirthDateSelector> {
  String? selectedMonth;
  String? selectedYear;

  final List<Map<String, String>> months = [
    {"name": "يناير", "value": "01"},
    {"name": "فبراير", "value": "02"},
    {"name": "مارس", "value": "03"},
    {"name": "أبريل", "value": "04"},
    {"name": "مايو", "value": "05"},
    {"name": "يونيو", "value": "06"},
    {"name": "يوليو", "value": "07"},
    {"name": "أغسطس", "value": "08"},
    {"name": "سبتمبر", "value": "09"},
    {"name": "أكتوبر", "value": "10"},
    {"name": "نوفمبر", "value": "11"},
    {"name": "ديسمبر", "value": "12"},
  ];

  List<String> get years {
    return List.generate(67, (index) => (2026 - index).toString());
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 340.w,
        constraints: BoxConstraints(maxHeight: 520.h),
        padding: EdgeInsets.all(20.w),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(30.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8.r,
              offset: Offset(0, 3.h),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'اختر تاريخ الميلاد',
              style: TextStyle(
                fontSize: 18.sp,
                fontFamily: 'sayerNewFont',
                fontWeight: FontWeight.bold,
                color: AppColors.black,
              ),
            ),
            SizedBox(height: 20.h),
            Text(
              'الشهر',
              style: TextStyle(
                fontSize: 15.sp,
                fontFamily: 'sayerNewFont',
                fontWeight: FontWeight.w600,
                color: AppColors.black,
              ),
            ),
            SizedBox(height: 12.h),
            Container(
              padding: EdgeInsets.all(12.w),
              decoration: BoxDecoration(
                color: AppColors.lightGrey.withOpacity(0.3),
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: months.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisSpacing: 10.h,
                  crossAxisSpacing: 10.w,
                  childAspectRatio: 2.2,
                ),
                itemBuilder: (context, index) {
                  final month = months[index];
                  final isSelected = selectedMonth == month['value'];

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedMonth = month['value'];
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: isSelected
                            ? AppColors.sButtomColor
                            : AppColors.white,
                        borderRadius: BorderRadius.circular(12.r),
                        border: isSelected
                            ? null
                            : Border.all(
                                color: AppColors.grey.withOpacity(0.3),
                                width: 1.w,
                              ),
                      ),
                      child: Text(
                        month['name']!,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontFamily: 'sayerNewFont',
                          fontWeight: FontWeight.w500,
                          color: isSelected ? AppColors.white : AppColors.black,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20.h),
            Text(
              'السنة',
              style: TextStyle(
                fontSize: 15.sp,
                fontFamily: 'sayerNewFont',
                fontWeight: FontWeight.w600,
                color: AppColors.black,
              ),
            ),
            SizedBox(height: 12.h),
            Container(
              height: 150.h,
              padding: EdgeInsets.all(12.w),
              decoration: BoxDecoration(
                color: AppColors.lightGrey.withOpacity(0.3),
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: GridView.builder(
                itemCount: years.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                  mainAxisSpacing: 10.h,
                  crossAxisSpacing: 10.w,
                  childAspectRatio: 1.8,
                ),
                itemBuilder: (context, index) {
                  final year = years[index];
                  final isSelected = selectedYear == year;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedYear = year;
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: isSelected
                            ? AppColors.sButtomColor
                            : AppColors.white,
                        borderRadius: BorderRadius.circular(12.r),
                        border: isSelected
                            ? null
                            : Border.all(
                                color: AppColors.grey.withOpacity(0.3),
                                width: 1.w,
                              ),
                      ),
                      child: Text(
                        year,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 11.sp,
                          fontFamily: 'sayerNewFont',
                          fontWeight: FontWeight.w500,
                          color: isSelected ? AppColors.white : AppColors.black,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20.h),
            GestureDetector(
              onTap: () {
                if (selectedMonth != null && selectedYear != null) {
                  final birthDate = '$selectedYear-$selectedMonth-01';
                  widget.onDateSelected(birthDate);
                  Navigator.pop(context);
                }
              },
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 12.h),
                decoration: BoxDecoration(
                  color: selectedMonth != null && selectedYear != null
                      ? AppColors.sButtomColor
                      : Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(30.r),
                ),
                alignment: Alignment.center,
                child: Text(
                  "حفظ",
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontFamily: 'sayerNewFont',
                    fontWeight: FontWeight.w600,
                    color: selectedMonth != null && selectedYear != null
                        ? AppColors.white
                        : Colors.black87,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

