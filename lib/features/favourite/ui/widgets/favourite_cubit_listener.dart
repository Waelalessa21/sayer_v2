import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sayer_app/common/constants/app_sizes.dart';
import 'package:sayer_app/common/theming/app_colors.dart';
import 'package:sayer_app/common/widgets/popup/show_toast_message.dart';
import 'package:sayer_app/features/favourite/logic/favorite_cubit.dart';
import 'package:sayer_app/features/favourite/logic/favorite_state.dart';
import 'package:sayer_app/features/favourite/ui/widgets/empty_favourite.dart';
import 'package:sayer_app/features/home/data/model/car_offers_model.dart';
import 'package:sayer_app/common/widgets/cards/offer_card.dart';

class FavouriteListener extends StatelessWidget {
  const FavouriteListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<FavoriteCubit, FavoriteState>(
      listener: (context, state) {
        if (state is Error) {
          showToastMessage(
            context,
            "خطأ في الإرسال، حدث خطا ما",
            "assets/icons/question.png",
            isError: true,
          );
        } else if (state is SuccessDelete) {
          showToastMessage(
            context,
            "تم الحذف من المفضلة",
            "assets/icons/send.png",
            isError: false,
          );
        } else if (state is SuccessSended) {
          showToastMessage(
            context,
            "تم الاضافة الى المفضلة",
            "assets/icons/exclusive.png",
            isError: false,
          );
        }
      },
      child: BlocBuilder<FavoriteCubit, FavoriteState>(
        buildWhen: (previous, current) =>
            current is Loading || current is SuccessFetch,
        builder: (context, state) {
          if (state is Loading) {
            return Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
                backgroundColor: AppColors.sSecondery.withOpacity(0.3),
                valueColor: AlwaysStoppedAnimation<Color>(AppColors.sSecondery),
              ),
            );
          } else if (state is SuccessFetch) {
            final count = state.favoritesCarOffers.count;
            if (count == 0) {
              return ListView(children: [EmptyFavourite()]);
            }
            List<CarOfferData?>? favouriteCarOffers = state
                .favoritesCarOffers
                .items!
                .map((items) {
                  return items.offerId;
                })
                .toList();
            return Column(
              children: [
                SizedBox(height: AppSizes.iconLg.h),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "ســاير يجيبها لك",
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: AppColors.sSecondery,
                    ),
                  ),
                ),
                SizedBox(height: AppSizes.xs.h),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "أكد طلبك على السيارة المفضلة",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.sButtomColor,
                    ),
                  ),
                ),
                SizedBox(height: AppSizes.spaceBtwItems.h / 2.h),
                Expanded(
                  child: OfferCard(
                    carOffers: favouriteCarOffers,
                    scrollController: ScrollController(),
                  ),
                ),
              ],
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
