import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:sayer_app/common/data/user/model/user_model.dart';
import 'package:sayer_app/common/networking/api_constants.dart';

part 'user_repo.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class UserRepo {
  factory UserRepo(Dio dio, {String baseUrl}) = _UserRepo;

  @PUT("/user")
  Future<void> submitUser(@Body() UserModel user);

  @GET("user")
  Future<UserResponse> getUserByPhoneNumber(
    @Query("phone_number") String phoneNumber,
    @Query("page") int page,
    @Query("page_size") int pageSize,
  );

  @POST("/user")
  Future<void> createUser(@Body() UserCreateModel user);

  @PUT("/user")
  Future<void> updateUser(@Body() UserUpdateModel user);
}
