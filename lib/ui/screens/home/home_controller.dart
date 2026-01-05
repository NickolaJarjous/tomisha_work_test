import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tomisha_work_test/configs/base_controller.dart';
import 'package:tomisha_work_test/configs/dimens.dart';

class HomeController extends BaseController {
  final RxBool showRegister = false.obs;
  final ScrollController scrollController = ScrollController();

  final RxInt selectedTabIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(() {
      if (!scrollController.hasClients) return;

      final offset = scrollController.offset;
      final bannerHeight = Dimens.width(590);
      const appBarHeight = 62.0;
      final threshold = (bannerHeight - appBarHeight).clamp(
        0.0,
        double.infinity,
      );

      if (offset > threshold) {
        if (showRegister.isFalse) showRegister.value = true;
      } else {
        if (showRegister.isTrue) showRegister.value = false;
      }
    });
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}
