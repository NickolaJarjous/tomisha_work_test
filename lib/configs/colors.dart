import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/local/get_storage_helper.dart';

class AppColors {
  static Color primaryLight = const Color(0xFF81E6D9);
  static Color primaryDark = const Color(0xFF81E6D9);

  static Color get primary {
    return Get.find<GetStorageHelper>().isDarkMode ? primaryDark : primaryLight;
  }

  static const Color accentLight = Color(0xFF3182CE);
  static const Color accentDark = Color(0xFF3182CE);

  static Color get accent {
    return Get.find<GetStorageHelper>().isDarkMode ? accentDark : accentLight;
  }

  static Color backgroundLight = const Color(0xffffffff);
  static Color backgroundDark = const Color(0xffffffff);

  static Color get background {
    return Get.find<GetStorageHelper>().isDarkMode
        ? backgroundDark
        : backgroundLight;
  }

  static const Color primaryTextLight = Color(0xFF2D3748);
  static const Color primaryTextDark = Color(0xFF2D3748);

  static Color get primaryText {
    return Get.find<GetStorageHelper>().isDarkMode
        ? primaryTextDark
        : primaryTextLight;
  }

  static Color get secondaryText {
    return Get.find<GetStorageHelper>().isDarkMode
        ? const Color(0xFF718096)
        : const Color(0xFF718096);
  }
  
  static Color shadowLight = Colors.grey.withValues(alpha: 0.4);
  static Color shadowDark = Colors.black.withValues(alpha: 0.4);

  static Color gradient1 = Color(0xFF319795);
  static Color gradient2 = Color(0xFF3182CE);

  static Color get shadow {
    return Get.find<GetStorageHelper>().isDarkMode ? shadowDark : shadowLight;
  }

  static MaterialColor primaryBlack =
      MaterialColor(_blackPrimaryValue, <int, Color>{
        50: Color(0xFF000000),
        100: Color(0xFF000000),
        200: Color(0xFF000000),
        300: Color(0xFF000000),
        400: Color(0xFF000000),
        500: Color(_blackPrimaryValue),
        600: Color(0xFF000000),
        700: Color(0xFF000000),
        800: Color(0xFF000000),
        900: Color(0xFF000000),
      });
  static int _blackPrimaryValue = 0xFF000000;
}

extension HexColor on Color {
  static Color fromHex(String hexString) {
    try {
      final buffer = StringBuffer();
      if (hexString.contains('rgb')) {
        String splittableString = hexString.substring(
          hexString.indexOf('(') + 1,
          hexString.length - 1,
        );
        List<String> rgb = splittableString.split(',');
        return Color.fromARGB(
          255,
          int.parse(rgb[0]),
          int.parse(rgb[1]),
          int.parse(rgb[2]),
        );
      }
      if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
      buffer.write(hexString.replaceFirst('#', ''));
      return Color(int.parse(buffer.toString(), radix: 16));
    } catch (e) {
      return Colors.black;
    }
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) =>
      '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}

class ParsedColor {
  ParsedColor({this.name, this.value});

  final String? name;
  final String? value;

  factory ParsedColor.fromJson(Map json) {
    return ParsedColor(name: json["name"] ?? "", value: json["value"] ?? "");
  }
}
