import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:member_rkm/app/modules/splash/controller.dart';

class SplashBody extends StatelessWidget {
  SplashBody({super.key});
  final controller = Get.find<SplashController>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Obx(
        () => Padding(
          padding: const EdgeInsets.all(15),
          child: Stack(
            children: List.generate(
              controller.stackWidget.length,
              (index) => controller.stackWidget[index],
            ),
          ),
        ),
      ),
    );
  }
}
