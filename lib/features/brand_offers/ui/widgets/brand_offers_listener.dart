import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sayer_app/common/theming/app_colors.dart';
import 'package:sayer_app/features/home/logic/car_offers_cubit.dart';
import 'package:sayer_app/features/home/logic/car_offers_state.dart';
import 'package:sayer_app/features/search/ui/widgets/empty_result.dart';
import 'package:sayer_app/features/search/ui/widgets/user_offers.dart';

class BrandOffersListener extends StatelessWidget {
  const BrandOffersListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CarOffersCubit, CarOffersState>(
      builder: (context, state) {
        return state.maybeWhen(
          carOffersLoading: () => Center(
            child: CircularProgressIndicator(
              strokeWidth: 2,
              backgroundColor: AppColors.sSecondery.withOpacity(0.3),
              valueColor: AlwaysStoppedAnimation<Color>(AppColors.sSecondery),
            ),
          ),
          carOffersSuccess: (cars) {
            if (cars != null && cars.isNotEmpty) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: UserOffers(carOffers: cars),
              );
            } else {
              return Center(child: EmptyResult());
            }
          },
          carOffersError: (error) => const EmptyResult(),
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }
}
