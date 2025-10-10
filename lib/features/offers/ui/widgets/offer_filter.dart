import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sayer_app/common/widgets/animation/animated_item.dart';
import 'package:sayer_app/features/home/data/model/car_offers_model.dart';
import 'package:sayer_app/features/home/logic/car_offers_cubit.dart';
import 'package:sayer_app/features/offers/ui/widgets/filter_offer_card.dart';
import 'package:sayer_app/features/offers/ui/widgets/offer_utils.dart';

class OfferFilter extends StatefulWidget {
  final List<CarOfferData?>? carOffers;
  final bool visible;
  const OfferFilter({
    super.key,
    required this.carOffers,
    required this.visible,
  });

  @override
  State<OfferFilter> createState() => _OfferFilterState();
}

class _OfferFilterState extends State<OfferFilter> {
  bool _isFilteredByOneOffer(List<CarOfferData?>? offers) {
    if (offers == null || offers.isEmpty) return false;
    final offerNames = offers
        .map((e) => e?.name)
        .where((name) => name != null)
        .toSet();
    return offerNames.length == 1;
  }

  Color _getShowroomColor(String name) {
    if (name.contains("صالح")) return const Color(0xFFFF9F1C);
    if (name.contains("المورقي")) return const Color(0xFF007AFF);
    return const Color(0xFF7660E3);
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.visible) return const SizedBox.shrink();

    final isFiltered = _isFilteredByOneOffer(widget.carOffers);
    final offers = extractRepeatedOffersWithShowroom(widget.carOffers);
    if (offers.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Row(
            children: List.generate(
              isFiltered ? offers.length + 1 : offers.length,
              (index) {
                if (isFiltered && index == 0) {
                  return AnimatedItem(
                    index: index,
                    fromRightToLeft: true,
                    child: FilterOfferCard(
                      label: 'كل العروض',
                      imagePath:
                          'https://img.icons8.com/pulsar-line/48/show-all-views.png',
                      color: Colors.green,
                      onTap: () {
                        context.read<CarOffersCubit>().getCarOffers(1, 80);
                      },
                    ),
                  );
                }

                final realIndex = isFiltered ? index - 1 : index;
                final offer = offers[realIndex];
                final color = _getShowroomColor(offer['offerName'] ?? '');

                return Padding(
                  padding: EdgeInsets.only(right: 12.w),
                  child: AnimatedItem(
                    index: index,
                    fromRightToLeft: true,
                    child: FilterOfferCard(
                      label: offer['offerName']!,
                      imagePath: offer['showroomImage']!,
                      color: color,
                      onTap: () {
                        context.read<CarOffersCubit>().getCarOffersByOfferName(
                          offer['offerName']!,
                          1,
                          80,
                        );
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
