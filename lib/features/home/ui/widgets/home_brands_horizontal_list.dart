import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sayer_app/common/helpers/extension.dart';
import 'package:sayer_app/common/helpers/user_session.dart';
import 'package:sayer_app/common/routing/routes.dart';
import 'package:sayer_app/common/widgets/cards/small_brand_card.dart';
import 'package:sayer_app/common/widgets/popup/guest_notification.dart';
import 'package:sayer_app/features/home/data/model/brands_model.dart';

class HomeBrandsHorizontalList extends StatelessWidget {
  const HomeBrandsHorizontalList({super.key, this.brand});

  final List<BrandData?>? brand;

  @override
  Widget build(BuildContext context) {
    if (brand == null || brand!.isEmpty) {
      return const SizedBox.shrink();
    }

    return SizedBox(
      height: 85.h,
      child: ListView.builder(
        clipBehavior: Clip.none,
        shrinkWrap: true,
        itemCount: brand!.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          final currentBrand = brand![index];
          if (currentBrand == null || currentBrand.image_url == null) {
            return const SizedBox.shrink();
          }
          final imageUrl = currentBrand.image_url!;
          return SmallBrandCard(
            image: imageUrl,
            onTap: () {
              isLoggedInUser
                  ? context.pushNamed(
                      Routes.brandOffers,
                      arguments: currentBrand.id,
                    )
                  : showGuestToastMessage(
                      context,
                      "assets/icons/exclusive.png",
                      "عروض الوكلاء",
                      "الرجاء تسجيل الدخول لاستخدام هذه الميزة",
                    );
            },
          );
        },
      ),
    );
  }
}
