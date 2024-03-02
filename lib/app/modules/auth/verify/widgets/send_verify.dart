import 'package:boxicons/boxicons.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:member_rkm/app/components/base_button.dart';
import 'package:member_rkm/app/components/base_text.dart';
import 'package:member_rkm/app/core/values/colors.dart';
import 'package:member_rkm/app/modules/auth/verify/controller.dart';

class SendVerifyPage extends StatelessWidget {
  SendVerifyPage({super.key});
  final controller = Get.find<VerifyController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const BaseText(
                text: 'Verifikasi Akun',
                size: 20,
                bold: FontWeight.w600,
              ),
              RichText(
                text: TextSpan(
                  style: DefaultTextStyle.of(context).style,
                  children: const [
                    TextSpan(
                      text:
                          'Pilih metode verifikasi akun anda, mendapatkan kode OTP via ',
                      style: TextStyle(color: greyTextColor),
                    ),
                    TextSpan(
                      text: 'Whatsapp',
                      style: TextStyle(
                        color: whiteColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    TextSpan(
                      text: ' atau link tautan via ',
                      style: TextStyle(color: greyTextColor),
                    ),
                    TextSpan(
                      text: 'Email',
                      style: TextStyle(
                        color: whiteColor,
                        fontWeight: FontWeight.w500,
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
            icon: Boxicons.bxl_whatsapp,
            label: 'via Whatsapp',
            onPressed: () {
              controller.type.value = 'wa';
              controller.sendVerify();
            },
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          width: Get.width,
          child: BaseButtonIcon(
            bgColor: whiteColor,
            fgColor: blackColor,
            icon: Boxicons.bx_mail_send,
            label: 'via Email',
            onPressed: () {
              controller.type.value = 'email';
              controller.sendVerify();
            },
          ),
        ),
      ],
    );
  }
}
