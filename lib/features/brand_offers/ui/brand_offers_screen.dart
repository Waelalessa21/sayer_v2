import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sayer_app/common/layout/app_default_bar.dart';
import 'package:sayer_app/common/layout/app_white_pattern.dart';
import 'package:sayer_app/features/brand_offers/ui/widgets/brand_offers_listener.dart';
import 'package:sayer_app/features/home/logic/car_offers_cubit.dart';

/// This is the screen that will be opened to show the offers of a specific brand.
class BrandOffersScreen extends StatefulWidget {
  final int? brandId;

  const BrandOffersScreen({super.key, this.brandId});

  @override
  State<BrandOffersScreen> createState() => _BrandOffersScreenState();
}

class _BrandOffersScreenState extends State<BrandOffersScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    context.read<CarOffersCubit>().getCarOffersByBrandId(
      widget.brandId!,
      1,
      80,
    );

    return AppWhitePattern(
      appBar: AppDefaultBar(showbackArrow: true, arrowColor: Colors.black),
      child: SingleChildScrollView(
        child: Column(children: [BrandOffersListener()]),
      ),
    );
  }
}
