import 'package:get/get.dart';

class Dimens {
  // Design canvas baselines per form factor
  static const double _desktopDesignWidth = 1920;
  static const double _desktopDesignHeight = 1080;
  static const double _tabletDesignWidth = 1024;
  static const double _tabletDesignHeight = 768;
  static const double _mobileDesignWidth = 520;
  static const double _mobileDesignHeight = 1892;

  // Current baseline resolved from context (safe for null context)
  static double get _baseDesignWidth {
    final ctx = Get.context;
    if (ctx?.isDesktopOrWider == true) return _desktopDesignWidth;
    if (ctx?.isTablet == true) return _tabletDesignWidth;
    return _mobileDesignWidth;
  }

  static double get _baseDesignHeight {
    final ctx = Get.context;
    if (ctx?.isDesktopOrWider == true) return _desktopDesignHeight;
    if (ctx?.isTablet == true) return _tabletDesignHeight;
    return _mobileDesignHeight;
  }

  // Scale factors clamped to avoid upscaling beyond the design canvas
  static double get widthScale =>
      (Get.width / _baseDesignWidth).clamp(0.0, 1.0);
  static double get heightScale =>
      (Get.height / _baseDesignHeight).clamp(0.0, 1.0);
  static double get uniformScale =>
      widthScale < heightScale ? widthScale : heightScale;

  // Scaled helpers for design values
  static double width(double value) => value * widthScale;
  static double height(double value) => value * heightScale;

  // Typography scaling (clamped for readability)
  static double get fontScale => uniformScale.clamp(0.9, 1.0);
  static double font(double size) => size * fontScale;

  // For layouts that still depend on a max width baseline
  static double get maxWidth => _baseDesignWidth;

  static double appButtonHeight = 50;
  static double horizontalPadding = 20;

  static const int smoothListViewDurationMillis = 300;
}
