import 'package:boxicons/boxicons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:member_rkm/app/components/base_button.dart';
import 'package:member_rkm/app/components/base_formgroupfield.dart';
import 'package:member_rkm/app/components/base_text.dart';
import 'package:member_rkm/app/core/values/app_helpers.dart';
import 'package:member_rkm/app/core/values/colors.dart';
import 'package:member_rkm/app/modules/auth/register/controller.dart';

class RegisterForm extends StatelessWidget {
  RegisterForm({super.key});
  final controller = Get.find<RegisterController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SingleChildScrollView(
        child: SizedBox(
          height: Get.height,
          width: Get.width,
          child: Stack(
            children: [
              Positioned(
                top: Get.height < 790 ? 30 : 60,
                left: 0,
                right: 0,
                child: Center(
                  child: SvgPicture.asset(
                    'assets/images/logo.svg',
                    width: 180,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 50, 15, 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Form(
                      key: controller.formKey.value,
                      child: Column(
                        children: [
                          BaseFormGroupField(
                            label: 'Nama Lengkap',
                            hint: 'Nama Lengkap',
                            controller: controller.namaController.value,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Silahkan masukkan nama lengkap anda';
                              }

                              return null;
                            },
                          ),
                          const SizedBox(height: 15),
                          BaseFormGroupField(
                            label: 'Email',
                            hint: 'Email',
                            controller: controller.emailController.value,
                            keyboardType: TextInputType.emailAddress,
                            helper: controller.username.value == null ||
                                    controller.username.value == ''
                                ? null
                                : '${controller.username.value} akan menjadi username anda',
                            onChanged: (value) => controller.username.value =
                                value?.split('@').first,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Silahkan masukkan email anda';
                              }

                              return null;
                            },
                          ),
                          const SizedBox(height: 15),
                          BaseFormGroupField(
                            label: 'No. Telepon',
                            hint: 'No. Telepon',
                            keyboardType: TextInputType.phone,
                            controller: controller.noTelpController.value,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Silahkan masukkan no. telepon anda';
                              } else {
                                if (value.length < 10) {
                                  return 'Minimal password harus berjumlah 10 digit';
                                }
                              }

                              return null;
                            },
                          ),
                          const SizedBox(height: 15),
                          BaseFormGroupField(
                            label: 'Password',
                            hint: 'Password',
                            controller: controller.passwordController.value,
                            obscureText: controller.obscurePass.value,
                            suffixIcon: IconButton(
                              color: orangeColor,
                              onPressed: () => controller.obscurePass.value =
                                  !controller.obscurePass.value,
                              icon: Icon(
                                controller.obscurePass.value
                                    ? Boxicons.bx_show
                                    : Boxicons.bx_hide,
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Silahkan masukkan password anda';
                              } else {
                                if (value.length < 8) {
                                  return 'Minimal password harus berjumlah 8 karakter';
                                } else {
                                  if (!AppHelpers.passwordValidation.hasMatch(value)) {
                                    return 'Password harus mengandung huruf besar, huruf kecil, dan angka';
                                  }
                                }
                              }

                              return null;
                            },
                          ),
                          const SizedBox(height: 15),
                          BaseFormGroupField(
                            label: 'Konfirmasi Password',
                            hint: 'Konfirmasi Password',
                            controller:
                                controller.passwordConfirmController.value,
                            obscureText: controller.obscurePassConfirm.value,
                            suffixIcon: IconButton(
                              color: orangeColor,
                              onPressed: () => controller.obscurePassConfirm
                                  .value = !controller.obscurePassConfirm.value,
                              icon: Icon(
                                controller.obscurePassConfirm.value
                                    ? Boxicons.bx_show
                                    : Boxicons.bx_hide,
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Silahkan masukkan konfirmasi password anda';
                              } else {
                                if (value !=
                                    controller.passwordController.value.text) {
                                  return 'Konfirmasi password tidak sesuai';
                                }
                              }

                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 40),
                    SizedBox(
                      width: Get.width,
                      child: BaseButton(
                        bgColor: whiteColor,
                        fgColor: blackColor,
                        label: 'Register',
                        onPressed: () async {
                          if (controller.formKey.value.currentState
                                  ?.validate() ??
                              false) {
                            controller.checkRegister();
                          }
                        },
                      ),
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const BaseText(text: 'Sudah mempunyai akun? '),
                        GestureDetector(
                          onTap: () => Get.offAndToNamed('/login'),
                          child: const BaseText(
                            text: 'Masuk disini',
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
      ),
    );
  }
}
