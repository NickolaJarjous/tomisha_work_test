import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tomisha_work_test/configs/colors.dart';
import 'package:tomisha_work_test/configs/dimens.dart';
import 'package:tomisha_work_test/ui/widgets/static/app_label.dart';
import 'package:tomisha_work_test/ui/widgets/static/hover_text.dart';
import 'package:tomisha_work_test/ui/widgets/static/main_button.dart';
import 'package:tomisha_work_test/utils/ext.dart';

class AppBar extends GetResponsiveView {
  final RxBool showRegister;

  AppBar({super.key, required this.showRegister});

  @override
  Widget desktop() {
    return _build();
  }

  @override
  Widget phone() {
    return _build(isPhone: true);
  }

  Widget _build({bool isPhone = false}) => Column(
    children: [
      _gradient(),
      Container(
        width: Get.width,
        height: 62,
        padding: EdgeInsets.symmetric(horizontal: Dimens.horizontalPadding),
        decoration: BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(12)),
          boxShadow: [
            BoxShadow(
              color: Color(0xFFD6D6D6),
              offset: const Offset(0, 3),
              blurRadius: 6,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            isPhone
                ? SizedBox.shrink()
                : Obx(
                    () => AnimatedSwitcher(
                      duration: const Duration(milliseconds: 200),
                      switchInCurve: Curves.easeOut,
                      switchOutCurve: Curves.easeIn,
                      transitionBuilder: (child, anim) =>
                          FadeTransition(opacity: anim, child: child),
                      child: showRegister.isFalse
                          ? const SizedBox.shrink(key: ValueKey('hidden'))
                          : Row(
                              key: const ValueKey('visible'),
                              children: [
                                AppLabel(
                                  text: 'Jetzt Klicken',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 19,
                                ),
                                Dimens.width(20).pw,
                                MainButton(
                                  title: 'Kostenlos Registrieren',
                                  height: Dimens.height(40),
                                  width: Dimens.width(255),
                                ),
                                Dimens.width(20).pw,
                              ],
                            ),
                    ),
                  ),
            HoverText(text: 'Login', onTap: () {}).paddingOnly(top: 2),
          ],
        ),
      ),
    ],
  ).paddingOnly(bottom: 2);

  Widget _gradient() => Container(
    width: Get.width,
    height: Dimens.width(5),
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [AppColors.gradient1, AppColors.gradient2],
      ),
    ),
  );
}
