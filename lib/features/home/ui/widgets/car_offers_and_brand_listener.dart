import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sayer_app/common/theming/app_colors.dart';
import 'package:sayer_app/common/widgets/popup/show_toast_message.dart';
import 'package:sayer_app/features/home/logic/brands_cubit.dart';
import 'package:sayer_app/features/home/logic/brands_state.dart'
    hide Error, Loading;
import 'package:sayer_app/features/home/logic/car_offers_cubit.dart';
import 'package:sayer_app/features/home/logic/car_offers_state.dart'
    hide CarOffersError, CarOffersLoading;
import 'package:sayer_app/features/home/ui/widgets/car_brands.dart';
import 'package:sayer_app/features/home/ui/widgets/popular_car_section.dart';

class CarOffersAndBrandCubitLisiner extends StatelessWidget {
  const CarOffersAndBrandCubitLisiner({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<BrandsCubit, BrandsState>(
          listenWhen: (previous, current) =>
              current.maybeMap(error: (_) => true, orElse: () => false),
          listener: (context, state) {
            state.whenOrNull(
              error: (_) {
                SchedulerBinding.instance.addPostFrameCallback((_) {
                  showToastMessage(
                    context,
                    "خطا في التحميل",
                    "assets/icons/question.png",
                    isError: true,
                  );
                });
              },
            );
          },
        ),
        BlocListener<CarOffersCubit, CarOffersState>(
          listenWhen: (previous, current) => current.maybeMap(
            carOffersError: (_) => true,
            orElse: () => false,
          ),
          listener: (context, state) {
            state.whenOrNull(
              carOffersError: (_) {
                SchedulerBinding.instance.addPostFrameCallback((_) {
                  showToastMessage(
                    context,
                    "خطا في التحميل",
                    "assets/icons/question.png",
                    isError: true,
                  );
                });
              },
            );
          },
        ),
      ],
      child: BlocBuilder<BrandsCubit, BrandsState>(
        builder: (context, brandState) {
          return BlocBuilder<CarOffersCubit, CarOffersState>(
            builder: (context, carOfferState) {
              final isLoading =
                  brandState.maybeMap(
                    loading: (_) => true,
                    orElse: () => false,
                  ) ||
                  carOfferState.maybeMap(
                    carOffersLoading: (_) => true,
                    orElse: () => false,
                  );

              if (isLoading) {
                return Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.height / 4,
                    ),
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      backgroundColor: AppColors.sSecondery.withOpacity(0.3),
                      valueColor: AlwaysStoppedAnimation<Color>(
                        AppColors.sSecondery,
                      ),
                    ),
                  ),
                );
              }

              final brands = brandState.maybeMap(
                success: (state) => state.brands,
                orElse: () => null,
              );

              return carOfferState.maybeMap(
                carOffersSuccess: (state) {
                  return Column(
                    children: [
                      CarBrands(brands: brands),
                      PopularCarSection(carOffer: state.carOffers),
                    ],
                  );
                },
                orElse: () {
                  return const SizedBox();
                },
              );
            },
          );
        },
      ),
    );
  }
}
