import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:member_rkm/app/components/base_text.dart';
import 'package:member_rkm/app/core/values/colors.dart';
import 'package:member_rkm/app/modules/pin/createchange_pin/controller.dart';

class BodyPin extends StatelessWidget {
  BodyPin({super.key});
  final controller = Get.find<PinController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BaseText(
                      text: Get.currentRoute == '/createPin'
                          ? controller.currentPage.value == 0
                              ? 'Masukkan PIN Baru Anda'
                              : 'Masukkan Ulang PIN Baru Anda'
                          : Get.currentRoute == '/changePin'
                              ? controller.currentPage.value == 0
                                  ? 'Masukkan PIN Lama Anda'
                                  : controller.currentPage.value == 1
                                      ? 'Masukkan PIN Baru Anda'
                                      : 'Masukkan Ulang PIN Baru Anda'
                              : 'Masukkan PIN Anda',
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
                              color: Get.currentRoute == '/createPin'
                                  ? controller.currentPage.value == 0
                                      ? index <
                                              controller
                                                  .createNewPin.value.length
                                          ? orangeColor
                                          : softOrangeColor
                                      : index <
                                              controller
                                                  .createConfirmPin.value.length
                                          ? orangeColor
                                          : softOrangeColor
                                  : Get.currentRoute == '/changePin'
                                      ? controller.currentPage.value == 0
                                          ? index <
                                                  controller.changeCurrentPin
                                                      .value.length
                                              ? orangeColor
                                              : softOrangeColor
                                          : controller.currentPage.value == 1
                                              ? index <
                                                      controller.changeNewPin
                                                          .value.length
                                                  ? orangeColor
                                                  : softOrangeColor
                                              : index <
                                                      controller
                                                          .changeConfirmPin
                                                          .value
                                                          .length
                                                  ? orangeColor
                                                  : softOrangeColor
                                      : index <
                                              controller.enteredPin.value.length
                                          ? orangeColor
                                          : softOrangeColor,
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 5),
                    if (Get.currentRoute == '/changePin' &&
                        controller.currentPage.value == 0 &&
                        controller.errorCheckPin.value)
                      const BaseText(
                        text: 'PIN yang anda masukkan salah',
                        color: redColor,
                        bold: FontWeight.w600,
                      ),
                    const SizedBox(height: 10),
                    if (Get.currentRoute == '/changePin' &&
                        controller.currentPage.value == 1 &&
                        controller.errorChangeNewPin.value)
                      const BaseText(
                        text: 'Gunakan PIN yang berbeda dari PIN lama',
                        color: redColor,
                        bold: FontWeight.w600,
                      ),
                    if (Get.currentRoute == '/createPin' &&
                            controller.currentPage.value == 1 &&
                            controller.errorCreate.value ||
                        Get.currentRoute == '/changePin' &&
                            controller.currentPage.value == 2 &&
                            controller.errorChange.value)
                      const BaseText(
                        text: 'PIN Tidak Sesuai',
                        color: redColor,
                        bold: FontWeight.w600,
                      ),
                    if (Get.currentRoute == '/changePin' &&
                        controller.currentPage.value == 0)
                      GestureDetector(
                        onTap: () => Get.toNamed('/forgotPin'),
                        child: const BaseText(
                          text: 'Lupa PIN?',
                          bold: FontWeight.w500,
                          color: orangeColor,
                        ),
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
                          const TextButton(onPressed: null, child: SizedBox()),
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
    );
  }
}
