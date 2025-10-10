import 'package:flutter/material.dart';
import 'package:sayer_app/common/theming/app_colors.dart';

Map<String, dynamic> getStatusStyling(String status) {
  switch (status.trim()) {
    case 'طلب جديد':
      return {
        'color': AppColors.info,
        'backgroundColor': const Color(0xFFE3F2FD),
        'icon': "assets/icons/add-post.png",
        'message': 'تم إرسال طلبك بنجاح. سيتم مراجعته قريبًا!',
        'statusText': 'طلب جديد',
      };
    case 'تحت المراجعة الطلب':
      return {
        'color': const Color(0xFFFF9800),
        'backgroundColor': const Color(0xFFFFF3E0),
        'icon': "assets/icons/add-post.png",
        'message': 'طلبك قيد المراجعة حالياً. نشكرك على صبرك!',
        'statusText': 'تحت المراجعة',
      };
    case 'تمت الموافقة':
      return {
        'color': AppColors.success,
        'backgroundColor': const Color(0xFFE8F5E8),
        'icon': "assets/icons/add-post.png",
        'message': 'تهانينا! تمت الموافقة على طلبك بنجاح!',
        'statusText': 'تمت الموافقة',
      };
    default:
      return {
        'color': const Color(0xFF757575),
        'backgroundColor': const Color(0xFFF5F5F5),
        'icon': "assets/icons/add-post.png",
        'message': 'شكراً لتعاملك معنا!',
        'statusText': 'غير محدد',
      };
  }
}

String getMonthName(int month) {
  const months = [
    'يناير',
    'فبراير',
    'مارس',
    'أبريل',
    'مايو',
    'يونيو',
    'يوليو',
    'أغسطس',
    'سبتمبر',
    'أكتوبر',
    'نوفمبر',
    'ديسمبر',
  ];
  return months[month - 1];
}
