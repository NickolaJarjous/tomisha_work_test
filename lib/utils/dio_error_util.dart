import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../configs/strings.dart';

class DioErrorUtil {
  static String handleError(DioException error) {
    String errorDescription = "";

    switch (error.type) {
      case DioExceptionType.cancel:
        errorDescription = Strings.requestToAPIServerWasCancelled.tr;
        break;
      case DioExceptionType.connectionTimeout:
        errorDescription = Strings.connectionTimeoutWithAPIServer.tr;
        break;
      case DioExceptionType.unknown:
        errorDescription =
            Strings.connectionToAPIServerFailedDueToInternetConnection.tr;
        break;
      case DioExceptionType.receiveTimeout:
        errorDescription = "Receive timeout in connection with API server";
        break;
      case DioExceptionType.badResponse:
        error.response!.statusCode == 500
            ? errorDescription = Strings.serverError.tr
            : errorDescription =
                "Received invalid status code: ${error.response!.statusCode}";
        break;
      case DioExceptionType.sendTimeout:
        errorDescription = "Send timeout in connection with API server";
        break;
      case DioExceptionType.badCertificate:
        errorDescription = "badCertificate";
        break;
      case DioExceptionType.connectionError:
        errorDescription = "connectionError";

        break;
    }

    return errorDescription;
  }
}
