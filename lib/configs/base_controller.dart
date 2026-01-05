import 'package:get/get.dart';
import 'package:tomisha_work_test/routes/auth_service.dart';
import '../data/remote/repository.dart';

class BaseController extends GetxController {
  Repository repository = Get.find();

  final auth = Get.find<AuthService>();
}
