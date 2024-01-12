import 'package:boxicons/boxicons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:member_rkm/app/components/base_button.dart';
import 'package:member_rkm/app/components/base_text.dart';
import 'package:member_rkm/app/core/values/colors.dart';
import 'package:member_rkm/app/modules/auth/forgot_password/components/findaccount_box.dart';
import 'package:member_rkm/app/modules/auth/forgot_password/controller.dart';

class ForgotPasswordVerify extends StatelessWidget {
  ForgotPasswordVerify({super.key});
  final controller = Get.find<ForgotPasswordController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: InkWell(
                onTap: () => controller.movePage(0),
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                  child: BaseText(text: 'Kembali'),
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BaseText(
                          text: 'Lupa Password',
                          size: 20,
                          bold: FontWeight.w600,
                        ),
                        BaseText(
                          text:
                              'Pilih metode verifikasi akun anda, mendapatkan kode OTP via WhatsApp atau mendapatkan tautan reset password via Email',
                          size: 12,
                          color: greyTextColor,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  FindAccountBox(
                    email: controller.email.value ?? '',
                    phoneNumber: controller.phoneNumber.value ?? '',
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
          ],
        ),
      ),
    );
  }
}
