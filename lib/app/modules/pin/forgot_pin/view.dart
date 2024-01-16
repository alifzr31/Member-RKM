import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:member_rkm/app/modules/pin/forgot_pin/controller.dart';
import 'package:member_rkm/app/modules/pin/forgot_pin/widgets/forgotpin_choose.dart';
import 'package:member_rkm/app/modules/pin/forgot_pin/widgets/forgotpin_verify.dart';

class ForgotPinPage extends StatelessWidget {
  const ForgotPinPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ForgotPinBody(),
    );
  }
}

class ForgotPinBody extends StatelessWidget {
  ForgotPinBody({super.key});
  final controller = Get.find<ForgotPinController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller.pageController.value,
        onPageChanged: (index) => controller.currentPage.value = index,
        children: [
          ForgotPinChoose(),
          ForgotPinVerify(),
        ],
      ),
    );
  }
}
