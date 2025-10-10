import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sayer_app/common/constants/app_sizes.dart';
import 'package:sayer_app/common/layout/app_default_bar.dart';
import 'package:sayer_app/common/layout/app_white_pattern.dart';
import 'package:sayer_app/common/theming/app_colors.dart';
import 'package:sayer_app/features/home/logic/car_offers_cubit.dart';
import 'package:sayer_app/features/offers/ui/widgets/offers_bloc_listener.dart';

class OffersScreen extends StatefulWidget {
  const OffersScreen({super.key});

  @override
  State<OffersScreen> createState() => _OffersScreenState();
}

class _OffersScreenState extends State<OffersScreen> {
  Future<void> _onRefresh() async {
    await context.read<CarOffersCubit>().getCarOffers(1, 80);
    Future.delayed(Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    context.read<CarOffersCubit>().getCarOffers(1, 80);
    return AppWhitePattern(
      appBar: AppDefaultBar(),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSizes.spaceBtwItems.sp),
        child: RefreshIndicator(
          backgroundColor: Colors.white,
          color: AppColors.primary,
          onRefresh: () async {
            _onRefresh();
          },
          child: const OfferBlocListener(),
        ),
      ),
    );
  }
}
