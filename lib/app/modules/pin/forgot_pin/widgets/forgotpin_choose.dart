import 'package:boxicons/boxicons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:member_rkm/app/components/base_button.dart';
import 'package:member_rkm/app/components/base_text.dart';
import 'package:member_rkm/app/core/values/colors.dart';
import 'package:member_rkm/app/modules/pin/forgot_pin/controller.dart';

class ForgotPinChoose extends StatelessWidget {
  ForgotPinChoose({super.key});
  final controller = Get.find<ForgotPinController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BaseText(
                    text: 'Lupa PIN',
                    size: 20,
                    bold: FontWeight.w600,
                  ),
                  BaseText(
                    text:
                        'Pilih metode verifikasi akun anda, mendapatkan kode OTP via WhatsApp atau via Email',
                    size: 12,
                    color: greyTextColor,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            SizedBox(
              width: Get.width,
              child: BaseButtonIcon(
                bgColor: whiteColor,
                fgColor: blackColor,
                ovColor: blackColor,
                label: 'via Email',
                icon: Boxicons.bx_mail_send,
                onPressed: () {
                  controller.chooseVerify.value = 'email';
                  controller.sendEmail();
                },
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: Get.width,
              child: BaseButtonIcon(
                bgColor: whiteColor,
                fgColor: blackColor,
                ovColor: blackColor,
                label: 'via WhatsApp',
                icon: Boxicons.bxl_whatsapp,
                onPressed: () {
                  controller.chooseVerify.value = 'whatsapp';
                  controller.sendWhatsapp();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
