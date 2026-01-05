import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:tomisha_work_test/routes/auth_service.dart';
import 'package:tomisha_work_test/ui/screens/home/home_controller.dart';
import '../configs/base_controller.dart';
import '../data/local/get_storage_helper.dart';
import '../data/remote/api/app_api.dart';
import '../data/remote/api/dio_client.dart';
import '../data/remote/constants/endpoints.dart';
import '../data/remote/repository.dart';
import '../data/remote/repository_impl.dart';

class AppBinding extends Binding {
  @override
  dependencies() {
    return [
      Bind.lazyPut(
        () =>
            Dio(
                BaseOptions(
                  baseUrl: EndPoints.baseUrl,
                  receiveTimeout: EndPoints.receiveTimeout,
                  connectTimeout: EndPoints.connectionTimeout,
                ),
              )
              ..interceptors.add(
                LogInterceptor(
                  error: true,
                  request: true,
                  responseBody: true,
                  requestBody: true,
                  requestHeader: true,
                ),
              )
              ..interceptors.add(
                InterceptorsWrapper(
                  onRequest: (options, handler) async {
                    options.baseUrl = Get.find<GetStorageHelper>().baseUrl;
                    return handler.next(options);
                  },
                ),
              )
              ..interceptors.add(
                InterceptorsWrapper(
                  onRequest: (options, handler) async {
                    var token = Get.find<GetStorageHelper>().authToken;
                    if (token != '') {
                      debugPrint("BEARER TOKEN IS $token");
                      options.headers['Authorization'] = 'Bearer $token';
                      options.headers['Customer-Id'] =
                          Get.find<GetStorageHelper>().id;
                      return handler.next(options);
                    }
                  },
                ),
              ),
        fenix: true,
      ),
      Bind.put(AuthService(), permanent: true)..init?.call(),
      Bind.lazyPut<Repository>(() => RepositoryImp(), fenix: true),
      Bind.lazyPut(() => AppApi(), fenix: true),
      Bind.lazyPut(() => DioClient(), fenix: true),
      Bind.lazyPut(() => BaseController(), fenix: true),
      Bind.lazyPut(() => HomeController(), fenix: true),
    ];
  }
}
