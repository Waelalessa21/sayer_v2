import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sayer_app/common/constants/app_sizes.dart';
import 'package:sayer_app/common/theming/app_colors.dart';
import 'package:sayer_app/common/widgets/custom_shape/rounded_image.dart';
import 'package:sayer_app/features/carDetails/ui/widgets/full_img.dart';

class ImageSlider extends StatefulWidget {
  const ImageSlider({super.key, required this.imagesList});

  final List<String> imagesList;

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  late PageController _pageController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 1.0);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.imagesList.isEmpty) {
      return SizedBox(
        height: 200.h,
        child: Center(
          child: Icon(
            Icons.image_not_supported,
            size: 50.sp,
            color: AppColors.grey,
          ),
        ),
      );
    }

    return Column(
      children: [
        SizedBox(
          height: 200.h,
          width: double.infinity,
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: (index) {
              if (mounted) {
                setState(() {
                  _currentIndex = index;
                });
              }
            },
            itemCount: widget.imagesList.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      opaque: false,
                      pageBuilder: (_, __, ___) => ImageView(
                        imagesList: widget.imagesList,
                        initialIndex: index,
                      ),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                            return FadeTransition(
                              opacity: animation,
                              child: child,
                            );
                          },
                    ),
                  );
                },
                child: SizedBox(
                  width: double.infinity,
                  height: 200.h,
                  child: RoundedImage(
                    isNetworkImage: true,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 200.h,
                    imageUrl: widget.imagesList[index],
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(height: AppSizes.spaceBtwItems.h),
        if (widget.imagesList.length > 1)
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                widget.imagesList.length,
                (index) => Container(
                  width: _currentIndex == index ? 12.w : 8.w,
                  height: 6.h,
                  margin: EdgeInsets.symmetric(horizontal: 2.sp),
                  decoration: BoxDecoration(
                    color: _currentIndex == index
                        ? AppColors.primary
                        : AppColors.grey.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
