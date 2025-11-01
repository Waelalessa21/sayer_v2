import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sayer_app/common/business/leads/cubit/leads_cubit.dart';
import 'package:sayer_app/common/business/user/cubit/user_cubit.dart';
import 'package:sayer_app/common/di/dependency_injection.dart';
import 'package:sayer_app/common/routing/routes.dart';
import 'package:sayer_app/common/widgets/custom_shape/nav_bar.dart';
import 'package:sayer_app/features/CarDetails/ui/CarDetails_screen.dart';
import 'package:sayer_app/features/about_us/ui/about_us_screen.dart';
import 'package:sayer_app/features/brand_offers/ui/brand_offers_screen.dart';
import 'package:sayer_app/features/brands/ui/brands_screen.dart';
import 'package:sayer_app/features/favourite/logic/favorite_cubit.dart';
import 'package:sayer_app/features/home/data/model/car_offers_model.dart';
import 'package:sayer_app/features/home/logic/brands_cubit.dart';
import 'package:sayer_app/features/home/logic/car_offers_cubit.dart';
import 'package:sayer_app/features/login/logic/login_cubit.dart';
import 'package:sayer_app/features/login/ui/login_screen.dart';
import 'package:sayer_app/features/mehtar/ui/mehtar_screen.dart';
import 'package:sayer_app/features/onBoarding/ui/on_boarding_screen.dart';
import 'package:sayer_app/features/otp/logic/otp_cubit.dart';
import 'package:sayer_app/features/otp/ui/otp_screen.dart';
import 'package:sayer_app/features/search/ui/search_screen.dart';
import 'package:sayer_app/features/services/ui/services_screen.dart';

GoRouter createGoRouter(bool isLoggedInUser) {
  return GoRouter(
    initialLocation: isLoggedInUser ? Routes.home : Routes.onBoarding,
    routes: [
      GoRoute(
        path: Routes.onBoarding,
        builder: (context, state) => const OnBoardingScreen(),
      ),
      GoRoute(
        path: Routes.login,
        builder: (context, state) => BlocProvider(
          create: (_) => getIt<LoginCubit>(),
          child: const LoginScreen(),
        ),
      ),
      GoRoute(
        path: Routes.otp,
        builder: (context, state) => BlocProvider(
          create: (_) => getIt<OtpCubit>(),
          child: OtpScreen(phoneNumber: state.extra as String),
        ),
      ),
      GoRoute(
        path: Routes.home,
        builder: (context, state) => MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => getIt<UserCubit>()),
            BlocProvider(create: (_) => getIt<BrandsCubit>()),
            BlocProvider(create: (_) => getIt<CarOffersCubit>()),
            BlocProvider(create: (_) => getIt<FavoriteCubit>()),
            BlocProvider(create: (_) => getIt<LeadsCubit>()),
          ],
          child: const NavBar(),
        ),
      ),
      GoRoute(
        path: Routes.search,
        builder: (context, state) => BlocProvider(
          create: (_) => getIt<CarOffersCubit>(),
          child: const SearchScreen(),
        ),
      ),
      GoRoute(
        path: Routes.mehtar,
        builder: (context, state) => const MehtarScreen(),
      ),
      GoRoute(
        path: Routes.aboutUs,
        builder: (context, state) => const AboutUsScreen(),
      ),
      GoRoute(
        path: Routes.services,
        builder: (context, state) => const ServicesScreen(),
      ),
      GoRoute(
        path: Routes.CarDetails,
        builder: (context, state) =>
            CarDetailsScreen(carOfferData: state.extra as CarOfferData),
      ),
      GoRoute(
        path: Routes.brands,
        builder: (context, state) => BlocProvider(
          create: (_) => getIt<BrandsCubit>(),
          child: const BrandsScreen(),
        ),
      ),
      GoRoute(
        path: Routes.brandOffers,
        builder: (context, state) => BlocProvider(
          create: (_) => getIt<CarOffersCubit>(),
          child: BrandOffersScreen(brandId: state.extra as int),
        ),
      ),
    ],
  );
}
