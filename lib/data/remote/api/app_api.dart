import 'package:get/get.dart';
import 'package:tomisha_work_test/data/models/api_response.dart';
import 'package:tomisha_work_test/data/remote/api/dio_client.dart';

class AppApi {
  final DioClient _dioClient = Get.find();

  Future<ApiResponse<dynamic>> test() async {
    final res = await _dioClient.post(
      'api/test',
    );
    return ApiResponse.fromJson(res, (dynamic x) => x);
  }
}
