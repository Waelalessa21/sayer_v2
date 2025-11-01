import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sayer_app/common/theming/app_colors.dart';
import 'package:sayer_app/features/CarDetails/ui/widgets/car_images.dart';
import 'package:sayer_app/features/CarDetails/ui/widgets/form.dart';
import 'package:sayer_app/common/data/Cars/model/cars_model.dart';
import 'package:sayer_app/features/home/data/model/car_offers_model.dart';

class TabsSection extends StatelessWidget {
  final TabController tabController;
  final CarData carData;
  final CarOfferData carOfferData;

  const TabsSection({
    super.key,
    required this.tabController,
    required this.carData,
    required this.carOfferData,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TabBar(
          controller: tabController,
          isScrollable: false,
          labelColor: AppColors.sButtomColor,
          unselectedLabelColor: AppColors.darkGrey,
          labelStyle: TextStyle(
            fontFamily: 'sayerNewFont',
            fontWeight: FontWeight.w700,
            fontSize: 16.sp,
          ),
          unselectedLabelStyle: TextStyle(
            fontFamily: 'sayerNewFont',
            fontWeight: FontWeight.w600,
            fontSize: 16.sp,
          ),
          indicatorColor: AppColors.sButtomColor,
          indicatorWeight: 2.5.h,
          tabs: const [
            Tab(text: 'تفاصيل إضافية'),
            Tab(text: 'صور السيارة'),
            Tab(text: 'طلب تمويل'),
          ],
        ),
        SizedBox(height: 16.h),
        Expanded(
          child: TabBarView(
            controller: tabController,
            physics: const BouncingScrollPhysics(),
            children: [
              SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildDetailRow('اسم السيارة', carData.name ?? 'غير محدد'),
                    _buildDetailRow(
                      'سنة التصنيع',
                      carData.year?.toString() ?? 'غير محددة',
                    ),
                    _buildDetailRow('اللون', carData.color ?? 'غير محدد'),
                    _buildDetailRow('الفئة', carData.carType ?? 'غير محددة'),
                    _buildDetailRow(
                      'معدل استهلاك الوقود',
                      carData.fuelEconomyRate?.toString() ?? 'غير محدد',
                    ),
                    if (carData.features != null &&
                        carData.features!.isNotEmpty)
                      ...carData.features!.map((feature) {
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 6.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  feature.key ?? '',
                                  style: TextStyle(
                                    fontFamily: 'sayerNewFont',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14.sp,
                                    color: AppColors.darkGrey,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  feature.featureValue ?? '',
                                  textAlign: TextAlign.end,
                                  style: TextStyle(
                                    fontFamily: 'sayerNewFont',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14.sp,
                                    color: AppColors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                  ],
                ),
              ),

              carOfferData.image_ids.isEmpty
                  ? Center(
                      child: Text(
                        'لا توجد صور حالياً',
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                          fontFamily: 'sayerNewFont',
                          fontWeight: FontWeight.w500,
                          fontSize: 14.sp,
                        ),
                      ),
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10.h),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.w,
                            vertical: 8.h,
                          ),
                          child: Text(
                            'صور داخلية وخارجية للسيـارة',
                            style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.sButtomColor,
                              fontFamily: 'sayerNewFont',
                            ),
                          ),
                        ),
                        SizedBox(height: 12.h),
                        Center(
                          child: GestureDetector(
                            onTap: () {
                              showDialog(
                                context: context,
                                barrierColor: Colors.black,
                                builder: (_) =>
                                    CarImages(images: carOfferData.image_ids),
                              );
                            },
                            child: Container(
                              width: 0.85.sw,
                              padding: EdgeInsets.all(14.w),
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(14.r),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.network(
                                    carOfferData.image_ids.last.public_url ??
                                        '',
                                    height: 180.h,
                                    fit: BoxFit.contain,
                                  ),
                                  SizedBox(height: 12.h),
                                  Text(
                                    'اضغط لعرض الصور',
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'sayerNewFont',
                                    ),
                                  ),
                                  SizedBox(height: 4.h),
                                  Text(
                                    '${carOfferData.image_ids.length} صورة',
                                    style: TextStyle(
                                      fontSize: 13.sp,
                                      color: AppColors.darkGrey,
                                      fontFamily: 'sayerNewFont',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

              SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                child: const FormWidget(),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDetailRow(String title, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontFamily: 'sayerNewFont',
                fontWeight: FontWeight.w600,
                fontSize: 14.sp,
                color: AppColors.darkGrey,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              textAlign: TextAlign.end,
              style: TextStyle(
                fontFamily: 'sayerNewFont',
                fontWeight: FontWeight.w400,
                fontSize: 14.sp,
                color: AppColors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
