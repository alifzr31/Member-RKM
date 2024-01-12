import 'package:boxicons/boxicons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:member_rkm/app/components/base_button.dart';
import 'package:member_rkm/app/components/base_formgroupfield.dart';
import 'package:member_rkm/app/core/values/app_helpers.dart';
import 'package:member_rkm/app/core/values/colors.dart';
import 'package:member_rkm/app/modules/profile/controller.dart';

class FormChangePassword extends StatelessWidget {
  FormChangePassword({super.key});
  final controller = Get.find<ProfileController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Form(
                  key: controller.formKeyChangePassword.value,
                  child: Column(
                    children: [
                      BaseFormGroupField(
                        label: 'Password Sekarang',
                        hint: 'Password Sekarang',
                        controller: controller.currentPasswordController.value,
                        obscureText: controller.obscureCurrentPassword.value,
                        suffixIcon: IconButton(
                          onPressed: () => controller.obscureCurrentPassword
                              .value = !controller.obscureCurrentPassword.value,
                          icon: Icon(controller.obscureCurrentPassword.value
                              ? Boxicons.bx_show
                              : Boxicons.bx_hide),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Silahkan masukkan password yang sekarang anda gunakan';
                          } else {
                            if (value != controller.currentPassword.value) {
                              return 'Password tidak sesuai dengan password yang anda gunakan sekarang';
                            }
                          }

                          return null;
                        },
                      ),
                      const SizedBox(height: 15),
                      BaseFormGroupField(
                        label: 'Password Baru',
                        hint: 'Password Baru',
                        controller: controller.newPasswordController.value,
                        obscureText: controller.obscureNewPassword.value,
                        suffixIcon: IconButton(
                          onPressed: () => controller.obscureNewPassword.value =
                              !controller.obscureNewPassword.value,
                          icon: Icon(controller.obscureNewPassword.value
                              ? Boxicons.bx_show
                              : Boxicons.bx_hide),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Silahkan masukkan password baru yang akan anda gunakan';
                          } else {
                            if (value.length < 8) {
                              return 'Minimal password harus berjumlah 8 karakter';
                            } else {
                              if (!AppHelpers.passwordValidation
                                  .hasMatch(value)) {
                                return 'Password harus mengandung huruf besar, huruf kecil, dan angka';
                              } else {
                                if (value == controller.currentPassword.value) {
                                  return 'Silahkan gunakan password yang berbeda dari password sekarang';
                                }
                              }
                            }
                          }

                          return null;
                        },
                      ),
                      const SizedBox(height: 15),
                      BaseFormGroupField(
                        label: 'Konfirmasi Password Baru',
                        hint: 'Konfirmasi Password Baru',
                        controller: controller.confirmPasswordController.value,
                        obscureText: controller.obscureConfirmPassword.value,
                        suffixIcon: IconButton(
                          onPressed: () => controller.obscureConfirmPassword
                              .value = !controller.obscureConfirmPassword.value,
                          icon: Icon(controller.obscureConfirmPassword.value
                              ? Boxicons.bx_show
                              : Boxicons.bx_hide),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Silahkan masukkan konfirmasi password baru anda';
                          } else {
                            if (value !=
                                controller.newPasswordController.value.text) {
                              return 'Konfirmasi password baru tidak sesuai';
                            }
                          }

                          return null;
                        },
                      ),
                      const SizedBox(height: 15),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              width: Get.width,
              child: BaseButton(
                bgColor: whiteColor,
                fgColor: blackColor,
                label: 'Ganti Password',
                onPressed: () {
                  if (controller.formKeyChangePassword.value.currentState
                          ?.validate() ??
                      false) {
                    controller.changePassword();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
