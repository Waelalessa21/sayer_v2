import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sayer_app/common/constants/app_sizes.dart';
import 'package:sayer_app/features/home/data/model/car_offers_model.dart';
import 'package:sayer_app/common/widgets/cards/offer_card.dart';
import 'package:sayer_app/features/offers/ui/widgets/offer_filter.dart';

class OffersAndFilters extends StatelessWidget {
  const OffersAndFilters({
    super.key,
    required this.showFilter,
    required this.carOffers,
    required ScrollController scrollController,
  }) : _scrollController = scrollController;

  final bool showFilter;
  final List<CarOfferData?>? carOffers;
  final ScrollController _scrollController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: AppSizes.iconLg.h),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          transitionBuilder: (child, animation) {
            final offsetAnimation = Tween<Offset>(
              begin: const Offset(0, -0.3),
              end: Offset.zero,
            ).animate(animation);

            return SlideTransition(
              position: offsetAnimation,
              child: FadeTransition(opacity: animation, child: child),
            );
          },
          child: showFilter
              ? OfferFilter(
                  key: const ValueKey('filter_shown'),
                  carOffers: carOffers,
                  visible: true,
                )
              : const SizedBox(key: ValueKey('filter_hidden'), height: 0),
        ),
        SizedBox(height: AppSizes.spaceBtwItems.h / 2),
        Expanded(
          child: Center(
            child: OfferCard(
              carOffers: carOffers,
              scrollController: _scrollController,
            ),
          ),
        ),
      ],
    );
  }
}
