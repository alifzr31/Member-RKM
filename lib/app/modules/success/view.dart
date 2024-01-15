import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:member_rkm/app/components/base_button.dart';
import 'package:member_rkm/app/components/base_text.dart';
import 'package:member_rkm/app/core/values/colors.dart';
import 'package:member_rkm/app/modules/success/controller.dart';

class SuccessPage extends StatelessWidget {
  const SuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        body: SuccessBody(),
      ),
    );
  }
}

class SuccessBody extends StatelessWidget {
  SuccessBody({super.key});
  final controller = Get.find<SuccessController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BaseText(
                  text: controller.title.value ?? '',
                  size: 16,
                  bold: FontWeight.w600,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 15),
                SvgPicture.asset(
                  'assets/images/success.svg',
                  width: 80,
                ),
                const SizedBox(height: 15),
                BaseText(
                  text: controller.subtitle.value ?? '',
                  color: greyTextColor,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),
                SizedBox(
                  width: Get.width,
                  child: BaseButton(
                    bgColor: whiteColor,
                    fgColor: blackColor,
                    label: 'Kembali ke Dashboard',
                    onPressed: () => Get.offAllNamed('/dashboard'),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
