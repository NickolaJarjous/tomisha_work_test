import 'package:tomisha_work_test/data/models/api_response.dart';

abstract class Repository {
  Future<ApiResponse<dynamic>> test();
}
