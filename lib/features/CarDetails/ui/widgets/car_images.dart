import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sayer_app/common/theming/app_colors.dart';
import 'package:sayer_app/features/home/data/model/car_offers_model.dart';

class CarImages extends StatefulWidget {
  final List<ImageId> images;
  final Color arrowColor;
  final double arrowSize;
  final Color indicatorActiveColor;
  final Color indicatorInactiveColor;

  const CarImages({
    required this.images,
    this.arrowColor = AppColors.white,
    this.arrowSize = 20.0,
    this.indicatorActiveColor = AppColors.white,
    this.indicatorInactiveColor = Colors.white38,
    super.key,
  });

  @override
  State<CarImages> createState() => _CarImagesState();
}

class _CarImagesState extends State<CarImages> {
  late PageController controller;
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    controller = PageController();
  }

  void _goNext() {
    if (currentPage < widget.images.length - 1) {
      controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _goPrevious() {
    if (currentPage > 0) {
      controller.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final double arrowIconSize = widget.arrowSize.sp;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          PageView.builder(
            controller: controller,
            itemCount: widget.images.length,
            onPageChanged: (index) => setState(() => currentPage = index),
            itemBuilder: (context, index) {
              final imageUrl = widget.images[index].public_url ?? '';
              return Container(
                color: Colors.black,
                alignment: Alignment.center,
                child: InteractiveViewer(
                  child: Image.network(imageUrl, fit: BoxFit.contain),
                ),
              );
            },
          ),

          Positioned(
            top: 50.h,
            left: 0,
            right: 0,
            child: Center(
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '${currentPage + 1}',
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: ' / ',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: '${widget.images.length}',
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          Positioned(
            top: 44.h,
            right: 12.w,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Icon(Icons.close, color: AppColors.white, size: 20.sp),
            ),
          ),

          Positioned(
            bottom: 35.h,
            right: 8.w,
            child: IconButton(
              padding: EdgeInsets.zero,
              constraints: BoxConstraints.tight(Size(36.w, 36.h)),
              icon: Icon(
                Icons.arrow_forward_ios,
                color: AppColors.white,
                size: arrowIconSize,
              ),
              onPressed: _goNext,
            ),
          ),

          Positioned(
            bottom: 35.h,
            left: 8.w,
            child: IconButton(
              padding: EdgeInsets.zero,
              constraints: BoxConstraints.tight(Size(36.w, 36.h)),
              icon: Icon(
                Icons.arrow_back_ios,
                color: currentPage == 0 ? AppColors.grey : AppColors.white,
                size: arrowIconSize,
              ),
              onPressed: currentPage == 0 ? null : _goPrevious,
            ),
          ),

          Positioned(
            bottom: 60.h,
            left: 0,
            right: 0,
            child: Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(3, (i) {
                  final isActive = i == currentPage % 3;
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    margin: EdgeInsets.symmetric(horizontal: 4.w),
                    width: 6.w,
                    height: 6.w,
                    decoration: BoxDecoration(
                      color: isActive
                          ? widget.indicatorActiveColor
                          : widget.indicatorInactiveColor,
                      shape: BoxShape.circle,
                    ),
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
