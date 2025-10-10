import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sayer_app/common/business/leads/cubit/leads_cubit.dart';
import 'package:sayer_app/common/helpers/user_session.dart';
import 'package:sayer_app/common/theming/app_colors.dart';
import 'package:sayer_app/features/activity/ui/widgets/leads_listener.dart';

class UserOrders extends StatefulWidget {
  const UserOrders({super.key});

  @override
  State<UserOrders> createState() => _UserOrdersState();
}

class _UserOrdersState extends State<UserOrders> {
  @override
  void initState() {
    super.initState();
    _loadLeads();
  }

  Future<void> _loadLeads() async {
    context.read<LeadsCubit>().getLeadByUserId(userId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: _loadLeads,
        color: AppColors.primary,
        backgroundColor: AppColors.white,
        child: ListView(
          physics: const AlwaysScrollableScrollPhysics(),
          children: const [LeadsListener(showLoading: true)],
        ),
      ),
    );
  }
}
