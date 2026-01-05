import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tomisha_work_test/routes/app_pages.dart';
import 'package:tomisha_work_test/ui/screens/home/home_page.dart';
import 'package:tomisha_work_test/utils/lang/translation.dart';

import 'configs/app_theme.dart';
import 'data/local/get_storage_helper.dart';
import 'di/app_bindings.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(
            context,
          ).copyWith(textScaler: const TextScaler.linear(1)),
          child: child!,
        );
      },
      title: 'Tomisha Work',
      translations: TranslationPage(),
      fallbackLocale: const Locale('en'),
      locale: Locale(Get.find<GetStorageHelper>().currentLanguage),
      theme: Get.find<GetStorageHelper>().isDarkMode
          ? ThemesData.darkTheme
          : ThemesData.lightTheme,
      home: HomePage(),
      initialRoute: HomePage.route,
      getPages: AppPages.pages,
      binds: AppBinding().dependencies(),
    );
  }
}
