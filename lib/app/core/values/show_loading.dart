import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

void showLoading() {
  Get.dialog(
    barrierDismissible: false,
    Center(
      child: Lottie.asset(
        'assets/lotties/mini_logo.json',
        width: 100,
      ),
    ),
  );
}
