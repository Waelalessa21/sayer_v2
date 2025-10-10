import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sayer_app/common/helpers/user_session.dart';
import 'package:sayer_app/common/widgets/cards/home_small_cards.dart';
import 'package:sayer_app/common/widgets/popup/guest_notification.dart';
import 'package:sayer_app/common/widgets/popup/order_offer_pop_up.dart';
import 'package:sayer_app/features/support/logic/support_cubit.dart';

class SmallHomeOffers extends StatelessWidget {
  const SmallHomeOffers({super.key});

  final List offers = const [
    {
      "title": "عرض دفعتين",
      "subtitle": "50٪ الآن والباقي لاحقًا",
      "image": "assets/icons/installment-plan.png",
    },
    {
      "title": "بدون دفعة",
      "subtitle": "قسّط سيارتك بلا مقدم",
      "image": "assets/icons/business.png",
    },
    {
      "title": "كاش",
      "subtitle": "سيارتك بدون اقساط",
      "image": "assets/icons/money.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70.h,
      child: ListView.builder(
        shrinkWrap: true,
        clipBehavior: Clip.none,
        scrollDirection: Axis.horizontal,
        itemCount: offers.length,
        itemBuilder: (context, index) {
          final offer = offers[index];
          return Padding(
            padding: EdgeInsets.only(right: 10.w),
            child: HomeSmallCard(
              title: offer["title"]!,
              subtitle: offer["subtitle"]!,
              leading: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.grey.shade300, width: 1.w),
                ),
                child: CircleAvatar(
                  radius: 17.r,
                  backgroundColor: Colors.transparent,
                  child: Image.asset(
                    offer["image"]!,
                    width: 26.w,
                    height: 26.h,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              onPressed: () {
                if (isLoggedInUser) {
                  showModalBottomSheet(
                    useRootNavigator: true,
                    backgroundColor: Colors.transparent,
                    context: context,
                    isScrollControlled: true,
                    builder: (BuildContext context) {
                      return Padding(
                        padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom,
                        ),
                        child: BlocProvider(
                          create: (context) => SupportCubit(),
                          child: OrderOffersPopup(subtitle: offer["subtitle"]!),
                        ),
                      );
                    },
                  );
                } else {
                  showGuestToastMessage(
                    context,
                    "assets/icons/request.png",
                    offer["title"]!,
                    "الرجاء تسجيل الدخول لعرض التفاصيل",
                  );
                }
              },
            ),
          );
        },
      ),
    );
  }
}
