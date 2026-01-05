import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tomisha_work_test/configs/dimens.dart';
import 'package:tomisha_work_test/ui/screens/home/home_controller.dart';
import 'package:tomisha_work_test/ui/screens/home/items/item_tab.dart';
import 'package:tomisha_work_test/ui/screens/home/units/home_tab_1.dart';
import 'package:tomisha_work_test/ui/screens/home/units/home_tab_2.dart';
import 'package:tomisha_work_test/ui/screens/home/units/home_tab_3.dart';
import 'package:tomisha_work_test/utils/ext.dart';

class HomeTabs extends GetResponsiveView<HomeController> {
  HomeTabs({super.key});

  @override
  Widget desktop() {
    return Container(
      width: Get.width,
      color: Colors.white,
      padding: EdgeInsets.only(top: Dimens.height(35)),
      child: Column(
        children: [
          _HomeTabsSwitcher(),
          Dimens.height(55).ph,
          SizedBox(
            height: 1700,
            child: Obx(
              () => AnimatedSwitcher(
                duration: const Duration(milliseconds: 250),
                switchInCurve: Curves.easeOut,
                switchOutCurve: Curves.easeIn,
                transitionBuilder: (child, anim) =>
                    FadeTransition(opacity: anim, child: child),
                child: controller.selectedTabIndex.value == 0
                    ? HomeTab1(key: ValueKey<int>(0))
                    : controller.selectedTabIndex.value == 1
                    ? HomeTab2(key: ValueKey<int>(1))
                    : HomeTab3(key: ValueKey<int>(2)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget phone() {
    return Container(
      width: Get.width,
      color: Colors.white,
      padding: EdgeInsets.only(top: Dimens.height(35)),
      child: Column(
        children: [
          _HomeTabsSwitcher(),
          Dimens.height(55).ph,
          SizedBox(
            height: 1400,
            child: Obx(
              () => AnimatedSwitcher(
                duration: const Duration(milliseconds: 250),
                switchInCurve: Curves.easeOut,
                switchOutCurve: Curves.easeIn,
                transitionBuilder: (child, anim) =>
                    FadeTransition(opacity: anim, child: child),
                child: controller.selectedTabIndex.value == 0
                    ? HomeTab1(key: ValueKey<int>(0))
                    : controller.selectedTabIndex.value == 1
                    ? HomeTab2(key: ValueKey<int>(1))
                    : HomeTab3(key: ValueKey<int>(2)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _HomeTabsSwitcher extends StatefulWidget {
  const _HomeTabsSwitcher();

  @override
  State<_HomeTabsSwitcher> createState() => _HomeTabsSwitcherState();
}

class _HomeTabsSwitcherState extends State<_HomeTabsSwitcher> {
  final ScrollController _scrollController = ScrollController();
  final HomeController _controller = Get.find<HomeController>();

  void _onTap(int index) {
    _controller.selectedTabIndex.value = index;
    _scrollToIndex(index);
  }

  void _scrollToIndex(int index) {
    final itemWidth = Dimens.width(200);
    final maxExtent = _scrollController.hasClients
        ? _scrollController.position.maxScrollExtent
        : 0.0;
    final target = (index * itemWidth).clamp(0.0, maxExtent);

    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        target,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      WidgetsBinding.instance.addPostFrameCallback(
        (_) => _scrollToIndex(index),
      );
    }
  }

  Widget _desktop() {
    return Obx(
      () => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: Dimens.width(160),
            child: ItemTab(
              text: 'Arbeitnehmer',
              position: ItemTabPosition.first,
              isSelected: _controller.selectedTabIndex.value == 0,
              onTap: () => _onTap(0),
            ),
          ),
          SizedBox(
            width: Dimens.width(160),
            child: ItemTab(
              text: 'Arbeitgeber',
              position: ItemTabPosition.mid,
              isSelected: _controller.selectedTabIndex.value == 1,
              onTap: () => _onTap(1),
            ),
          ),
          SizedBox(
            width: Dimens.width(160),
            child: ItemTab(
              text: 'Temporärbüro',
              position: ItemTabPosition.last,
              isSelected: _controller.selectedTabIndex.value == 2,
              onTap: () => _onTap(2),
            ),
          ),
        ],
      ),
    );
  }

  Widget _phone() {
    return Obx(
      () => SizedBox(
        height: 40,
        child: ListView(
          controller: _scrollController,
          scrollDirection: Axis.horizontal,
          children: [
            SizedBox(
              width: Dimens.width(200),
              child: ItemTab(
                text: 'Arbeitnehmer',
                position: ItemTabPosition.first,
                isSelected: _controller.selectedTabIndex.value == 0,
                onTap: () => _onTap(0),
              ),
            ),
            SizedBox(
              width: Dimens.width(200),
              child: ItemTab(
                text: 'Arbeitgeber',
                position: ItemTabPosition.mid,
                isSelected: _controller.selectedTabIndex.value == 1,
                onTap: () => _onTap(1),
              ),
            ),
            SizedBox(
              width: Dimens.width(200),
              child: ItemTab(
                text: 'Temporärbüro',
                position: ItemTabPosition.last,
                isSelected: _controller.selectedTabIndex.value == 2,
                onTap: () => _onTap(2),
              ),
            ),
          ],
        ),
      ).appPadding,
    );
  }

  @override
  Widget build(BuildContext context) {
    final isPhone = MediaQuery.of(context).size.width < 600;
    return isPhone ? _phone() : _desktop();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
