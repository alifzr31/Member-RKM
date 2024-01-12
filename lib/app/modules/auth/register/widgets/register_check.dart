import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:member_rkm/app/components/base_button.dart';
import 'package:member_rkm/app/components/base_text.dart';
import 'package:member_rkm/app/core/values/colors.dart';
import 'package:member_rkm/app/modules/auth/register/controller.dart';

class RegisterCheck extends StatelessWidget {
  RegisterCheck({super.key});
  final controller = Get.find<RegisterController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Stack(
          children: [
            Positioned(
              top: 80,
              left: 0,
              right: 0,
              child: Center(
                child: SvgPicture.asset(
                  'assets/images/logo.svg',
                  width: 180,
                ),
              ),
            ),
            Positioned(
              top: 0,
              bottom: 0,
              left: 0,
              right: 0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const BaseText(
                          text: 'Nama Lengkap',
                          bold: FontWeight.w500,
                        ),
                        const SizedBox(height: 5),
                        BaseText(text: controller.namaController.value.text),
                        const SizedBox(height: 15),
                        const BaseText(
                          text: 'Email',
                          bold: FontWeight.w500,
                        ),
                        const SizedBox(height: 5),
                        BaseText(text: controller.emailController.value.text),
                        const SizedBox(height: 15),
                        const BaseText(
                          text: 'Username',
                          bold: FontWeight.w500,
                        ),
                        const SizedBox(height: 5),
                        BaseText(text: controller.username.value ?? ''),
                        if (controller.noTelpController.value.text != '')
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 15),
                              const BaseText(
                                text: 'No. Telepon',
                                bold: FontWeight.w500,
                              ),
                              const SizedBox(height: 5),
                              BaseText(
                                  text: controller.noTelpController.value.text),
                            ],
                          ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                  const BaseText(
                    text: 'Harap periksa kembali data anda sudah benar',
                    size: 12,
                    color: orangeColor,
                    bold: FontWeight.w500,
                  ),
                  const SizedBox(height: 5),
                  SizedBox(
                    width: Get.width,
                    child: BaseButton(
                      bgColor: whiteColor,
                      fgColor: blackColor,
                      label: 'Ya, Sudah Benar',
                      onPressed: controller.register,
                    ),
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(5),
                    onTap: controller.cancelRegister,
                    child: const Padding(
                      padding: EdgeInsets.all(8),
                      child: BaseText(
                        text: 'Tidak, Belum Benar',
                        bold: FontWeight.w500,
                      ),
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
