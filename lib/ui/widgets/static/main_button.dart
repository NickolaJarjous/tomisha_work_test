import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hovering/hovering.dart';

import '../../../configs/colors.dart';
import '../../../configs/dimens.dart';
import 'app_label.dart';

class MainButton extends GetResponsiveView {
  final Color? color;
  final String? title;
  final Color? textColor;
  final double? width;
  final double? height;
  final Function? onTap;
  final bool isLoading;

  MainButton({
    super.key,
    this.color,
    this.title,
    this.textColor,
    this.width,
    this.height,
    this.onTap,
    this.isLoading = false,
  });

  @override
  Widget desktop() {
    return isLoading == true
        ? Container(
            width: width ?? Get.width,
            height: Dimens.appButtonHeight,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xFFCBD5E0), width: 1),
            ),
            child: Center(
              child: SizedBox(
                width: (height ?? Dimens.appButtonHeight) - 15,
                height: (height ?? Dimens.appButtonHeight) - 15,
                child: const CircularProgressIndicator(color: Colors.white),
              ),
            ),
          )
        : InkWell(
            onTap: () {
              if (onTap != null) {
                onTap!();
              }
            },
            mouseCursor: SystemMouseCursors.click,
            child: HoverWidget(
              hoverChild: _buildDesktop(bgColor: Color(0xFFE6FFFA)),
              child: _buildDesktop(bgColor: Colors.transparent),
              onHover: (event) {},
            ),
          );
  }

  Widget _buildDesktop({required Color bgColor}) {
    return Container(
      width: width ?? Get.width,
      height: height ?? Dimens.appButtonHeight,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFCBD5E0), width: 1),
      ),
      child: Center(
        child: AppLabel(
          text: title!,
          color: textColor ?? AppColors.gradient1,
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
