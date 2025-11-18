import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sayer_app/common/business/leads/cubit/leads_cubit.dart';
import 'package:sayer_app/common/business/user/cubit/user_cubit.dart';
import 'package:sayer_app/common/data/leads/service/leads_service.dart';
import 'package:sayer_app/common/di/dependency_injection.dart';
import 'package:sayer_app/common/helpers/user_session.dart';
import 'package:sayer_app/common/networking/api_result.dart';
import 'package:sayer_app/common/theming/app_colors.dart';
import 'package:sayer_app/common/widgets/custom_shape/confirmation_contanier.dart';
import 'package:sayer_app/common/widgets/popup/profile_bottom_sheet.dart';
import 'package:sayer_app/common/widgets/popup/show_toast_message.dart';
import 'package:sayer_app/features/favourite/logic/favorite_cubit.dart';
import 'package:sayer_app/features/home/data/model/car_offers_model.dart';

class CarDetailsHelpers {
  static Future<bool> checkIfFavorite(BuildContext context, int offerId) async {
    try {
      final result = await context.read<FavoriteCubit>().checkIfFavorite(
        userId,
        offerId,
      );
      return result;
    } catch (_) {
      return false;
    }
  }

  static Future<void> toggleFavorite(
    BuildContext context,
    CarOfferData carOfferData,
    bool isAddFavorite,
    Function(bool) updateFavoriteState,
  ) async {
    if (userName.isNotEmpty) {
      if (!isAddFavorite) {
        await context.read<FavoriteCubit>().addFavorite(
          userId,
          carOfferData.id,
        );
      } else {
        await context.read<FavoriteCubit>().deleteFavorite(carOfferData.id);
      }
      updateFavoriteState(!isAddFavorite);
    } else {
      await showProfileBottomSheet(context);
    }
  }

  static Future<bool?> showProfileBottomSheet(BuildContext context) async {
    final isFormSubmitted = await showModalBottomSheet<bool>(
      backgroundColor: AppColors.lightGrey,
      context: context,
      showDragHandle: false,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
      ),
      isScrollControlled: true,
      builder: (BuildContext context) {
        return BlocProvider(
          create: (context) => UserCubit(getIt()),
          child: const ProfileBottomSheet(),
        );
      },
    );

    return isFormSubmitted;
  }

  static Future<void> submitLead(
    BuildContext context,
    CarOfferData carOfferData, {
    bool isFinance = false,
    GlobalKey<FormState>? formKey,
  }) async {
    if (userName.isEmpty) {
      await showProfileBottomSheet(context);
      return;
    }

    if (isFinance && (formKey == null || !formKey.currentState!.validate())) {
      showToastMessage(
        context,
        "يجب تعبئة جميع الحقول",
        "assets/icons/question.png",
        isError: true,
      );
      return;
    }

    final leadsService = getIt<LeadsService>();
    final leadsResult = await leadsService.getLeadByUserId(userId);

    bool alreadySent = false;
    leadsResult.when(
      success: (data) {
        alreadySent =
            data.items?.any(
              (lead) =>
                  lead.car_id == carOfferData.car.id &&
                  lead.car_name == carOfferData.car.name,
            ) ??
            false;
      },
      failure: (_) {},
    );

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
            title: isFinance ? "طلب تمويل 💳" : 'طلب السيارة بسعر الكاش 💵',
            subtitle: isFinance
                ? " تأكيدك يعني؟ راح نتواصل معك ونعطيك العرض الأفضل"
                : 'السعر الموضوع للسيارة هو نقداً فقط',
            cancelButtonText: 'هوّنت',
            confirmButtonText: 'تأكيد',
            onCancel: () => Navigator.of(context).pop(false),
            onConfirm: () => Navigator.of(context).pop(true),
          ),
        );
      },
    );

    if (confirmed == true) {
      context.read<LeadsCubit>().submitLead(carOfferData.id);

      showToastMessage(
        context,
        isFinance ? "تم إرسال طلب التمويل بنجاح" : "تم إرسال الطلب بنجاح",
        "assets/icons/money.png",
        isError: false,
      );
    } else {
      showToastMessage(
        context,
        "ننتظرك في أقرب وقت!",
        "assets/icons/question.png",
        isError: true,
      );
    }
  }
}
