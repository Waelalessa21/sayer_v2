import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'package:sayer_app/common/business/leads/cubit/leads_cubit.dart';
import 'package:sayer_app/common/business/user/cubit/user_cubit.dart';
import 'package:sayer_app/common/data/leads/repo/leads_repo.dart';
import 'package:sayer_app/common/data/leads/service/leads_service.dart';
import 'package:sayer_app/common/data/user/repo/user_repo.dart';
import 'package:sayer_app/common/data/user/service/user_serivce.dart';
import 'package:sayer_app/common/networking/dio_factory.dart';

import 'package:sayer_app/features/login/data/repo/login_repo.dart';
import 'package:sayer_app/features/login/data/service/login_service.dart';
import 'package:sayer_app/features/login/logic/login_cubit.dart';

import 'package:sayer_app/features/otp/data/repo/otp_repo.dart';
import 'package:sayer_app/features/otp/data/service/otp_service.dart';
import 'package:sayer_app/features/otp/logic/otp_cubit.dart';

import 'package:sayer_app/features/home/data/repo/brands_repo.dart';
import 'package:sayer_app/features/home/data/service/brands_service.dart';
import 'package:sayer_app/features/home/logic/brands_cubit.dart';

import 'package:sayer_app/features/home/data/repo/car_offers_repo.dart';
import 'package:sayer_app/features/home/data/service/car_offers_service.dart';
import 'package:sayer_app/features/home/logic/car_offers_cubit.dart';

import 'package:sayer_app/features/favourite/data/repo/favorite_repo.dart';
import 'package:sayer_app/features/favourite/data/service/favorites_service.dart';
import 'package:sayer_app/features/favourite/logic/favorite_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  final Dio dioInstance = DioFactory.getDio();

  _registerDioDependencies(dioInstance);
  _registerBusinessLogic();
  _registerUserLogic();
  _registerAdditionalFeatures();
}

void _registerDioDependencies(Dio dio) {
  getIt.registerLazySingleton<Dio>(() => dio);
}

void _registerBusinessLogic() {
  getIt.registerLazySingleton<LoginService>(() => LoginService(getIt<Dio>()));
  getIt.registerLazySingleton<LoginRepo>(
    () => LoginRepo(getIt<LoginService>()),
  );

  getIt.registerLazySingleton<OtpService>(() => OtpService(getIt<Dio>()));
  getIt.registerLazySingleton<OtpRepo>(() => OtpRepo(getIt<OtpService>()));

  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt<LoginRepo>()));
  getIt.registerFactory<OtpCubit>(
    () => OtpCubit(getIt<OtpRepo>(), getIt<LoginRepo>()),
  );
}

void _registerUserLogic() {
  getIt.registerLazySingleton<UserRepo>(() => UserRepo(getIt<Dio>()));
  getIt.registerLazySingleton<UserService>(
    () => UserService(getIt<UserRepo>()),
  );
  getIt.registerLazySingleton<UserCubit>(() => UserCubit(getIt<UserService>()));
}

void _registerAdditionalFeatures() {
  getIt.registerLazySingleton<BrandRepo>(() => BrandRepo(getIt<Dio>()));
  getIt.registerLazySingleton<BrandService>(
    () => BrandService(getIt<BrandRepo>()),
  );
  getIt.registerFactory<BrandsCubit>(() => BrandsCubit(getIt<BrandService>()));

  getIt.registerLazySingleton<CarOffersRepo>(() => CarOffersRepo(getIt<Dio>()));
  getIt.registerLazySingleton<CarOffersService>(
    () => CarOffersService(getIt<CarOffersRepo>()),
  );
  getIt.registerFactory<CarOffersCubit>(
    () => CarOffersCubit(getIt<CarOffersService>()),
  );

  getIt.registerLazySingleton<FavoriteRepo>(() => FavoriteRepo(getIt<Dio>()));
  getIt.registerLazySingleton<FavoritesService>(
    () => FavoritesService(getIt<FavoriteRepo>()),
  );
  getIt.registerFactory<FavoriteCubit>(
    () => FavoriteCubit(getIt<FavoritesService>()),
  );

  getIt.registerLazySingleton<LeadRepo>(() => LeadRepo(getIt<Dio>()));
  getIt.registerLazySingleton<LeadsService>(
    () => LeadsService(getIt<LeadRepo>()),
  );
  getIt.registerFactory<LeadsCubit>(() => LeadsCubit(getIt<LeadsService>()));
}
