import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sayer_app/common/theming/app_colors.dart';
import 'package:sayer_app/features/home/logic/car_offers_cubit.dart';
import 'package:sayer_app/features/home/logic/car_offers_state.dart';
import 'package:sayer_app/features/search/ui/widgets/empty_result.dart';
import 'package:sayer_app/features/search/ui/widgets/no_search_yet.dart';
import 'package:sayer_app/features/search/ui/widgets/user_offers.dart';

class SearchOfferListener extends StatelessWidget {
  final String searchQuery;

  const SearchOfferListener({super.key, required this.searchQuery});

  @override
  Widget build(BuildContext context) {
    if (searchQuery.isEmpty) {
      return NoSearchYet();
    }

    return BlocBuilder<CarOffersCubit, CarOffersState>(
      builder: (context, state) {
        return state.maybeWhen(
          carOffersLoading: () => Padding(
            padding: EdgeInsets.symmetric(vertical: 100.h),
            child: Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
                backgroundColor: AppColors.sSecondery.withOpacity(0.3),
                valueColor: AlwaysStoppedAnimation<Color>(AppColors.sSecondery),
              ),
            ),
          ),
          carOffersSuccess: (cars) {
            if (cars == null || cars.isEmpty) {
              return EmptyResult();
            }

            return Padding(
              padding: EdgeInsets.all(16.0.sp),
              child: UserOffers(carOffers: cars),
            );
          },
          carOffersError: (e) {
            return NoSearchYet();
          },
          orElse: () => EmptyResult(),
        );
      },
    );
  }
}
