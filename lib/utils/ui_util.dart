import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tomisha_work_test/configs/colors.dart';
import 'package:tomisha_work_test/ui/widgets/static/app_label.dart';
import 'package:tomisha_work_test/ui/widgets/static/main_button.dart';

import '../configs/assets.dart';
import '../configs/dimens.dart';

class UiUtil {
  static Widget getBackButton({Color? color, Function? onTap}) {
    return InkWell(
      onTap: () {
        if (onTap != null) {
          onTap();
        } else {
          Get.back();
        }
      },
      child: Icon(
        Icons.arrow_back_ios,
        color: color ?? AppColors.primaryText,
        size: 27,
      ),
    );
  }

  static void showError({
    required String message,
    bool isDialog = false,
    Function? callback,
  }) {
    if (isDialog) {
      Get.dialog(
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: Get.width - 2 * Dimens.horizontalPadding,
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                children: [
                  AppLabel(text: message),
                  const SizedBox(height: 20),
                  MainButton(
                    title: "OK",
                    onTap: () {
                      if (Get.isDialogOpen == true) {
                        Navigator.pop(Get.context!);
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      );
      return;
    }
    Get.snackbar(
      message,
      '',
      backgroundColor: Colors.black.withValues(alpha: 0.5),
      duration: const Duration(seconds: 1),
    );
    callback ?? ();
  }

  static void showSuccess({required String message, Function? callback}) {
    Get.snackbar(
      message,
      '',
      backgroundColor: Colors.black.withValues(alpha: 0.5),
      duration: const Duration(seconds: 1),
    );
    callback ?? ();
  }

  static Widget get logo =>
      SvgPicture.asset(Assets.logo, height: 30, fit: BoxFit.contain);

  static TextStyle dropDownTextStyle = const TextStyle(
    fontFamily: 'AVG',
    color: Colors.black,
    fontSize: 14,
    fontWeight: FontWeight.normal,
  );

  static TextStyle dropdownHintStyle = TextStyle(
    fontFamily: 'AVG',
    color: AppColors.secondaryText,
    fontSize: 14,
    fontWeight: FontWeight.normal,
  );

  static Widget errorImage({double width = 40, double height = 40}) =>
      Image.asset(
        Assets.error,
        width: width,
        height: height,
        fit: BoxFit.cover,
      );

  static Widget empty() => SizedBox(
    height: 300,
    child: Column(
      children: [
        // Lottie.asset(Assets.empty, width: 200, height: 200, fit: BoxFit.fill),
        AppLabel(text: "No data", fontSize: 18, fontWeight: FontWeight.bold),
      ],
    ),
  );
}
