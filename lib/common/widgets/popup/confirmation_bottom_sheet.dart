import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sayer_app/common/helpers/month_and_status_helper.dart';

///this used to show the confirmation order inside activity screen
void showConfirmationBottomSheet(
  BuildContext context,
  String title,
  String leadName,
) {
  final statusData = getStatusStyling(title);
  final currentDate = DateTime.now();
  final formattedDate =
      '${currentDate.day} ${getMonthName(currentDate.month)}، ${currentDate.year}';

  showModalBottomSheet(
    backgroundColor: Colors.white,
    context: context,
    useRootNavigator: true,
    isScrollControlled: true,
    showDragHandle: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
    ),
    builder: (context) {
      return Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Container(
          padding: EdgeInsets.all(24.0.w),
          child: SafeArea(
            top: false,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Container(
                      width: 40.w,
                      height: 40.w,
                      decoration: BoxDecoration(
                        color: statusData['backgroundColor'],
                        shape: BoxShape.circle,
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Image.asset(
                          statusData['icon'],
                          color: statusData['color'],
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            leadName,
                            style: TextStyle(
                              fontSize: 18.0.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            title,
                            style: TextStyle(
                              fontSize: 12.0.sp,
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(16.w),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade50,
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(color: Colors.grey.shade200),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'الحالة',
                                style: TextStyle(
                                  fontSize: 12.0.sp,
                                  color: Colors.grey.shade600,
                                ),
                              ),
                              SizedBox(height: 4.h),
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 12.w,
                                  vertical: 6.h,
                                ),
                                decoration: BoxDecoration(
                                  color: statusData['backgroundColor'],
                                  borderRadius: BorderRadius.circular(20.r),
                                ),
                                child: Text(
                                  statusData['statusText'],
                                  style: TextStyle(
                                    fontSize: 12.0.sp,
                                    fontWeight: FontWeight.w600,
                                    color: statusData['color'],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'التاريخ',
                                style: TextStyle(
                                  fontSize: 12.0.sp,
                                  color: Colors.grey.shade600,
                                ),
                              ),
                              SizedBox(height: 4.h),
                              Text(
                                formattedDate,
                                style: TextStyle(
                                  fontSize: 14.0.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black87,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16.h),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(16.w),
                  decoration: BoxDecoration(
                    color: statusData['backgroundColor'],
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(
                      color: statusData['color'].withOpacity(0.3),
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 24.sp,
                        height: 24.sp,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: statusData['backgroundColor'],
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(4.0),
                          child: Image.asset(
                            statusData['icon'],
                            color: statusData['color'],
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: Text(
                          statusData['message'],
                          style: TextStyle(
                            fontSize: 14.0.sp,
                            color: statusData['color'],
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 24.h),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text('موافق', style: TextStyle(fontSize: 14.sp)),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
