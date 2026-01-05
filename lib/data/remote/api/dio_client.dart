import 'package:dio/dio.dart';
import 'package:get/get.dart';

class DioClient {
  // dio instance
  final Dio _dio = Get.find<Dio>();

  // Get:-----------------------------------------------------------------------
  Future<dynamic> get(
    String uri, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await _dio.get(
        uri,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response.data;
    } catch (e) {
      if (_isSessionExpired(e)) {
        //  Get.find<GetStorageHelper>().removeUser();
        // Get.offAllNamed(SplashPage.route);
        return;
      }
      rethrow;
    }
  }

  // Post:----------------------------------------------------------------------
  Future<dynamic> post(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await _dio.post(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response.data;
    } catch (e) {
      if (_isSessionExpired(e)) {
        // Get.find<GetStorageHelper>().removeUser();
        // Get.offAllNamed(SplashPage.route);
        return;
      }
      rethrow;
    }
  }

  // put:----------------------------------------------------------------------
  Future<dynamic> put(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await _dio.put(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response.data;
    } catch (e) {
      if (_isSessionExpired(e)) {
        // Get.find<GetStorageHelper>().removeUser();
        // Get.offAllNamed(SplashPage.route);
        return;
      }
      rethrow;
    }
  }

  // Delete:----------------------------------------------------------------------
  Future<dynamic> delete(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _dio.delete(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response.data;
    } catch (e) {
      if (_isSessionExpired(e)) {
        // Get.find<GetStorageHelper>().removeUser();
        // Get.offAllNamed(SplashPage.route);
        return;
      }
      rethrow;
    }
  }

  bool _isSessionExpired(dynamic e) {
    return e is DioException && e.response!.statusCode == 401;
  }
}
