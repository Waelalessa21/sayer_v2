import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sayer_app/common/business/leads/cubit/leads_cubit.dart';
import 'package:sayer_app/common/business/user/cubit/user_cubit.dart';
import 'package:sayer_app/common/di/dependency_injection.dart';
import 'package:sayer_app/common/routing/routes.dart';
import 'package:sayer_app/common/widgets/custom_shape/nav_bar.dart';
import 'package:sayer_app/features/about_us/ui/about_us_screen.dart';
import 'package:sayer_app/features/brand_offers/ui/brand_offers_screen.dart';
import 'package:sayer_app/features/brands/ui/brands_screen.dart';
import 'package:sayer_app/features/favourite/logic/favorite_cubit.dart';
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
import 'package:sayer_app/features/carDetails/ui/car_details_screen.dart';
import 'package:sayer_app/features/home/data/model/car_offers_model.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoarding:
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());

      case Routes.login:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<LoginCubit>(
            create: (_) => getIt<LoginCubit>(),
            child: const LoginScreen(),
          ),
        );

      case Routes.otp:
        final phoneNumber = settings.arguments as String;
        return MaterialPageRoute(
          builder: (_) => BlocProvider<OtpCubit>(
            create: (_) => getIt<OtpCubit>(),
            child: OtpScreen(phoneNumber: phoneNumber),
          ),
        );

      case Routes.home:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider<UserCubit>(create: (_) => getIt<UserCubit>()),
              BlocProvider<BrandsCubit>(create: (_) => getIt<BrandsCubit>()),
              BlocProvider<CarOffersCubit>(
                create: (_) => getIt<CarOffersCubit>(),
              ),
              BlocProvider<FavoriteCubit>(
                create: (_) => getIt<FavoriteCubit>(),
              ),
              BlocProvider<LeadsCubit>(create: (_) => getIt<LeadsCubit>()),
            ],
            child: const NavBar(),
          ),
        );

      case Routes.search:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<CarOffersCubit>(
            create: (_) => getIt<CarOffersCubit>(),
            child: const SearchScreen(),
          ),
        );

      case Routes.mehtar:
        return MaterialPageRoute(builder: (_) => const MehtarScreen());

      case Routes.aboutUs:
        return MaterialPageRoute(builder: (_) => const AboutUsScreen());

      case Routes.services:
        return MaterialPageRoute(builder: (_) => const ServicesScreen());

      case Routes.brands:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<BrandsCubit>(
            create: (_) => getIt<BrandsCubit>(),
            child: const BrandsScreen(),
          ),
        );

      case Routes.brandOffers:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<CarOffersCubit>(
            create: (_) => getIt<CarOffersCubit>(),
            child: BrandOffersScreen(brandId: settings.arguments as int),
          ),
        );

      case Routes.carDetails:
        final carOfferData = settings.arguments as CarOfferData?;
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider<FavoriteCubit>(
                create: (_) => getIt<FavoriteCubit>(),
              ),
              BlocProvider<LeadsCubit>(create: (_) => getIt<LeadsCubit>()),
            ],
            child: CarDetailsScreen(carOfferData: carOfferData),
          ),
        );

      default:
        return null;
    }
  }
}
