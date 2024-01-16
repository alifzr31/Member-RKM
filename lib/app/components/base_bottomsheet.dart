import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:member_rkm/app/core/values/colors.dart';

void baseBottomSheet(double height, Widget child) {
  Get.bottomSheet(
    backgroundColor: bgSectionColor,
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
