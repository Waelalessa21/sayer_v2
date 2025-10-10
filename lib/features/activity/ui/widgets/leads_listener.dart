import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sayer_app/common/business/leads/cubit/leads_cubit.dart';
import 'package:sayer_app/common/business/leads/cubit/leads_state.dart';
import 'package:sayer_app/common/theming/app_colors.dart';
import 'package:sayer_app/features/activity/ui/widgets/empty_order.dart';
import 'package:sayer_app/features/activity/ui/widgets/list_of_user_orders.dart';

class LeadsListener extends StatelessWidget {
  final bool showLoading;

  const LeadsListener({super.key, this.showLoading = false});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LeadsCubit, LeadsState>(
      builder: (context, state) {
        return state.when(
          initial: () => showLoading
              ? Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    backgroundColor: AppColors.sSecondery.withOpacity(0.3),
                    valueColor: AlwaysStoppedAnimation<Color>(
                      AppColors.sSecondery,
                    ),
                  ),
                )
              : const EmptyOrders(),
          loading: () => Center(
            child: CircularProgressIndicator(
              strokeWidth: 2,
              backgroundColor: AppColors.sSecondery.withOpacity(0.3),
              valueColor: AlwaysStoppedAnimation<Color>(AppColors.sSecondery),
            ),
          ),
          successSent: () => const SizedBox.shrink(),
          successFetch: (leads) {
            if (leads == null || leads.isEmpty) {
              return const EmptyOrders();
            }
            return ListOfUserOrders(leads: leads);
          },
          error: (error) => Center(
            child: Text(
              error.msg ?? 'حدث خطأ ما',
              style: const TextStyle(color: Colors.red),
            ),
          ),
        );
      },
    );
  }
}
