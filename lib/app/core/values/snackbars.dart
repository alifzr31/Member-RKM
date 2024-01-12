import 'package:boxicons/boxicons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:member_rkm/app/components/base_text.dart';
import 'package:member_rkm/app/core/values/colors.dart';

void successSnackbar(String title, String subtitle) {
  Get.snackbar(
    title,
    subtitle,
    titleText: BaseText(
      text: title,
      size: 15,
      bold: FontWeight.w600,
      color: blackColor,
    ),
    messageText: BaseText(
      text: subtitle,
      bold: FontWeight.w500,
      color: blackColor,
    ),
    margin: const EdgeInsets.all(15),
    borderRadius: 10,
    icon: Icon(
      Boxicons.bxs_check_circle,
      color: Colors.green.shade800,
      size: 35,
    ),
    backgroundColor: Colors.green.shade200,
    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
    shouldIconPulse: false,
  );
}

void infoSnackbar(String title, String subtitle) {
  Get.snackbar(
    title,
    subtitle,
    titleText: BaseText(
      text: title,
      size: 15,
      bold: FontWeight.w600,
      color: blackColor,
    ),
    messageText: BaseText(
      text: subtitle,
      bold: FontWeight.w500,
      color: blackColor,
    ),
    margin: const EdgeInsets.all(15),
    borderRadius: 10,
    icon: Icon(
      Boxicons.bxs_info_circle,
      color: Colors.blue.shade800,
      size: 35,
    ),
    backgroundColor: Colors.blue.shade200,
    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
    shouldIconPulse: false,
  );
}

void failedSnackbar(String title, String subtitle) {
  Get.snackbar(
    title,
    subtitle,
    titleText: BaseText(
      text: title,
      size: 15,
      bold: FontWeight.w600,
      color: blackColor,
    ),
    messageText: BaseText(
      text: subtitle,
      bold: FontWeight.w500,
      color: blackColor,
    ),
    margin: const EdgeInsets.all(15),
    borderRadius: 10,
    icon: Icon(
      Boxicons.bxs_x_circle,
      color: Colors.red.shade800,
      size: 35,
    ),
    backgroundColor: Colors.red.shade200,
    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
    shouldIconPulse: false,
  );
}
