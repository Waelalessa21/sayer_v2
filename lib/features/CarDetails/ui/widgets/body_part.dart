import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sayer_app/common/data/Cars/model/cars_model.dart';
import 'package:sayer_app/common/theming/app_colors.dart';
import 'package:sayer_app/common/constants/app_sizes.dart';
import 'package:sayer_app/features/CarDetails/ui/widgets/info_box.dart';
import 'package:sayer_app/features/CarDetails/ui/widgets/tabs_section.dart';

class BodyPart extends StatelessWidget {
  final CarData carData;
  final TabController tabController;

  const BodyPart({
    super.key,
    required this.carData,
    required this.tabController,
  });

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.58,
      minChildSize: 0.5,
      maxChildSize: 0.95,
      builder: (context, scrollController) {
        return Container(
          decoration: const BoxDecoration(
            color: AppColors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 8,
                offset: Offset(0, -2),
              ),
            ],
          ),
          child: SingleChildScrollView(
            controller: scrollController,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        carData.name ?? 'اسم غير معروف',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.sp,
                        ),
                        textDirection: TextDirection.rtl,
                      ),
                    ),
                    const SizedBox(width: 12),
                    SizedBox(
                      height: 38,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          tabController.animateTo(2);
                        },
                        icon: const Icon(Icons.calculate, size: 18),
                        label: const Text('طلب تمويل'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.sButtomColor,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          textStyle: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'sayerNewFont',
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              AppSizes.buttonRadius.r,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 12),

                Text(
                  carData.description ?? 'لا يوجد وصف متاح حالياً',
                  style: TextStyle(
                    fontSize: 14.sp,
                    height: 1.7,
                    fontWeight: FontWeight.w400,
                    color: AppColors.darkGrey,
                  ),
                  textAlign: TextAlign.justify,
                  textDirection: TextDirection.rtl,
                ),

                const SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InfoBox(
                      icon: Icons.local_gas_station,
                      title: 'استهلاك الوقود',
                      value: '12.6',
                      delay: const Duration(milliseconds: 0),
                    ),
                    InfoBox(
                      icon: Icons.category,
                      title: 'الفئة',
                      value: 'كلاسيك',
                      delay: const Duration(milliseconds: 200),
                    ),
                    InfoBox(
                      icon: Icons.date_range,
                      title: 'سنة التصنيع',
                      value: carData.year?.toString() ?? 'غير متوفرة',
                      delay: const Duration(milliseconds: 400),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                SizedBox(
                  height: 420,
                  child: TabsSection(tabController: tabController),
                ),

                const SizedBox(height: 32),
              ],
            ),
          ),
        );
      },
    );
  }
}
