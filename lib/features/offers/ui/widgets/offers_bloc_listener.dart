import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sayer_app/common/theming/app_colors.dart';
import 'package:sayer_app/common/widgets/popup/show_toast_message.dart';
import 'package:sayer_app/features/home/logic/car_offers_cubit.dart';
import 'package:sayer_app/features/home/logic/car_offers_state.dart';
import 'package:sayer_app/features/offers/ui/widgets/offers_and_filters.dart';

class OfferBlocListener extends StatefulWidget {
  const OfferBlocListener({super.key});

  @override
  State<OfferBlocListener> createState() => _OfferBlocListenerState();
}

class _OfferBlocListenerState extends State<OfferBlocListener> {
  bool showFilter = true;
  double lastOffset = 0;
  final ScrollController _scrollController = ScrollController();

  void _scrollListener() {
    final offset = _scrollController.offset;
    final direction = offset - lastOffset;

    if (direction > 10 && showFilter) {
      setState(() => showFilter = false);
    } else if (direction < -10 && !showFilter) {
      setState(() => showFilter = true);
    }

    lastOffset = offset;
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CarOffersCubit, CarOffersState>(
      listenWhen: (previous, current) => current is CarOffersError,
      listener: (context, state) {
        if (state is CarOffersError) {
          showToastMessage(
            context,
            "حدث خطا ما",
            "assets/icons/question.png",
            isError: true,
          );
        }
      },
      buildWhen: (previous, current) =>
          current is CarOffersLoading || current is CarOffersSuccess,
      builder: (context, state) {
        if (state is CarOffersLoading) {
          return Center(
            child: CircularProgressIndicator(
              strokeWidth: 2,
              backgroundColor: AppColors.sSecondery.withOpacity(0.3),
              valueColor: AlwaysStoppedAnimation<Color>(AppColors.sSecondery),
            ),
          );
        } else if (state is CarOffersSuccess) {
          return OffersAndFilters(
            showFilter: showFilter,
            carOffers: state.carOffers,
            scrollController: _scrollController,
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
