// import 'package:get/get.dart';
// import 'package:kglam/configs/base_controller.dart';
// import 'package:kglam/data/data_source/data_source.dart';
// import 'package:kglam/data/local/get_storage_helper.dart';
// import 'package:kglam/data/models/api_response.dart';
// import 'package:kglam/data/models/login_response.dart';
// import 'package:kglam/utils/notifications_util.dart';

// class AuthDataSource extends DataSource {
//   checkIfAccountExists({
//     required Rx<ApiResponse<bool>> response,
//     required String email,
//     Function(ApiResponse<bool>)? onSuccess,
//     Function(String)? onError,
//   }) async {
//     response.value = ApiResponse<bool>.loading('');
//     try {
//       var res = await repository.checkIfAccountExists(email: email);
//       if (onSuccess != null) {
//         onSuccess(res);
//       }
//       response.value = res;
//     } catch (error) {
//       var message = getErrorMessage(error: error);
//       response.value = ApiResponse.error(message);
//       if (onError != null) {
//         onError(message);
//       }
//     }
//   }

//   login({
//     required Rx<ApiResponse<LoginResponse>> response,
//     required String email,
//     required String password,
//     Function(ApiResponse<LoginResponse>)? onSuccess,
//     Function(String)? onError,
//   }) async {
//     response.value = ApiResponse<LoginResponse>.loading('');
//     try {
//       var fcmToken = await NotificationsUtil.getNotificationsToken();
//       var res = await repository.login(
//         email: email,
//         password: password,
//         notificationToken: fcmToken ?? "emulator",
//       );
//       Get.find<GetStorageHelper>().saveUser(res.data!.user!);
//       Get.find<GetStorageHelper>().saveAuthToken(res.data!.token!);
//       if (res.data!.cartUuid != null) {
//         Get.find<GetStorageHelper>().saveCartUuid(res.data!.cartUuid!);
//       }
//       Get.find<BaseController>().postLoggedIn();
//       if (onSuccess != null) {
//         onSuccess(res);
//       }
//       response.value = res;
//     } catch (error) {
//       var message = getErrorMessage(error: error);
//       response.value = ApiResponse.error(message);
//       if (onError != null) {
//         onError(message);
//       }
//     }
//   }
// }
