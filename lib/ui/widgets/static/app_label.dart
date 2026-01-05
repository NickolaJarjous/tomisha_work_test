import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tomisha_work_test/configs/dimens.dart';
import '../../../configs/colors.dart';

class AppLabel extends StatelessWidget {
  final String text;
  final Color? color;
  final double fontSize;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final int? maxLines;
  final TextDirection? textDirection;
  final TextDecoration? textDecoration;
  final Color? strokeColor;
  final double? strokeWidth;
  final TextOverflow? overflow;

  const AppLabel({
    super.key,
    required this.text,
    this.color,
    this.fontSize = 14,
    this.fontWeight = FontWeight.normal,
    this.textAlign = TextAlign.start,
    this.maxLines,
    this.textDirection,
    this.textDecoration,
    this.strokeColor,
    this.strokeWidth,
    this.overflow,
  });

  @override
  Widget build(BuildContext context) {
    return strokeColor == null
        ? Text(
            text,
            textDirection: textDirection,
            textAlign: textAlign,
            maxLines: maxLines,
            overflow: overflow,
            style: GoogleFonts.lato(
              color: color ?? AppColors.primaryText,
              fontSize: Dimens.font(fontSize),
              fontWeight: fontWeight,
              decoration: textDecoration ?? TextDecoration.none,
            ),
          )
        : Stack(
            children: [
              Text(
                text,
                textDirection: textDirection,
                textAlign: textAlign,
                maxLines: maxLines,
                overflow: overflow,
                style: GoogleFonts.lato(
                  fontSize: Dimens.font(fontSize),
                  fontWeight: fontWeight,
                  decoration: textDecoration ?? TextDecoration.none,
                  foreground: Paint()
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = strokeWidth ?? 1
                    ..color = strokeColor!,
                ),
              ),
              Text(
                text,
                textDirection: textDirection,
                textAlign: textAlign,
                maxLines: maxLines,
                overflow: overflow,
                style: GoogleFonts.lato(
                  color: color ?? AppColors.primaryText,
                  fontSize: Dimens.font(fontSize),
                  fontWeight: fontWeight,
                  decoration: textDecoration ?? TextDecoration.none,
                ),
              ),
            ],
          );
  }
}
