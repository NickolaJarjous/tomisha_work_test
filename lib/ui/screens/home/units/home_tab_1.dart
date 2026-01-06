import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tomisha_work_test/configs/colors.dart';
import 'package:tomisha_work_test/configs/dimens.dart';
import 'package:tomisha_work_test/configs/svg_assets.dart';
import 'package:tomisha_work_test/ui/widgets/slide_2_shapes.dart';
import 'package:tomisha_work_test/ui/widgets/static/app_label.dart';
import 'package:tomisha_work_test/utils/ext.dart';
import 'package:widget_arrows/arrows.dart';
import 'package:widget_arrows/widget_arrows.dart';

class HomeTab1 extends GetResponsiveView {
  HomeTab1({super.key});

  @override
  Widget desktop() {
    return ArrowContainer(
      child: Column(
        children: [
          Column(
            children: [
              SizedBox(
                width: Dimens.width(390),
                child: AppLabel(
                  text: 'Drei einfache Schritte zu deinem neuen Job',
                  fontSize: Dimens.font(38),
                  fontWeight: FontWeight.w500,
                  textAlign: TextAlign.center,
                ),
              ),
              90.ph,
              _Slide1(),
              Dimens.height(150).ph,
              _Slide2(),
              Dimens.height(150).ph,
              _Slide3(),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget phone() {
    return Column(
      children: [
        SizedBox(
          width: Get.width,
          child: AppLabel(
            text: 'Drei einfache Schritte zu deinem neuen Job',
            fontSize: Dimens.font(28),
            fontWeight: FontWeight.w500,
            textAlign: TextAlign.center,
          ),
        ).appPadding,
        _Slide1(),
        Dimens.height(40).ph,
        _Slide2(),
        Transform.translate(offset: Offset(0, 0), child: _Slide3()),
      ],
    );
  }
}

class _Slide1 extends GetResponsiveView {
  @override
  Widget desktop() {
    return Row(
      children: [
        Dimens.width(343).pw,
        Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              left: Dimens.width(46) * -1,
              bottom: -20,
              child: Container(
                width: Dimens.width(208),
                height: Dimens.width(208),
                decoration: BoxDecoration(
                  color: const Color(0xFFF7FAFC),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            ArrowElement(
              id: '1',
              targetId: '2',
              sourceAnchor: AlignmentGeometry.bottomLeft,
              color: AppColors.secondaryText,
              width: 1,
              bow: -0.2,
              padStart: 100,
              arcDirection: ArcDirection.Left,
              child: RichText(
                text: TextSpan(
                  text: '1.',
                  style: GoogleFonts.lato(
                    fontSize: Dimens.font(120),
                    color: Color(0xFF718096),
                  ),
                  children: [
                    WidgetSpan(child: Dimens.width(23).pw),
                    TextSpan(
                      text: 'Erstellen dein Lebenslauf',
                      style: GoogleFonts.lato(
                        fontSize: Dimens.font(28),
                        color: Color(0xFF718096),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Dimens.width(61).pw,
        SvgPicture.asset(
          SvgAssets.tab1Image1,
          width: Dimens.width(384.3),
          placeholderBuilder: (context) => Dimens.width(384.3).pw,
        ),
      ],
    );
  }

  @override
  Widget phone() {
    return SizedBox(
      width: Get.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Transform.translate(
            offset: Offset(Dimens.width(150), 40),
            child: SvgPicture.asset(
              SvgAssets.tab1Image1,
              width: Dimens.width(300),
              fit: BoxFit.fitWidth,
              placeholderBuilder: (context) => Dimens.width(300).pw,
            ),
          ),
          RichText(
            text: TextSpan(
              text: '1.',
              style: GoogleFonts.lato(
                fontSize: Dimens.font(120),
                color: Color(0xFF718096),
              ),
              children: [
                WidgetSpan(child: Dimens.width(23).pw),
                TextSpan(
                  text: 'Erstellen dein Lebenslauf',
                  style: GoogleFonts.lato(
                    fontSize: 16,
                    color: Color(0xFF718096),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Slide2 extends GetResponsiveView {
  @override
  Widget desktop() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned.fill(child: Slide2DesktopShape()),
        SizedBox(
          height: 370,
          child: Row(
            children: [
              Dimens.width(550).pw,
              SvgPicture.asset(
                SvgAssets.tab1Image2,
                width: Dimens.width(324.3),
                placeholderBuilder: (context) => Dimens.width(324.3).pw,
              ),
              Dimens.width(122.5).pw,
              ArrowElement(
                id: '2',
                targetId: '3',
                sourceAnchor: AlignmentGeometry.bottomCenter,
                color: AppColors.secondaryText,
                width: 1,
                bow: -0.2,
                padEnd: 100,
                arcDirection: ArcDirection.Left,
                child: RichText(
                  text: TextSpan(
                    text: '2.',
                    style: GoogleFonts.lato(
                      fontSize: Dimens.font(120),
                      color: Color(0xFF718096),
                    ),
                    children: [
                      WidgetSpan(child: Dimens.width(23).pw),
                      TextSpan(
                        text: 'Erstellen dein Lebenslauf',
                        style: GoogleFonts.lato(
                          fontSize: Dimens.font(28),
                          color: Color(0xFF718096),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget phone() {
    return Stack(
      children: [
        Positioned.fill(child: Slide2PhoneShape()),
        Container(
          width: Get.width,
          padding: const EdgeInsets.symmetric(vertical: 60),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  text: '2.',
                  style: GoogleFonts.lato(
                    fontSize: Dimens.font(120),
                    color: Color(0xFF718096),
                  ),
                  children: [
                    WidgetSpan(child: Dimens.width(23).pw),
                    TextSpan(
                      text: 'Erstellen dein Lebenslauf',
                      style: GoogleFonts.lato(
                        fontSize: Dimens.font(16),
                        color: Color(0xFF718096),
                      ),
                    ),
                  ],
                ),
              ).paddingOnly(left: 40),
              Center(
                child: SvgPicture.asset(
                  SvgAssets.tab1Image2,
                  width: Dimens.width(324.3),
                  placeholderBuilder: (context) => Dimens.width(324.3).pw,
                ),
              ).paddingOnly(bottom: 40),
            ],
          ),
        ),
      ],
    );
  }
}

class _Slide3 extends GetResponsiveView {
  @override
  Widget desktop() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Dimens.width(575).pw,
        Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              left: -80,
              top: -10,
              child: Container(
                width: Dimens.width(304),
                height: Dimens.width(304),
                decoration: BoxDecoration(
                  color: const Color(0xFFF7FAFC),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            ArrowElement(
              id: '3',
              child: RichText(
                text: TextSpan(
                  text: '3.',
                  style: GoogleFonts.lato(
                    fontSize: Dimens.font(120),
                    color: Color(0xFF718096),
                  ),
                  children: [
                    WidgetSpan(child: Dimens.width(23).pw),
                    WidgetSpan(
                      child: SizedBox(
                        width: Dimens.width(275),
                        child: AppLabel(
                          text: 'Mit nur einem Klick bewerben',
                          fontSize: Dimens.font(28),
                          color: Color(0xFF718096),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Dimens.width(27).pw,
        SvgPicture.asset(
          SvgAssets.tab1Image3,
          width: Dimens.width(502),
          placeholderBuilder: (context) => Dimens.width(502).pw,
        ),
      ],
    );
  }

  @override
  Widget phone() {
    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              left: -80,
              top: -10,
              child: Container(
                width: Dimens.width(350),
                height: Dimens.width(350),
                decoration: BoxDecoration(
                  color: const Color(0xFFF7FAFC),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            RichText(
              text: TextSpan(
                text: '3.',
                style: GoogleFonts.lato(
                  fontSize: Dimens.font(120),
                  color: Color(0xFF718096),
                ),
                children: [
                  WidgetSpan(child: Dimens.width(23).pw),
                  WidgetSpan(
                    child: SizedBox(
                      width: Dimens.width(240),
                      child: AppLabel(
                        text: 'Mit nur einem Klick bewerben',
                        fontSize: Dimens.font(18),
                        color: Color(0xFF718096),
                      ),
                    ).paddingOnly(bottom: 40),
                  ),
                ],
              ),
            ).paddingOnly(left: 40),
          ],
        ),
        Transform.translate(
          offset: const Offset(0, -40),
          child: SvgPicture.asset(
            SvgAssets.tab1Image3,
            width: Get.width * .8,
            fit: BoxFit.contain,
            placeholderBuilder: (context) => (Get.width * .8).pw,
          ).paddingOnly(left: 20),
        ),
      ],
    );
  }
}
