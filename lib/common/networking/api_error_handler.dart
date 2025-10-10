import 'package:dio/dio.dart';
import 'api_error_model.dart';
import '../helpers/error_codes.dart';

class ApiErrorHandler {
  /// Handles API errors and maps them to appropriate error messages
  static ApiErrorModel handle(dynamic error) {
    if (error is DioException) {
      // Handle Dio-specific errors
      switch (error.type) {
        case DioExceptionType.connectionError:
          return ApiErrorModel(
            msg: ErrorCodes.getErrorMessage(301),
            type: 'الاتصال',
          );
        case DioExceptionType.cancel:
          return ApiErrorModel(
            msg: ErrorCodes.getErrorMessage(302),
            type: 'الطلب',
          );
        case DioExceptionType.sendTimeout:
          return ApiErrorModel(
            msg: ErrorCodes.getErrorMessage(303),
            type: 'الجلسة',
          );
        case DioExceptionType.receiveTimeout:
          return ApiErrorModel(
            msg: ErrorCodes.getErrorMessage(304),
            type: 'الجلسة',
          );
        case DioExceptionType.badResponse:
          return _handleError(error);
        case DioExceptionType.unknown:
        default:
          return ApiErrorModel(
            msg: ErrorCodes.getErrorMessage(999),
            type: 'خطأ',
          );
      }
    } else {
      return ApiErrorModel(msg: ErrorCodes.getErrorMessage(999), type: 'خطأ');
    }
  }

  static ApiErrorModel _handleError(DioException error) {
    String? message;
    List<String>? loc;

    if (error.response?.data is Map<String, dynamic>) {
      final data = error.response?.data as Map<String, dynamic>;

      if (data['detail'] is String) {
        message = data['detail'] as String;
        loc = ['response'];
      } else if (data['detail'] is List<dynamic>) {
        final detailList = data['detail'] as List<dynamic>;
        if (detailList.isNotEmpty) {
          final detail = detailList.first as Map<String, dynamic>;
          message = detail['msg'] as String?;
          loc = (detail['loc'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList();
        }
      }
    }

    return ApiErrorModel(
      loc: loc?.map((e) => Loc(key: e)).toList(),
      msg: message ?? ErrorCodes.getErrorMessage(999),
      type: 'خطأ',
    );
  }
}
