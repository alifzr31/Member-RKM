import 'package:boxicons/boxicons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:member_rkm/app/components/base_button.dart';
import 'package:member_rkm/app/components/base_formgroupfield.dart';
import 'package:member_rkm/app/components/base_text.dart';
import 'package:member_rkm/app/core/values/colors.dart';
import 'package:member_rkm/app/modules/auth/login/controller.dart';

class LoginForm extends StatelessWidget {
  LoginForm({super.key});
  final controller = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          Form(
            key: controller.formKey.value,
            child: Column(
              children: [
                BaseFormGroupField(
                  label: 'Username/Email',
                  hint: 'Username/Email',
                  controller: controller.usernameController.value,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Silahkan masukkan username/email anda';
                    }

                    return null;
                  },
                ),
                const SizedBox(height: 20),
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
                    }

                    return null;
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: () => Get.toNamed('/forgotPassword'),
              child: const BaseText(
                text: 'Lupa Password?',
                color: orangeColor,
                bold: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(height: 50),
          SizedBox(
            width: Get.width,
            child: BaseButton(
              bgColor: whiteColor,
              fgColor: blackColor,
              label: 'Log In',
              onPressed: () {
                if (controller.formKey.value.currentState?.validate() ??
                    false) {
                  controller.login();
                }
              },
            ),
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const BaseText(text: 'Belum punya akun? '),
              GestureDetector(
                onTap: () => Get.offAndToNamed('/register'),
                child: const BaseText(
                  text: 'Daftar disini',
                  color: orangeColor,
                  bold: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
