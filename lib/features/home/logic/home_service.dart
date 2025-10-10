// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sayer_app/common/business/user/cubit/user_cubit.dart';
import 'package:sayer_app/common/helpers/extension.dart';
import 'package:sayer_app/common/helpers/fcm_helper.dart';
import 'package:sayer_app/common/helpers/update_checker.dart';
import 'package:sayer_app/common/helpers/user_session.dart';
import 'package:sayer_app/common/widgets/popup/custom_popup.dart';
import 'package:sayer_app/common/widgets/popup/show_popup.dart';
import 'package:sayer_app/features/home/logic/brands_cubit.dart';
import 'package:sayer_app/features/home/logic/car_offers_cubit.dart';

class HomeService {
  static Future<void> initializePage(
    BuildContext context,
    Function(bool) setCheckedUpdate,
    bool checkedUpdate,
  ) async {
    await Future.delayed(const Duration(seconds: 1));
    await fetchRemoteConfig(context);

    if (isLoggedInUser && userPhoneNumber.isNotEmpty) {
      await context.read<UserCubit>().getUserByPhoneNumber();
    }

    context.read<CarOffersCubit>().getCarOffers(1, 10);
    context.read<BrandsCubit>().getBrands(1, 10);

    if (!checkedUpdate) {
      setCheckedUpdate(true);
      WidgetsBinding.instance.addPostFrameCallback((_) {
        UpdateChecker().checkForUpdate(context);
      });
    }
  }

  static Future<void> refresh(BuildContext context) async {
    context.read<CarOffersCubit>().getCarOffers(1, 10);
    context.read<BrandsCubit>().getBrands(1, 10);
    context.read<UserCubit>().getUserByPhoneNumber();
    await Future.delayed(const Duration(seconds: 1));
  }

  static Future<bool> fetchRemoteConfig(BuildContext context) async {
    bool result = await RemoteConfigService.initializeRemoteConfig('IsLogin');
    if (!result) {
      kickUser(context);
    }
    return result;
  }

  static void kickUser(BuildContext context) {
    showpopupsheet(
      context,
      CustomPopup(
        title: 'عذرا!',
        subtitle: 'على توقف الخدمة في الوقت الحالي، نعمل على تحسين تجربتكم',
      ),
      isDismissible: false,
    );
    Future.delayed(const Duration(seconds: 5), () {
      userLogOut(context);
    });
  }

  static void initializeFCM(BuildContext context) {
    FCMHelper.initialize(context, userId);
  }
}
