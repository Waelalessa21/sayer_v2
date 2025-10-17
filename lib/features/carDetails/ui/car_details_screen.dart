// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sayer_app/common/business/leads/cubit/leads_cubit.dart';
import 'package:sayer_app/common/business/user/cubit/user_cubit.dart';
import 'package:sayer_app/common/constants/app_sizes.dart';
import 'package:sayer_app/common/data/leads/service/leads_service.dart';
import 'package:sayer_app/common/di/dependency_injection.dart';
import 'package:sayer_app/common/helpers/user_session.dart';
import 'package:sayer_app/common/layout/app_default_bar.dart';
import 'package:sayer_app/common/layout/app_gradient_color.dart';
import 'package:sayer_app/common/networking/api_result.dart';
import 'package:sayer_app/common/theming/app_colors.dart';
import 'package:sayer_app/common/widgets/custom_shape/confirmation_contanier.dart';
import 'package:sayer_app/common/widgets/popup/profile_bottom_sheet.dart';
import 'package:sayer_app/common/widgets/popup/show_toast_message.dart';
import 'package:sayer_app/features/favourite/logic/favorite_cubit.dart';
import 'package:sayer_app/features/home/data/model/car_offers_model.dart';
import 'package:sayer_app/features/carDetails/ui/widgets/car_header_section.dart';
import 'package:sayer_app/features/carDetails/ui/widgets/car_detailes_content.dart';

class CarDetailsScreen extends StatefulWidget {
  const CarDetailsScreen({super.key, this.carOfferData});
  final CarOfferData? carOfferData;

  @override
  State<CarDetailsScreen> createState() => _CarDetailsScreenState();
}

class _CarDetailsScreenState extends State<CarDetailsScreen> {
  bool isAddFavorite = false;

  @override
  void initState() {
    super.initState();
    _checkIfFavorite();
  }

  Future<void> _checkIfFavorite() async {
    try {
      final result = await context.read<FavoriteCubit>().checkIfFavorite(
        userId,
        widget.carOfferData?.id ?? 0,
      );
      setState(() {
        isAddFavorite = result;
      });
    } catch (_) {}
  }

  Future<void> _toggleFavorite() async {
    if (userName.isNotEmpty) {
      if (!isAddFavorite) {
        await context.read<FavoriteCubit>().addFavorite(
          userId,
          widget.carOfferData!.id,
        );
      } else {
        await context.read<FavoriteCubit>().deleteFavorite(
          widget.carOfferData!.id,
        );
      }
      setState(() {
        isAddFavorite = !isAddFavorite;
      });
    } else {
      await _showProfileBottomSheet();
    }
  }

  Future<void> _showProfileBottomSheet() async {
    final isFormSubmitted = await showModalBottomSheet<bool>(
      backgroundColor: AppColors.lightGrey,
      context: context,
      showDragHandle: false,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
      ),
      isScrollControlled: true,
      builder: (BuildContext context) {
        return BlocProvider(
          create: (context) => UserCubit(getIt()),
          child: ProfileBottomSheet(),
        );
      },
    );

    if (isFormSubmitted == true) {
      setState(() {});
    }
  }

  Future<void> _submitLead() async {
    if (widget.carOfferData == null) return;

    if (userName.isEmpty || userName == "1") {
      await _showProfileBottomSheet();
      return;
    }

    final leadsService = getIt<LeadsService>();
    final leadsResult = await leadsService.getLeadByUserId(userId);
    final leadsModel = leadsResult.when(
      success: (data) => data,
      failure: (_) => null,
    );

    final alreadySent =
        leadsModel?.items?.any(
          (lead) =>
              lead.car_id == widget.carOfferData!.car.id &&
              lead.car_name == widget.carOfferData!.car.name,
        ) ??
        false;

    if (alreadySent) {
      showToastMessage(
        context,
        "لا تشيل هم، بنحرص عليه لك",
        "assets/icons/question.png",
        isError: true,
      );
      return;
    }

    final bool? confirmed = await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: ConfirmationContainer(
            title: 'تأكيد إرسال الطلب',
            onCancel: () => Navigator.of(context).pop(false),
            onConfirm: () => Navigator.of(context).pop(true),
          ),
        );
      },
    );

    if (confirmed == true) {
      context.read<LeadsCubit>().submitLead(widget.carOfferData!.id);
      showToastMessage(
        context,
        "تم إرسال الطلب بنجاح",
        "assets/icons/money.png",
        isError: false,
      );
    } else {
      showToastMessage(
        context,
        "ننتظرك في أقرب وقت! ",
        "assets/icons/question.png",
        isError: true,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppGradientColor(
      appBar: AppDefaultBar(
        showbackArrow: true,
        action: [
          IconButton(
            icon: Icon(
              isAddFavorite ? Icons.bookmark : Icons.bookmark_border,
              color: Colors.white,
            ),
            onPressed: _toggleFavorite,
          ),
        ],
      ),
      child: widget.carOfferData == null
          ? _NoDataWidget()
          : SingleChildScrollView(
              child: Column(
                children: [
                  CarHeaderSection(carOfferData: widget.carOfferData!),
                  CarDetailsContent(carOfferData: widget.carOfferData!),
                  SubmitButtonSection(onPressed: _submitLead),
                  SizedBox(height: AppSizes.appBarHeight),
                ],
              ),
            ),
    );
  }
}

class _NoDataWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error_outline, size: 50.sp, color: AppColors.error),
          SizedBox(height: 16.h),
          Text(
            'لا توجد تفاصيل متاحة لهذا العرض.',
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class SubmitButtonSection extends StatelessWidget {
  final VoidCallback onPressed;

  const SubmitButtonSection({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 385.w,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text('ارسال طلب', style: TextStyle(fontFamily: "sayerNewFont")),
      ),
    );
  }
}
