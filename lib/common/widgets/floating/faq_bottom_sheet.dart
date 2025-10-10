import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sayer_app/common/constants/app_sizes.dart';
import 'package:sayer_app/common/theming/app_colors.dart';
import 'package:sayer_app/common/widgets/custom_shape/faq_header.dart';
import 'package:sayer_app/features/support/logic/support_cubit.dart';
import 'package:sayer_app/features/support/ui/widgets/support_cubit_lisener.dart';

class FaqBottomSheet extends StatefulWidget {
  final TextEditingController suggestionController;
  final ScrollController scrollController;

  const FaqBottomSheet({
    super.key,
    required this.suggestionController,
    required this.scrollController,
  });

  @override
  FaqBottomSheetState createState() => FaqBottomSheetState();
}

class FaqBottomSheetState extends State<FaqBottomSheet> {
  late FocusNode _focusNode;
  final List<Map<String, String>> faqItems = [
    {'question': 'وش ساير؟', 'answer': 'ساير هي منصة تجمع لك أفضل العروض.'},
    {
      'question': 'كيف ممكن استفيد من ساير؟',
      'answer': 'تقدر تشوف العروض المميزة وتختار الأنسب لك.',
    },
    {
      'question': 'كم عمولتكم؟',
      'answer': 'العمولة تكون حسب نوع الخدمة المطلوبة.',
    },
    {
      'question': 'ما لقيت سيارتي اللي ابحث عنها',
      'answer': 'تقدر الان تكتب لنا اسم سيارتك و حنا ندور لك عليها',
    },
    {
      'question': 'كم يستغرق الطلب؟',
      'answer':
          'بمجرد تقديم الطلب يتم إرساله للوكالة المعنية بحيث يتم العمل على اجراءات الطلب والتواصل مع العميل لاستكمال البيانات المطلوبة',
    },
    {
      'question': 'وش المطلوب مني لتقديم الطلب؟',
      'answer':
          'ساير ما يطلب منك اي معلومات شخصية! فقط رقم جوالك و أسمك لرفع الطلب',
    },
    {
      'question': 'وش الفرق عنكم و عن الوكالات؟',
      'answer':
          'ساير يعمل كحلقة وصل ما بين الوكلاء و العملاء لتسهيل عملية الحصول على التمويل',
    },
    {
      'question': 'رفعت طلب و ما جاني رد؟',
      'answer': 'يمكنك التواصل معنا عبر البريد الالكتروني لمعرفة حالة طلبك',
    },
  ];

  final Map<int, bool> expandedStatus = {};

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  void _dismissKeyboard() {
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _dismissKeyboard,
      child: SingleChildScrollView(
        controller: widget.scrollController,
        padding: EdgeInsets.only(
          bottom:
              MediaQuery.of(context).viewInsets.bottom + AppSizes.defaultSpace,
        ),
        child: Container(
          decoration: BoxDecoration(color: AppColors.light),
          child: Column(
            children: [
              FaqHeader(qusation: true),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: AppSizes.spaceBtwInputFields),
                    Text(
                      'الأسئلة الشائعة',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: AppSizes.spaceBtwItems),
                    faqList(),
                    SizedBox(height: AppSizes.spaceBtwItems),
                    TextField(
                      controller: context.read<SupportCubit>().supportTextfield,
                      focusNode: _focusNode,
                      maxLines: 2,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'ما لقيت سؤالك؟',
                      ),
                    ),
                    SizedBox(height: AppSizes.spaceBtwSections),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          context.read<SupportCubit>().questions();
                        },
                        child: Text('إرسال'),
                      ),
                    ),
                    SizedBox(height: AppSizes.spaceBtwSections),
                    SupportCubitLisener(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget faqList() {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: faqItems.length,
      itemBuilder: (context, index) {
        final item = faqItems[index];
        return _buildFaqItem(index, item['question']!, item['answer']!);
      },
    );
  }

  // Single FAQ item with expansion handling
  Widget _buildFaqItem(int index, String question, String answer) {
    bool isExpanded = expandedStatus[index] ?? false;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              expandedStatus[index] = !isExpanded;
            });
          },
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.primary.withOpacity(0.2)),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  question,
                  style: TextStyle(color: AppColors.black, fontSize: 14.0.sp),
                ),
                Icon(
                  isExpanded ? Icons.expand_less : Icons.expand_more,
                  color: AppColors.primary,
                ),
              ],
            ),
          ),
        ),
        if (isExpanded)
          Padding(
            padding: const EdgeInsets.only(
              top: AppSizes.sm,
              left: AppSizes.defaultSpace,
              right: AppSizes.defaultSpace,
            ),
            child: FadeInRight(
              child: Text(
                answer,
                style: TextStyle(
                  color: AppColors.textDarkBlue,
                  fontSize: 12.0.sp,
                ),
              ),
            ),
          ),
        SizedBox(height: AppSizes.sm),
      ],
    );
  }
}
