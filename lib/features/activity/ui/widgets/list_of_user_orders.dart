import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sayer_app/common/constants/app_sizes.dart';
import 'package:sayer_app/common/data/leads/model/leades_model.dart';
import 'package:sayer_app/common/theming/app_colors.dart';
import 'package:sayer_app/common/widgets/cards/notification_card.dart';
import 'package:sayer_app/common/widgets/popup/confirmation_bottom_sheet.dart';

class ListOfUserOrders extends StatefulWidget {
  final List<LeadesData> leads;

  const ListOfUserOrders({super.key, required this.leads});

  @override
  State<ListOfUserOrders> createState() => _ListOfUserOrdersState();
}

class _ListOfUserOrdersState extends State<ListOfUserOrders> {
  bool expanded = false;
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void showMore() {
    setState(() {
      expanded = !expanded;
    });

    if (expanded) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (_scrollController.hasClients) {
          _scrollController.animateTo(
            _scrollController.position.maxScrollExtent,
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeOut,
          );
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final displayLimit = 5;
    final isOverflow = widget.leads.length > displayLimit;
    final itemHeight = 70.h;
    final maxHeight = MediaQuery.of(context).size.height * 0.5;
    final itemCount = expanded || !isOverflow
        ? widget.leads.length
        : displayLimit;
    final calculatedHeight = itemCount * itemHeight;
    final listHeight = calculatedHeight < maxHeight
        ? calculatedHeight
        : maxHeight;

    return Padding(
      padding: EdgeInsets.all(20.0.sp),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey.shade100, width: 1),
          borderRadius: BorderRadius.circular(10.r),
        ),
        padding: EdgeInsets.all(AppSizes.sm.sp),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            isOverflow
                ? SizedBox(
                    height: listHeight,
                    child: ListView.separated(
                      controller: _scrollController,
                      physics: expanded
                          ? const AlwaysScrollableScrollPhysics()
                          : const NeverScrollableScrollPhysics(),
                      itemCount: itemCount,
                      separatorBuilder: (context, index) => Divider(
                        color: Colors.grey.shade100,
                        thickness: 1,
                        height: 12.h,
                      ),
                      itemBuilder: (context, index) {
                        final leadData = widget.leads[index];
                        String title = leadData.name ?? 'العرض غير معروف';
                        String subtitle =
                            leadData.stageId?.name ?? 'حالة غير معروفة!';
                        return GestureDetector(
                          onTap: () {
                            showConfirmationBottomSheet(
                              context,
                              subtitle,
                              title,
                            );
                          },
                          child: NotificationCard(
                            title: title,
                            subtitle: subtitle,
                            imagePath: 'assets/images/Sayer_Logo.png',
                          ),
                        );
                      },
                    ),
                  )
                : ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: itemCount,
                    separatorBuilder: (context, index) => Divider(
                      color: Colors.grey.shade100,
                      thickness: 1,
                      height: 12.h,
                    ),
                    itemBuilder: (context, index) {
                      final leadData = widget.leads[index];
                      String title = leadData.name ?? 'العرض غير معروف';
                      String subtitle =
                          leadData.stageId?.name ?? 'حالة غير معروفة!';
                      return GestureDetector(
                        onTap: () {
                          showConfirmationBottomSheet(context, subtitle, title);
                        },
                        child: NotificationCard(
                          title: title,
                          subtitle: subtitle,
                          imagePath: 'assets/images/Sayer_Logo.png',
                        ),
                      );
                    },
                  ),
            if (isOverflow)
              Padding(
                padding: EdgeInsets.only(top: 20.h),
                child: GestureDetector(
                  onTap: showMore,
                  child: Text(
                    expanded
                        ? 'إخفاء'
                        : '+${widget.leads.length - displayLimit} اعرض اكثر',
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: AppColors.sButtomColor,
                      fontWeight: FontWeight.bold,
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
