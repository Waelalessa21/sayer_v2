import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sayer_app/common/constants/app_sizes.dart';
import 'package:sayer_app/features/services/ui/widgets/services_card.dart';

class ServicesCardList extends StatelessWidget {
  const ServicesCardList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade100, width: 1),
        borderRadius: BorderRadius.circular(20.r),
      ),
      padding: EdgeInsets.all(AppSizes.sm.sp),
      child: Column(
        children: [
          ServicesCard(
            title: 'مقارنة العروض',
            subtitle: 'قارن بين أسعار ومواصفات السيارات بسهولة.',
            imagePath: 'assets/icons/discount.png',
          ),
          Divider(color: Colors.grey.shade100, thickness: 1, height: 24.h),
          ServicesCard(
            title: 'الفلترة الذكية',
            subtitle: 'ابحث عن السيارة الأنسب حسب احتياجاتك.',
            imagePath: 'assets/icons/edit.png',
          ),
          Divider(color: Colors.grey.shade100, thickness: 1, height: 24.h),
          ServicesCard(
            title: 'العروض الحصرية',
            subtitle: 'استفد من عروض خاصة بالتعاون مع المعارض.',
            imagePath: 'assets/icons/exclusive.png',
          ),
          Divider(color: Colors.grey.shade100, thickness: 1, height: 24.h),
          ServicesCard(
            title: 'خدمة “محتار؟”',
            subtitle: 'ساعدنا في اختيار السيارة المناسبة لك.',
            imagePath: 'assets/icons/indecision.png',
          ),
          Divider(color: Colors.grey.shade100, thickness: 1, height: 24.h),
          ServicesCard(
            title: 'ضريبتك ريال!',
            subtitle: 'عروض مميزة تشمل تخفيض ضريبة القيمة المضافة.',
            imagePath: 'assets/icons/riyal.png',
          ),
          Divider(color: Colors.grey.shade100, thickness: 1, height: 24.h),
          ServicesCard(
            title: 'توصية ذكية',
            subtitle: 'نقترح عليك سيارات بناءً على تفضيلاتك.',
            imagePath: 'assets/icons/recommendation.png',
          ),
          Divider(color: Colors.grey.shade100, thickness: 1, height: 24.h),
          ServicesCard(
            title: 'مشاركة العروض',
            subtitle: 'شارك العرض مع صديق أو على منصات التواصل.',
            imagePath: 'assets/icons/send.png',
          ),
          Divider(color: Colors.grey.shade100, thickness: 1, height: 24.h),
          ServicesCard(
            title: 'خدمة العملاء',
            subtitle: 'نساعدك في كل استفساراتك قبل وبعد الشراء.',
            imagePath: 'assets/icons/24-7.png',
          ),
        ],
      ),
    );
  }
}
