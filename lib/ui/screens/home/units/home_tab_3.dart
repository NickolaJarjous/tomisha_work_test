import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tomisha_work_test/configs/dimens.dart';
import 'package:tomisha_work_test/configs/svg_assets.dart';
import 'package:tomisha_work_test/ui/widgets/slide_2_shapes.dart';
import 'package:tomisha_work_test/ui/widgets/static/app_label.dart';
import 'package:tomisha_work_test/utils/ext.dart';

class HomeTab3 extends GetResponsiveView {
  HomeTab3({super.key});

  @override
  Widget desktop() {
    return Column(
      children: [
        SizedBox(
          width: Dimens.width(530),
          child: AppLabel(
            text: 'Drei einfache Schritte zur Vermittlung neuer Mitarbeiter',
            fontSize: Dimens.font(38),
            fontWeight: FontWeight.w500,
            textAlign: TextAlign.center,
          ),
        ),
        90.ph,
        _Slide1(),
        Dimens.height(200).ph,
        _Slide2(),
        Dimens.height(200).ph,
        _Slide3(),
      ],
    );
  }

  @override
  Widget phone() {
    return Column(
      children: [
        SizedBox(
          width: Get.width,
          child: AppLabel(
            text: 'Drei einfache Schritte zur Vermittlung neuer Mitarbeiter',
            fontSize: Dimens.font(28),
            fontWeight: FontWeight.w500,
            textAlign: TextAlign.center,
          ),
        ).appPadding,
        _Slide1(),
        Dimens.height(40).ph,
        _Slide2(),
        Transform.translate(offset: Offset(0, -20), child: _Slide3()),
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
                    text: 'Erstellen dein Unternehmensprofil',
                    style: GoogleFonts.lato(
                      fontSize: Dimens.font(28),
                      color: Color(0xFF718096),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Dimens.width(61).pw,
        SvgPicture.asset(SvgAssets.tab1Image1, width: Dimens.width(384.3)),
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
                  text: 'Erstellen dein Unternehmensprofil',
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
                SvgAssets.tab3Image1,
                width: Dimens.width(324.3),
              ),
              Dimens.width(122.5).pw,
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
                      text: 'Erhalte Vermittlungs- angebot von Arbeitgeber',
                      style: GoogleFonts.lato(
                        fontSize: Dimens.font(28),
                        color: Color(0xFF718096),
                      ),
                    ),
                  ],
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
                      text: 'Erhalte Vermittlungs- angebot von Arbeitgeber',
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
                  SvgAssets.tab3Image1,
                  width: Dimens.width(324.3),
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
                      width: Dimens.width(275),
                      child: AppLabel(
                        text: 'Vermittlung nach Provision oder Stundenlohn',
                        fontSize: Dimens.font(28),
                        color: Color(0xFF718096),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Dimens.width(27).pw,
        SvgPicture.asset(SvgAssets.tab3Image2, width: Dimens.width(502)),
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
                        text: 'Vermittlung nach Provision oder Stundenlohn',
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
          offset: const Offset(0, 20),
          child: SvgPicture.asset(
            SvgAssets.tab3Image2,
            width: Get.width * .8,
            fit: BoxFit.contain,
          ).paddingOnly(left: 20),
        ),
      ],
    );
  }
}
