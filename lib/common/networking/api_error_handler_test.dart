import 'package:flutter_test/flutter_test.dart';
import 'package:dio/dio.dart';
import 'api_error_handler.dart';

void main() {
  group('ApiErrorHandler tests', () {
    test('should handle connection error', () {
      final dioException = DioException(
        requestOptions: RequestOptions(path: ''),
        type: DioExceptionType.connectionError,
      );

      final error = ApiErrorHandler.handle(dioException);

      expect(error.msg, 'خطأ في الاتصال، يرجى المحاولة مرة أخرى');
      expect(error.type, 'الاتصال');
    });

    test('should handle request cancel', () {
      final dioException = DioException(
        requestOptions: RequestOptions(path: ''),
        type: DioExceptionType.cancel,
      );

      final error = ApiErrorHandler.handle(dioException);

      expect(error.msg, 'تم إلغاء الطلب، يرجى إعادة المحاولة');
      expect(error.type, 'الطلب');
    });

    test('should handle send timeout', () {
      final dioException = DioException(
        requestOptions: RequestOptions(path: ''),
        type: DioExceptionType.sendTimeout,
      );

      final error = ApiErrorHandler.handle(dioException);

      expect(error.msg, 'انتهت مهلة الإرسال، يرجى المحاولة مرة أخرى');
      expect(error.type, 'الجلسة');
    });

    test('should handle receive timeout', () {
      final dioException = DioException(
        requestOptions: RequestOptions(path: ''),
        type: DioExceptionType.receiveTimeout,
      );

      final error = ApiErrorHandler.handle(dioException);

      expect(error.msg, 'انتهت مهلة الاستلام، يرجى المحاولة مرة أخرى');
      expect(error.type, 'الجلسة');
    });

    test('should handle unknown error', () {
      final dioException = DioException(
        requestOptions: RequestOptions(path: ''),
        type: DioExceptionType.unknown,
      );

      final error = ApiErrorHandler.handle(dioException);

      expect(error.msg, 'حدث خطأ غير معروف، يرجى المحاولة لاحقًا');
      expect(error.type, 'خطأ');
    });

    test('should handle bad response with error details', () {
      final dioException = DioException(
        requestOptions: RequestOptions(path: ''),
        response: Response(
          requestOptions: RequestOptions(path: ''),
          data: {'detail': 'Invalid request'},
        ),
        type: DioExceptionType.badResponse,
      );

      final error = ApiErrorHandler.handle(dioException);

      expect(error.msg, 'Invalid request');
      expect(error.type, 'خطأ');
    });

    test('should handle bad response with error details as a list', () {
      final dioException = DioException(
        requestOptions: RequestOptions(path: ''),
        response: Response(
          requestOptions: RequestOptions(path: ''),
          data: {
            'detail': [
              {
                'msg': 'Field is required',
                'loc': ['body', 'email'],
              },
            ],
          },
        ),
        type: DioExceptionType.badResponse,
      );

      final error = ApiErrorHandler.handle(dioException);

      expect(error.msg, 'Field is required');
      expect(error.loc?.first.key, 'body');
      expect(error.type, 'خطأ');
    });

    test('should handle non-Dio errors', () {
      final error = ApiErrorHandler.handle(Exception());

      expect(error.msg, 'حدث خطأ ما، يرجى المحاولة لاحقًا');
      expect(error.type, 'خطأ');
    });
  });
}
