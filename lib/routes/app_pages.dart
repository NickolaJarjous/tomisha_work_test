import 'package:get/get.dart';
import 'package:tomisha_work_test/ui/screens/home/home_page.dart';

abstract class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: HomePage.route,
      page: () => HomePage(),
      transition: Transition.noTransition,
    ),
  ];
}
