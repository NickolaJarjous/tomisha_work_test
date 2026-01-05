import 'package:get/get.dart';
import 'package:tomisha_work_test/data/models/api_response.dart';
import 'package:tomisha_work_test/data/remote/repository.dart';
import 'api/app_api.dart';

class RepositoryImp implements Repository {
  AppApi appApi = Get.find();

  @override
  Future<ApiResponse<dynamic>> test() => appApi.test();
}
