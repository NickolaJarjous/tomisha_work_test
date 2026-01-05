import 'package:get/get.dart';
import 'package:tomisha_work_test/data/local/get_storage_helper.dart';

class AuthService extends GetxService {
  final token = RxnString();
  bool get isLoggedIn => (token.value ?? '').isNotEmpty;

  Future<AuthService> init() async {
    token.value = Get.find<GetStorageHelper>().authToken;
    return this;
  }

  void login(String t) => token.value = t;
  void logout() => token.value = null;
}
