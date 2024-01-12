import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:member_rkm/app/components/base_button.dart';
import 'package:member_rkm/app/components/base_text.dart';
import 'package:member_rkm/app/core/values/colors.dart';
import 'package:member_rkm/app/modules/onboard/controller.dart';

class FooterOnboard extends StatelessWidget {
  FooterOnboard({super.key});
  final controller = Get.find<OnBoardController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                controller.titles.length,
                (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  height: 8,
                  width: 8,
                  margin: const EdgeInsets.only(right: 5),
                  decoration: BoxDecoration(
                    color: controller.currentPage.value == index
                        ? orangeColor
                        : softOrangeColor,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: Get.width,
              child: BaseButton(
                bgColor: whiteColor,
                fgColor: blackColor,
                label: controller.currentPage.value ==
                        (controller.titles.length - 1)
                    ? 'Mulai Sekarang'
                    : 'Lanjutkan',
                onPressed: () {
                  if (controller.currentPage.value ==
                      (controller.titles.length - 1)) {
                    controller.getStarted();
                  } else {
                    controller.nextPage();
                  }
                },
              ),
            ),
            const SizedBox(height: 5),
            GestureDetector(
              onTap: controller.skipOrLogin,
              child: BaseText(
                text: controller.currentPage.value ==
                        (controller.titles.length - 1)
                    ? 'Log In'
                    : 'Lewati',
                bold: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
