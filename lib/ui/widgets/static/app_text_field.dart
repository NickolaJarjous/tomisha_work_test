import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tomisha_work_test/data/local/get_storage_helper.dart';
import 'package:tomisha_work_test/utils/ext.dart';

import '../../../configs/colors.dart';
import 'app_label.dart';

class AppTextField extends GetResponsiveView {
  final TextEditingController textEditingController;
  final String? hint;
  final FormFieldValidator<String>? validator;
  final TextInputType keyboardType;
  final Color? color;
  final Color? hintColor;
  final Function(String)? onChanged;
  final Widget? prefix;
  final double? fontSize;
  final bool? enabled;
  final bool? password;
  final RxString? error;
  final Widget? icon;
  final Function? onIconTap;
  final bool? useBorder;
  final FocusNode? focusNode;
  final Color? fillColor;

  AppTextField({
    super.key,
    required this.textEditingController,
    this.hint,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.color,
    this.hintColor,
    this.onChanged,
    this.prefix,
    this.fontSize,
    this.enabled,
    this.password,
    this.error,
    this.icon,
    this.onIconTap,
    this.useBorder = true,
    this.focusNode,
    this.fillColor,
  });

  @override
  Widget builder() {
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              TextFormField(
                enabled: enabled ?? true,
                onChanged: (text) {
                  onChanged?.call(text);
                },
                validator: validator,
                focusNode: focusNode,
                textAlignVertical: TextAlignVertical.center,
                obscureText: password ?? false,
                cursorColor: AppColors.primary,
                style: TextStyle(
                  fontFamily: 'AVG',
                  color: color ?? AppColors.primaryText,
                  fontSize: 14,
                ),
                keyboardType: keyboardType,
                controller: textEditingController,
                decoration: InputDecoration(
                  hintText: hint,
                  hintStyle: TextStyle(
                    fontFamily: 'AVG',
                    color: AppColors.secondaryText,
                    fontSize: 14,
                  ),
                  border: OutlineInputBorder(
                    borderSide: useBorder!
                        ? error != null && !error!.value.isNullOrEmpty
                              ? BorderSide(width: 1, color: Colors.red.shade500)
                              : BorderSide.none
                        : BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: useBorder!
                        ? error != null && !error!.value.isNullOrEmpty
                              ? BorderSide(width: 1, color: Colors.red.shade500)
                              : BorderSide.none
                        : BorderSide.none,
                  ),
                  fillColor: fillColor ?? AppColors.background,
                  filled: true,
                  prefix: prefix,
                  contentPadding: EdgeInsets.only(
                    left: Get.find<GetStorageHelper>().isRtl && icon != null
                        ? 40
                        : 10,
                    right: Get.find<GetStorageHelper>().isRtl && icon != null
                        ? 10
                        : 40,
                  ),
                ),
              ),
              Positioned(
                left: Get.find<GetStorageHelper>().isRtl ? 10 : null,
                right: Get.find<GetStorageHelper>().isRtl ? null : 10,
                child: icon != null
                    ? InkWell(
                        onTap: () {
                          if (onIconTap != null) {
                            onIconTap!();
                          }
                        },
                        child: icon,
                      )
                    : const SizedBox(),
              ),
            ],
          ),
          error == null || error!.value.isNullOrEmpty
              ? Container()
              : AppLabel(text: error!.value, color: Colors.red, fontSize: 12),
        ],
      ),
    );
  }
}
