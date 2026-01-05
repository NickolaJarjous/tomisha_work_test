import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hovering/hovering.dart';
import 'package:tomisha_work_test/configs/colors.dart';
import 'package:tomisha_work_test/ui/widgets/static/app_label.dart';

class GradientButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final double? height;
  final Color? textColor;
  final Color? color1;
  final Color? color2;
  final double? borderRadius;

  const GradientButton({
    super.key,
    required this.text,
    required this.onTap,
    this.height,
    this.textColor,
    this.color1,
    this.color2,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: Get.width,
        height: height ?? 35,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius ?? 12),
          gradient: LinearGradient(
            colors: [
              color1 ?? AppColors.gradient1,
              color2 ?? AppColors.gradient2,
            ],
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            HoverWidget(
              hoverChild: Container(
                width: Get.width,
                height: Get.height,
                color: Colors.black26,
              ),
              onHover: (event) {},
              child: SizedBox(
                width: Get.width,
                height: Get.height,
              ),
            ),
            AppLabel(text: text, color: textColor ?? Color(0xFFE6FFFA)),
          ],
        ),
      ),
    );
  }
}
