import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainTextField extends GetView {
  final String? hint;
  final TextEditingController? textController;
  final bool? isPadding;
  final TextInputType? keyboardType;
  final bool? password;

  const MainTextField(
      {super.key, this.hint, this.textController, this.isPadding, this.keyboardType, this.password});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          right: isPadding == null ? 8 : 0,
          left: isPadding == null ? 8 : 0,
          top: 0,
          bottom: 0),
      child: TextField(
        cursorColor: Colors.black,
        controller: textController,
        keyboardType: keyboardType ?? TextInputType.text,
        obscureText: password ?? false,
        decoration: InputDecoration(
            //counterStyle: TextStyle(color: Get.theme.primaryColor),
            //filled: true,
            contentPadding: const EdgeInsets.only(left: 8, right: 8, top: 8),
            // hintStyle: TextStyle(
            //   color: Colors.grey[800],
            // ),
            hintText: hint,
            hintStyle:
                TextStyle(color: Get.theme.primaryColor.withOpacity(0.5)),
            fillColor: Get.theme.canvasColor),
      ),
    );
  }
}
