import 'user_storage.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'constants/storages.dart';

class GetStorageHelper {
  final _getStorage = Get.find<GetStorage>();

  // // General Methods: ----------------------------------------------------------
  String get authToken {
    return _getStorage.read(Storages.authToken) ?? '';
  }

  void saveAuthToken(String authToken) {
    _getStorage.write(Storages.authToken, authToken);
  }

  void removeAuthToken() {
    _getStorage.remove(Storages.authToken);
  }

  bool get isLoggedIn {
    return authToken.isNotEmpty;
  }

  // App specific:-------------------------------------------------

  // Theme:------------------------------------------------------
  bool get isDarkMode {
    //return Get.isDarkMode;
    return _getStorage.read(Storages.isDarkMode) ?? true;
  }

  Future<void> changeBrightnessToDark(bool value) {
    return _getStorage.write(Storages.isDarkMode, value);
  }

  // Language:---------------------------------------------------
  String get currentLanguage {
    return _getStorage.read(Storages.currentLanguage) ?? 'en';
  }

  Future<void> changeLanguage(String language) {
    return _getStorage.write(Storages.currentLanguage, language);
  }

  bool get isRtl {
    return _getStorage.read(Storages.currentLanguage) == 'ar';
  }

  num get id {
    return _getStorage.read(UserStorages.id) ?? 0;
  }

  String get name {
    return _getStorage.read(UserStorages.name) ?? '';
  }

  String get phone {
    return _getStorage.read(UserStorages.phone) ?? '';
  }

  String get email {
    return _getStorage.read(UserStorages.email) ?? '';
  }

  String get baseUrl {
    return _getStorage.read(Storages.baseUrl) ?? 'https://kglam-app.kyveli.me/';
  }

  void saveBaseUrl(String baseUrl) {
    _getStorage.write(Storages.baseUrl, baseUrl);
  }

  void removeBaseUrl() {
    _getStorage.remove(Storages.baseUrl);
  }
}
