/// This file contains the API constants "directly related to DB" for the app
class ApiConstants {
  // Base URL
  static const String apiBaseUrl = "https://sayersa.systems/v1/";

  // Endpoints
  static const String brands = 'brand';
  static const String carOffer = 'car_offer';
  static const String car = '/car';
  static const String cars = '/cars';
  static const String favorite = "car_favorites";
  static const String genrateOtp = 'user/otp';
  static const String verifyOtp = 'user/auth';

  // Query Parameters
  static const String page = 'page';
  static const String pageSize = 'page_size';
  static const String dealership = 'dealership_id';
  static const String carId = 'car_id';
  static const String userId = 'user_id';
  static const String id = 'id';
}

class ApiErrors {
  // Common Error Types
  static const String badRequestError = "badRequestError"; // 400
  static const String noContent = "noContent"; // 204
  static const String forbiddenError = "forbiddenError"; // 403
  static const String unauthorizedError = "unauthorizedError"; // 401
  static const String notFoundError = "notFoundError"; // 404
  static const String conflictError = "conflictError"; // 409
  static const String internalServerError = "internalServerError"; // 500
  static const String unknownError = "unknownError";

  // Timeout & Connectivity Errors
  static const String timeoutError = "timeoutError";
  static const String noInternetError = "noInternetError";

  // Cache Errors
  static const String cacheError = "cacheError";

  // General Messages
  static const String defaultError = "defaultError";
  static const String loadingMessage = "loadingMessage";
  static const String retryAgainMessage = "retryAgainMessage";

  // Confirmation Messages
  static const String ok = "ok";
}
