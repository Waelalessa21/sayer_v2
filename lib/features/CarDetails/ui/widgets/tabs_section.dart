import 'package:flutter/material.dart';
import 'package:sayer_app/common/theming/app_colors.dart';
import 'package:sayer_app/features/CarDetails/ui/widgets/form.dart';

class TabsSection extends StatelessWidget {
  final TabController tabController;

  const TabsSection({super.key, required this.tabController});

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
          labelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
          unselectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
          indicatorColor: AppColors.sButtomColor,
          indicatorWeight: 2.5,
          tabs: const [
            Tab(text: 'تفاصيل إضافية'),
            Tab(text: 'صور السيارة'),
            Tab(text: 'طلب تمويل'),
          ],
        ),

        const SizedBox(height: 16),

        Expanded(
          child: TabBarView(
            controller: tabController,
            physics: const BouncingScrollPhysics(),
            children: const [
              Center(
                child: Text(
                  'هنا تفاصيل إضافية للسيارة',
                  textDirection: TextDirection.rtl,
                ),
              ),
              Center(
                child: Text(
                  'لا توجد صور حالياً',
                  textDirection: TextDirection.rtl,
                ),
              ),
              SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: FormWidget(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
