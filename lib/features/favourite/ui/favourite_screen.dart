import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sayer_app/common/constants/app_sizes.dart';
import 'package:sayer_app/common/helpers/user_session.dart';
import 'package:sayer_app/common/layout/app_default_bar.dart';
import 'package:sayer_app/common/layout/app_white_pattern.dart';
import 'package:sayer_app/common/theming/app_colors.dart';
import 'package:sayer_app/features/favourite/logic/favorite_cubit.dart';
import 'package:sayer_app/features/favourite/ui/widgets/favourite_cubit_listener.dart';

class FavouriteScreen extends StatefulWidget {
  final GlobalKey<ScaffoldState>? scaffoldKey;

  const FavouriteScreen({super.key, this.scaffoldKey});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<FavoriteCubit>().getFavorites(userId, 1, 20);
    });
  }

  Future<void> refresh() async {
    await context.read<FavoriteCubit>().getFavorites(userId, 1, 20);
  }

  @override
  Widget build(BuildContext context) {
    return AppWhitePattern(
      appBar: AppDefaultBar(showbackArrow: false),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSizes.spaceBtwItems.sp),
        child: RefreshIndicator(
          onRefresh: refresh,
          color: AppColors.primary,
          backgroundColor: AppColors.white,
          notificationPredicate: (notification) => notification.depth == 0,
          child: FavouriteListener(),
        ),
      ),
    );
  }
}
