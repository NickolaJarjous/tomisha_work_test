import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tomisha_work_test/configs/dimens.dart';
import 'dart:math' as math;

import 'package:tomisha_work_test/configs/svg_assets.dart';
import 'package:tomisha_work_test/ui/widgets/banner_bottom_right_shape.dart';
import 'package:tomisha_work_test/ui/widgets/static/app_label.dart';
import 'package:tomisha_work_test/ui/widgets/static/gradient_button.dart';
import 'package:tomisha_work_test/utils/ext.dart';

class HomeBanner extends GetResponsiveView {
  HomeBanner({super.key});

  @override
  Widget desktop() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: Get.width,
          height: Dimens.width(590),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFEBF4FF), Color(0xFFE6FFFA)],
              transform: GradientRotation(102 * math.pi / 180),
            ),
          ),
        ),
        Positioned.fill(child: BannerBottomRightShape(opacity: 1.0)),
        Positioned(
          right: Dimens.width(620),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: Dimens.width(320),
                child: Column(
                  children: [
                    AppLabel(
                      text: 'Define Job website',
                      fontSize: Dimens.font(62),
                      fontWeight: FontWeight.bold,
                    ),
                    Dimens.height(65).ph,
                    GradientButton(
                      text: 'Kostenlos Registrieren',
                      onTap: () {},
                    ),
                  ],
                ),
              ),
              Dimens.width(151).pw,
              _Image(),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget tablet() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: Get.width,
          height: Dimens.width(400),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFEBF4FF), Color(0xFFE6FFFA)],
              transform: GradientRotation(102 * math.pi / 180),
            ),
          ),
        ),
        Positioned.fill(child: BannerBottomRightShape(opacity: 1.0)),
        Positioned(
          right: Dimens.width(300),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: Dimens.width(200),
                child: Column(
                  children: [
                    AppLabel(
                      text: 'Define Job website',
                      fontSize: Dimens.font(40),
                      fontWeight: FontWeight.bold,
                    ),
                    Dimens.height(65).ph,
                    GradientButton(
                      text: 'Kostenlos Registrieren',
                      onTap: () {},
                    ),
                  ],
                ),
              ),
              Dimens.width(120).pw,
              _Image(),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget phone() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: Get.width,
          height: Dimens.width(650),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFEBF4FF), Color(0xFFE6FFFA)],
              transform: GradientRotation(102 * math.pi / 180),
            ),
          ),
        ),
        Positioned.fill(child: BannerBottomRightShape(opacity: 1.0)),
        Positioned(
          child: Column(
            children: [
              SizedBox(
                width: Dimens.width(320),
                child: AppLabel(
                  text: 'Define Job website',
                  fontSize: Dimens.font(42),
                  fontWeight: FontWeight.w500,
                  textAlign: TextAlign.center,
                ),
              ),
              30.ph,
              _Image(),
            ],
          ),
        ),
      ],
    );
  }
}

class _Image extends GetResponsiveView {
  _Image();

  @override
  Widget desktop() {
    return Container(
      width: Dimens.width(455),
      height: Dimens.width(455),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
      child: SvgPicture.asset(
        SvgAssets.homeBanner,
        width: Get.width,
        height: Get.height,
      ),
    );
  }

  @override
  Widget tablet() {
    return Container(
      width: Dimens.width(300),
      height: Dimens.width(300),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
      child: SvgPicture.asset(
        SvgAssets.homeBanner,
        width: Get.width,
        height: Get.height,
      ),
    );
  }

  @override
  Widget phone() {
    return SvgPicture.asset(
      SvgAssets.homeBanner,
      width: Get.width,
      height: Dimens.width(400),
      fit: BoxFit.fitHeight,
    );
  }
}
