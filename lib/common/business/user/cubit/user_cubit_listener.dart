import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sayer_app/common/business/user/cubit/user_cubit.dart';
import 'package:sayer_app/common/business/user/cubit/user_state.dart';

import 'package:sayer_app/common/helpers/extension.dart';

class UserCubitListener extends StatelessWidget {
  final BuildContext parentContext;

  const UserCubitListener({super.key, required this.parentContext});

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserCubit, UserState>(
      listenWhen: (previous, current) =>
          current is SuccessFetch ||
          current is Error ||
          current is SuccessFetchId ||
          current is UpdateUserSuccess,
      listener: (context, state) {
        state.whenOrNull(
          error: (error) {},
          successFetch: (userName) {},
          successFetchId: (userId) {},
          updateUserSuccess: (userName) {
            userName = userName;
            parentContext.pop();
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
