import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sayer_app/common/constants/app_sizes.dart';
import 'package:sayer_app/common/data/Cars/model/cars_model.dart';
import 'package:sayer_app/common/theming/app_colors.dart';
import 'package:sayer_app/features/CarDetails/ui/widgets/info_box.dart';
import 'package:sayer_app/features/CarDetails/ui/widgets/tabs_section.dart';
import 'package:sayer_app/features/home/data/model/car_offers_model.dart';

class BodyPart extends StatelessWidget {
  final CarData carData;
  final CarOfferData carOfferData;
  final TabController tabController;

  const BodyPart({
    super.key,
    required this.carData,
    required this.carOfferData,
    required this.tabController,
  });

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.52,
      minChildSize: 0.52,
      maxChildSize: 0.95,
      builder: (context, scrollController) {
        return Container(
          decoration: const BoxDecoration(
            color: AppColors.white,
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(16, 0, 0, 0),
                blurRadius: 5,
                offset: Offset(0, -2),
              ),
            ],
            borderRadius: BorderRadius.vertical(),
          ),
          child: SingleChildScrollView(
            controller: scrollController,
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
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
                          fontFamily: 'sayerNewFont',
                        ),
                        textDirection: TextDirection.rtl,
                      ),
                    ),
                    SizedBox(width: 12.w),
                    SizedBox(
                      height: 38.h,
                      child: ElevatedButton.icon(
                        onPressed: () => tabController.animateTo(2),
                        icon: Icon(Icons.calculate, size: 18.sp),
                        label: Text(
                          'طلب تمويل',
                          style: TextStyle(fontSize: 13.sp),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.sButtomColor,
                          foregroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
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

                SizedBox(height: 12.h),
                Text(
                  carData.description ?? 'لا يوجد وصف متاح حالياً',
                  style: TextStyle(
                    fontSize: 14.sp,
                    height: 1.7,
                    fontWeight: FontWeight.w400,
                    color: AppColors.darkGrey,
                    fontFamily: 'sayerNewFont',
                  ),
                  textAlign: TextAlign.justify,
                  textDirection: TextDirection.rtl,
                ),

                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InfoBox(
                      icon: Icons.local_gas_station,
                      title: 'استهلاك الوقود',
                      value: carData.fuelEconomyRate?.toString() ?? 'غير محدد',
                      delay: const Duration(milliseconds: 0),
                    ),
                    InfoBox(
                      icon: Icons.category,
                      title: 'الفئة',
                      value: carData.carType ?? 'غير محددة',
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

                SizedBox(height: 20.h),
                SizedBox(
                  height: 420.h,
                  child: TabsSection(
                    tabController: tabController,
                    carData: carData,
                    carOfferData: carOfferData,
                  ),
                ),

                SizedBox(height: 32.h),
              ],
            ),
          ),
        );
      },
    );
  }
}
