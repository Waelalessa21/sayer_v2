import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sayer_app/common/helpers/user_session.dart';
import 'package:sayer_app/common/theming/app_colors.dart';
import 'package:sayer_app/common/widgets/popup/guest_notification.dart';
import 'package:sayer_app/features/support/logic/support_cubit.dart';
import 'package:sayer_app/features/support/suggestions_popup.dart';

class FindCarService extends StatelessWidget {
  const FindCarService({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (isLoggedInUser) {
          showModalBottomSheet(
            backgroundColor: Colors.transparent,
            useRootNavigator: true,
            context: context,
            isScrollControlled: true,
            builder: (BuildContext context) {
              return Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: BlocProvider(
                  create: (context) => SupportCubit(),
                  child: SuggestionsPopUp(where: 'Tamer'),
                ),
              );
            },
          );
        } else {
          showGuestToastMessage(
            context,
            "assets/icons/request.png",
            "اقتراح سيارة",
            "الرجاء تسجيل الدخول لاستخدام هذه الميزة",
          );
        }
      },
      child: Container(
        padding: EdgeInsets.only(top: 25.w),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withOpacity(0.1),
              blurRadius: 18,
              offset: Offset(0, 15),
            ),
          ],
        ),
        child: Image.asset("assets/images/find_car_service.png"),
      ),
    );
  }
}
