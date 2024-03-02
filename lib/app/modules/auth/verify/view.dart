import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:member_rkm/app/core/values/colors.dart';
import 'package:member_rkm/app/core/values/show_loading.dart';
import 'package:member_rkm/app/modules/auth/verify/controller.dart';
import 'package:member_rkm/app/modules/auth/verify/widgets/receive_verify.dart';
import 'package:member_rkm/app/modules/auth/verify/widgets/send_verify.dart';

class VerifyPage extends StatelessWidget {
  const VerifyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: VerifyBody(),
    );
  }
}

class VerifyBody extends StatelessWidget {
  VerifyBody({super.key});
  final controller = Get.find<VerifyController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SizedBox(
          height: Get.height,
          width: Get.width,
          child: SafeArea(
            child: Stack(
              children: [
                Positioned(
                  top: 80,
                  left: 0,
                  right: 0,
                  child: SvgPicture.asset('assets/images/logo.svg', width: 180),
                ),
                PageView(
                  controller: controller.pageController.value,
                  onPageChanged: (index) =>
                      controller.currentPage.value = index,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    SendVerifyPage(),
                    ReceiveVerifyPage(),
                  ],
                ),
                if (controller.currentPage.value == 1)
                  CupertinoButton(
                    minSize: 25,
                    padding: EdgeInsets.zero,
                    onPressed: () async {
                      showLoading();

                      await Future.delayed(const Duration(milliseconds: 1500),
                          () {
                        Get.back();
                        controller.otpController.value.clear();
                        controller.pageController.value.animateToPage(
                          0,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOutCubic,
                        );
                      });
                    },
                    child: const Text(
                      'Kembali',
                      style: TextStyle(
                        fontSize: 14,
                        color: whiteColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
