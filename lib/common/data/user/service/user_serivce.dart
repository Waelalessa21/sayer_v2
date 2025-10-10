import 'package:dio/dio.dart';
import 'package:sayer_app/common/data/user/model/user_model.dart';
import 'package:sayer_app/common/data/user/repo/user_repo.dart';
import 'package:sayer_app/common/helpers/user_session.dart';
import 'package:sayer_app/common/networking/api_error_handler.dart';
import 'package:sayer_app/common/networking/api_result.dart';

class UserService {
  final UserRepo _userRepo;

  UserService(this._userRepo);

  Future<ApiResult<void>> submitUser(UserModel user) async {
    try {
      await _userRepo.submitUser(user);
      return ApiResult.success(null);
    } catch (error) {
      if (error is DioError && error.response?.statusCode == 422) {
        return ApiResult.failure(
          ApiErrorHandler.handle('يرجى التحقق من الحقول والمحاولة مرة أخرى.'),
        );
      }
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<UserResponse>> getUserByPhoneNumber(
    String phoneNumber,
  ) async {
    try {
      final response = await _userRepo.getUserByPhoneNumber(phoneNumber, 1, 1);

      return ApiResult.success(response);
    } catch (error) {
      userName = '';
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<UserResponse>> getUserId(String phoneNumber) async {
    try {
      final response = await _userRepo.getUserByPhoneNumber(phoneNumber, 1, 1);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<void>> updateUser(UserUpdateModel user) async {
    try {
      final response = await _userRepo.updateUser(user);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<void>> createUser(UserCreateModel user) async {
    try {
      await _userRepo.createUser(user);
      return ApiResult.success(null);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
