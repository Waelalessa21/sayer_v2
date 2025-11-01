import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sayer_app/common/theming/app_colors.dart';

class BankSelector extends StatefulWidget {
  final Function(String bankName) onBankSelected;

  const BankSelector({super.key, required this.onBankSelected});

  @override
  State<BankSelector> createState() => _BankSelectorState();
}

class _BankSelectorState extends State<BankSelector> {
  String? selectedBank;

  final List<Map<String, String>> banks = [
    {"name": "البلاد", "logo": "assets/bank/1.png"},
    {"name": "الجزيرة", "logo": "assets/bank/2.png"},
    {"name": "الراجحي", "logo": "assets/bank/3.png"},
    {"name": "الرياض", "logo": "assets/bank/4.png"},
    {"name": "الإنماء", "logo": "assets/bank/5.png"},
    {"name": "ساب", "logo": "assets/bank/6.png"},
    {"name": "الأهلي", "logo": "assets/bank/7.png"},
    {"name": "العربي", "logo": "assets/bank/8.png"},
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 320.w,
        constraints: BoxConstraints(maxHeight: 420.h),
        padding: EdgeInsets.all(16.w),
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
            Flexible(
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: banks.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisSpacing: 16.h,
                  crossAxisSpacing: 12.w,
                  childAspectRatio: 0.75,
                ),
                itemBuilder: (context, index) {
                  final bank = banks[index];
                  final isSelected = selectedBank == bank['name'];

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedBank = bank['name'];
                      });
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          padding: EdgeInsets.all(6.w),
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(12.r),
                            border: isSelected
                                ? Border.all(
                                    color: AppColors.sButtomColor,
                                    width: 2.w,
                                  )
                                : null,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 4.r,
                                offset: Offset(0, 2.h),
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.r),
                            child: Image.asset(
                              bank['logo']!,
                              height: 36.h,
                              width: 36.h,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Text(
                          bank['name']!,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 11.sp,
                            fontFamily: 'sayerNewFont',
                            color: AppColors.black,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            SizedBox(height: 16.h),

            GestureDetector(
              onTap: () {
                if (selectedBank != null) {
                  widget.onBankSelected(selectedBank!);
                  Navigator.pop(context);
                }
              },
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 10.h),
                decoration: BoxDecoration(
                  color: selectedBank != null
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
                    fontWeight: FontWeight.w500,
                    color: selectedBank != null
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
