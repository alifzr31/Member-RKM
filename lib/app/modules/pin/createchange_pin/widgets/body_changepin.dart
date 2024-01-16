import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:member_rkm/app/modules/pin/createchange_pin/controller.dart';
import 'package:member_rkm/app/modules/pin/createchange_pin/widgets/body_pin.dart';

class BodyChangePin extends StatelessWidget {
  BodyChangePin({super.key});
  final controller = Get.find<PinController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => PageView(
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: (index) => controller.currentPage.value = index,
        controller: controller.pageController.value,
        children: [
          BodyPin(),
          BodyPin(),
          BodyPin(),
        ],
      ),
    );
  }
}
