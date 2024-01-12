import 'package:boxicons/boxicons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:member_rkm/app/components/base_button.dart';
import 'package:member_rkm/app/components/base_text.dart';
import 'package:member_rkm/app/core/values/app_helpers.dart';
import 'package:member_rkm/app/core/values/colors.dart';
import 'package:member_rkm/app/modules/auth/forgot_password/controller.dart';

class ForgotPasswordEmail extends StatelessWidget {
  ForgotPasswordEmail({super.key});
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
                onTap: () => controller.movePage(1),
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
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const BaseText(
                          text: 'Lupa Password',
                          size: 20,
                          bold: FontWeight.w600,
                        ),
                        RichText(
                          text: TextSpan(
                            style: DefaultTextStyle.of(context).style,
                            children: [
                              const TextSpan(
                                text:
                                    'Tautan reset password sudah dikirim ke email ',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: greyTextColor,
                                ),
                              ),
                              TextSpan(
                                text: AppHelpers.maskEmail(controller.email.value ?? ''),
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
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
                      icon: Boxicons.bx_mail_send,
                      label: 'Buka Email',
                      onPressed: () {},
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const BaseText(
                        text: 'Tidak menerima email? ',
                        color: Colors.white70,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: const BaseText(
                          text: 'Kirim Ulang',
                          color: orangeColor,
                          bold: FontWeight.w500,
                        ),
                      ),
                    ],
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
