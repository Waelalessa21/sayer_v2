import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'package:sayer_app/common/networking/api_constants.dart';
import 'package:sayer_app/common/data/leads/model/leades_model.dart';

part 'leads_repo.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class LeadRepo {
  factory LeadRepo(Dio dio, {String baseUrl}) = _LeadRepo;

  @POST("/lead")
  Future<void> submitLead(@Body() LeadesModelPOST lead);

  @GET("/lead")
  Future<LeadesModel> getLeadByPhoneNumber(
    @Query('phone') String phone, {
    @Query("page") int page = 1,
    @Query("page_size") int pageSize = 80,
  });

  @GET("/lead")
  Future<LeadesModel> getLeadByUserId(
    @Query('user_id') int userId, {
    @Query("page") int page = 1,
    @Query("page_size") int pageSize = 80,
  });
}
