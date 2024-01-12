import 'package:boxicons/boxicons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:member_rkm/app/components/base_button.dart';
import 'package:member_rkm/app/components/base_formgroupfield.dart';
import 'package:member_rkm/app/components/base_text.dart';
import 'package:member_rkm/app/core/values/app_helpers.dart';
import 'package:member_rkm/app/core/values/colors.dart';
import 'package:member_rkm/app/modules/auth/forgot_password/controller.dart';

class ForgotPasswordReset extends StatelessWidget {
  ForgotPasswordReset({super.key});
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
                      text: 'Atur Ulang Password',
                      size: 20,
                      bold: FontWeight.w600,
                    ),
                    BaseText(
                      text: 'Silahkan atur ulang password anda',
                      size: 12,
                      color: greyTextColor,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              Form(
                key: controller.formKeyReset.value,
                child: Column(
                  children: [
                    BaseFormGroupField(
                      label: 'Password Baru',
                      controller: controller.newPasswordController.value,
                      obscureText: controller.obscureNewPass.value,
                      suffixIcon: IconButton(
                        color: orangeColor,
                        onPressed: () => controller.obscureNewPass.value =
                            !controller.obscureNewPass.value,
                        icon: Icon(
                          controller.obscureNewPass.value
                              ? Boxicons.bx_show
                              : Boxicons.bx_hide,
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Silahkan masukkan password baru anda';
                        } else {
                          if (value.length < 8) {
                            return 'Minimal password harus berjumlah 8 karakter';
                          } else {
                            if (!AppHelpers.passwordValidation
                                .hasMatch(value)) {
                              return 'Password harus mengandung huruf besar, huruf kecil, dan angka';
                            }
                          }
                        }

                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    BaseFormGroupField(
                      label: 'Konfirmasi Password',
                      controller: controller.confirmPasswordController.value,
                      obscureText: controller.obscureConfirmPass.value,
                      suffixIcon: IconButton(
                        color: orangeColor,
                        onPressed: () => controller.obscureConfirmPass.value =
                            !controller.obscureConfirmPass.value,
                        icon: Icon(
                          controller.obscureConfirmPass.value
                              ? Boxicons.bx_show
                              : Boxicons.bx_hide,
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Silahkan masukkan konfirmasi password anda';
                        } else {
                          if (value !=
                              controller.newPasswordController.value.text) {
                            return 'Konfirmasi password tidak sesuai';
                          }
                        }

                        return null;
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              SizedBox(
                width: Get.width,
                child: BaseButton(
                  bgColor: whiteColor,
                  fgColor: blackColor,
                  label: 'Submit',
                  onPressed: () {
                    if (controller.formKeyReset.value.currentState
                            ?.validate() ??
                        false) {
                      controller.resetPassword();
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
