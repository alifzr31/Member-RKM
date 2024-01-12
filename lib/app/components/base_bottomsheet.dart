import 'package:flutter/material.dart';
import 'package:get/get.dart';

void baseBottomSheet(double height, Widget child) {
  Get.bottomSheet(
    backgroundColor: const Color(0xFF2a323D),
    enableDrag: false,
    clipBehavior: Clip.antiAlias,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),
    ),
    SizedBox(
      height: height,
      width: Get.width,
      child: child,
    ),
  );
}
