import 'package:flutter/material.dart';
import 'package:tomisha_work_test/configs/dimens.dart';
import 'package:tomisha_work_test/utils/http_helper.dart';

extension ExtRangeValues on RangeValues {
  RangeValues get rounded {
    return RangeValues(start.roundToDouble(), end.roundToDouble());
  }
}

extension ExtList on List? {
  bool get isNullOrEmpty => this == null || this!.isEmpty;
}

extension ExtWidget on Widget {
  Widget get appPadding => Padding(
    padding: EdgeInsets.symmetric(horizontal: Dimens.horizontalPadding),
    child: this,
  );
}

extension EmptyPadding on num {
  SizedBox get ph => SizedBox(height: toDouble());

  SizedBox get pw => SizedBox(width: toDouble());
}

extension ExtString on String? {
  bool get isNullOrEmpty => this == null || this!.isEmpty;

  String get fullUrl => resolveUrl(this!);
}

extension ExtNum on num? {
  bool get isGreaterThanZero => this != null && this! > 0;
}
