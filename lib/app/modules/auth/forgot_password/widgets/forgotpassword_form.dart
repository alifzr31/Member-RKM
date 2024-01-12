import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:member_rkm/app/components/base_button.dart';
import 'package:member_rkm/app/components/base_formgroupfield.dart';
import 'package:member_rkm/app/components/base_text.dart';
import 'package:member_rkm/app/core/values/colors.dart';
import 'package:member_rkm/app/modules/auth/forgot_password/controller.dart';

class ForgotPasswordForm extends StatelessWidget {
  ForgotPasswordForm({super.key});
  final controller = Get.find<ForgotPasswordController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SizedBox(
          height: Get.height,
          width: Get.width,
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
                          'Masukkan username/email Anda dengan benar untuk mengatur ulang password anda',
                      size: 12,
                      color: greyTextColor,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              Form(
                key: controller.formKeyEmail.value,
                child: BaseFormGroupField(
                  label: 'Username/Email',
                  hint: 'Masukkan username/email',
                  controller: controller.usernameController.value,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Silahkan masukkan username/email anda';
                    }

                    return null;
                  },
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: Get.width,
                child: BaseButton(
                  bgColor: whiteColor,
                  fgColor: blackColor,
                  label: 'Cek Akun',
                  onPressed: () {
                    if (controller.formKeyEmail.value.currentState
                            ?.validate() ??
                        false) {
                      controller.findAccount();
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
