import 'package:flutter/material.dart';
import 'package:hovering/hovering.dart';
import 'package:tomisha_work_test/ui/widgets/static/app_label.dart';

class HoverText extends StatelessWidget {
  final String text;
  final Color? textColor;
  final Color? textHoverColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final VoidCallback? onTap;

  const HoverText({
    super.key,
    required this.text,
    this.textColor,
    this.textHoverColor,
    this.fontSize,
    this.fontWeight,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      mouseCursor: SystemMouseCursors.click,
      child: HoverCrossFadeWidget(
        firstChild: Container(
          padding: const EdgeInsets.only(bottom: 1),
          child: AppLabel(
            text: text,
            color: textColor ?? Color(0xFF38B2AC),
            fontSize: fontSize ?? 14,
            fontWeight: fontWeight ?? FontWeight.normal,
          ),
        ),
        secondChild: Container(
          padding: const EdgeInsets.only(bottom: 1),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: textHoverColor ?? Color(0xFE38B2AC),
                width: 1.0, // This would be the width of the underline
              ),
            ),
          ),
          child: AppLabel(
            text: text,
            color: textHoverColor ?? Color(0xFE38B2AC),
            fontSize: fontSize ?? 14,
            fontWeight: fontWeight ?? FontWeight.normal,
          ),
        ),
        duration: const Duration(milliseconds: 50),
      ),
    );
  }
}
