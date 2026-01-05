import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hovering/hovering.dart';
import 'package:tomisha_work_test/configs/colors.dart';
import 'package:tomisha_work_test/ui/widgets/static/app_label.dart';

class ItemTab extends StatelessWidget {
  final String text;
  final bool isSelected;
  final ItemTabPosition position;
  final VoidCallback onTap;

  const ItemTab({
    super.key,
    required this.text,
    required this.position,
    required this.onTap,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      mouseCursor: SystemMouseCursors.click,
      child: HoverWidget(
        hoverChild: _build(bgColor: Color(0xFFE6FFFA)),
        onHover: (event) {},
        child: _build(bgColor: Colors.white),
      ),
    );
  }

  Widget _build({required Color bgColor}) => Container(
    width: Get.width,
    height: 35,
    alignment: Alignment.center,
    decoration: BoxDecoration(
      color: isSelected ? AppColors.primary : bgColor,
      border: Border.all(color: Color(0xFFCBD5E0), width: 1),
      borderRadius: _borderRadius(),
    ),
    child: AppLabel(
      text: text,
      color: isSelected ? Color(0xFFE6FFFA) : AppColors.gradient1,
      fontWeight: FontWeight.w600,
    ),
  );

  BorderRadiusGeometry? _borderRadius() => switch (position) {
    ItemTabPosition.first => BorderRadius.horizontal(left: Radius.circular(12)),
    ItemTabPosition.mid => null,
    ItemTabPosition.last => BorderRadius.horizontal(right: Radius.circular(12)),
  };
}

enum ItemTabPosition { first, last, mid }
