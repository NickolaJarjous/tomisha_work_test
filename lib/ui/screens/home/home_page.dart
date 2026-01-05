import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tomisha_work_test/configs/colors.dart';
import 'package:tomisha_work_test/configs/dimens.dart';
import 'package:tomisha_work_test/ui/screens/home/home_controller.dart';
import 'package:tomisha_work_test/ui/screens/home/units/home_banner.dart';
import 'package:tomisha_work_test/ui/screens/home/units/home_tabs.dart';
import 'package:tomisha_work_test/ui/widgets/static/gradient_button.dart';
import '../../widgets/static/app_bar.dart' as ab;

class HomePage extends GetResponsiveView<HomeController> {
  static const String route = '/';

  HomePage({super.key});

  @override
  Widget desktop() {
    return Scaffold(
      body: SizedBox(
        width: Get.width,
        height: Get.height,
        child: Column(
          children: [
            ab.AppBar(showRegister: controller.showRegister),
            Expanded(
              child: SingleChildScrollView(
                controller: controller.scrollController,
                child: Column(
                  children: [
                    HomeBanner(),
                    HomeTabs(),
                    Container(height: 200, color: Colors.white),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget phone() {
    return Scaffold(
      body: SizedBox(
        width: Get.width,
        height: Get.height,
        child: Column(
          children: [
            ab.AppBar(showRegister: controller.showRegister),
            Expanded(
              child: SingleChildScrollView(
                controller: controller.scrollController,
                physics: const ClampingScrollPhysics(),
                child: Column(
                  children: [
                    HomeBanner(),
                    HomeTabs(),
                    Container(height: 40, color: Colors.white),
                  ],
                ),
              ),
            ),
            Container(
              width: Get.width,
              height: Dimens.width(128),
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(
                horizontal: Dimens.horizontalPadding,
              ),
              decoration: BoxDecoration(
                color: AppColors.background,
                borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFFD6D6D6),
                    offset: const Offset(0, -3),
                    blurRadius: 6,
                  ),
                ],
              ),
              child: GradientButton(
                text: 'Kostenlos Registrieren',
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
