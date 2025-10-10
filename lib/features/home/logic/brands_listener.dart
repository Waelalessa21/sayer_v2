import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sayer_app/common/widgets/popup/show_toast_message.dart';
import 'package:sayer_app/features/home/logic/brands_cubit.dart';
import 'package:sayer_app/features/home/logic/brands_state.dart';

class BrandListener extends StatelessWidget {
  const BrandListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<BrandsCubit, BrandsState>(
      listenWhen: (previous, current) => current is Error || current is Success,
      listener: (context, state) {
        state.whenOrNull(
          error: (error) {
            _handleError(context, error);
          },
          success: (brands) {
            _handleSuccess(brands);
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }

  void _handleError(BuildContext context, dynamic error) {
    print('_____________Error in BrandsCubit______________');
    print('Error Details: ${error.msg}');
    showToastMessage(
      context,
      error.msg.toString(),
      "assets/icons/question.png",
      isError: true,
    );
  }

  void _handleSuccess(dynamic brands) {
    print('_____________Success in BrandsCubit______________');
    print('Fetched Brands: $brands');
  }
}
