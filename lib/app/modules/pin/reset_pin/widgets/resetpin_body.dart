import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:member_rkm/app/components/base_text.dart';
import 'package:member_rkm/app/core/values/colors.dart';
import 'package:member_rkm/app/modules/pin/reset_pin/controller.dart';

class ResetPinBody extends StatelessWidget {
  ResetPinBody({super.key});
  final controller = Get.find<ResetPinController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller.pageController.value,
        onPageChanged: (index) => controller.currentPage.value = index,
        children: List.generate(
          2,
          (index) => SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        BaseText(
                          text: index == 0
                              ? 'Masukkan PIN Baru Anda'
                              : 'Masukkan Ulang PIN Baru Anda',
                          size: 16,
                          bold: FontWeight.w600,
                        ),
                        const SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            6,
                            (index) {
                              return Container(
                                margin: const EdgeInsets.all(10),
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: controller.currentPage.value == 0
                                      ? index <
                                              controller
                                                  .resetNewPin.value.length
                                          ? orangeColor
                                          : softOrangeColor
                                      : index <
                                              controller
                                                  .resetConfirmPin.value.length
                                          ? orangeColor
                                          : softOrangeColor,
                                ),
                              );
                            },
                          ),
                        ),
                        if (controller.currentPage.value == 1 &&
                            controller.errorReset.value)
                          const SizedBox(height: 15),
                        if (controller.currentPage.value == 1 &&
                            controller.errorReset.value)
                          const BaseText(
                            text: 'PIN Tidak Sesuai',
                            color: redColor,
                            bold: FontWeight.w600,
                          ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          for (var i = 0; i < 3; i++)
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: List.generate(
                                3,
                                (index) => TextButton(
                                  onPressed: () {
                                    controller.enterPin(1 + 3 * i + index);
                                  },
                                  child: BaseText(
                                    text: (1 + 3 * i + index).toString(),
                                    size: 24,
                                    bold: FontWeight.w600,
                                  ),
                                ),
                              ).toList(),
                            ),

                          /// 0 digit with back remove
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const TextButton(
                                  onPressed: null, child: SizedBox()),
                              TextButton(
                                onPressed: () {
                                  controller.enterPin(0);
                                },
                                child: BaseText(
                                  text: 0.toString(),
                                  size: 24,
                                  bold: FontWeight.w600,
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  controller.deletePin();
                                },
                                child: const Icon(
                                  Icons.backspace,
                                  size: 24,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
