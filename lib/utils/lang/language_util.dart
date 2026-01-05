import 'package:get/get.dart';
import '../../data/local/get_storage_helper.dart';
import '../../data/models/language.dart';

class LanguageUtil {

  static Language getCurrentLanguage() {
    String code = Get.find<GetStorageHelper>().currentLanguage;
    switch (code) {
      case 'ar':
        return Language.getArabic();
      default:
        return Language.getEnglish();
    }
  }
}