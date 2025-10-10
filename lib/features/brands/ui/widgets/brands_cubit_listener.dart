import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sayer_app/common/theming/app_colors.dart';
import 'package:sayer_app/features/home/logic/brands_cubit.dart';
import 'package:sayer_app/features/home/logic/brands_state.dart';
import 'package:sayer_app/features/brands/ui/widgets/brands_grid.dart';

class BrandsCubitListener extends StatelessWidget {
  const BrandsCubitListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BrandsCubit, BrandsState>(
      buildWhen: (previous, current) =>
          current is Error || current is Loading || current is Success,
      builder: (context, state) {
        return state.maybeWhen(
          loading: () => Center(
            child: CircularProgressIndicator(
              strokeWidth: 2,
              backgroundColor: AppColors.sSecondery.withOpacity(0.3),
              valueColor: AlwaysStoppedAnimation<Color>(AppColors.sSecondery),
            ),
          ),
          success: (brands) => BrandsGrid(brands: brands),
          error: (e) {
            return SizedBox.shrink();
          },
          orElse: () => SizedBox.shrink(),
        );
      },
    );
  }
}
