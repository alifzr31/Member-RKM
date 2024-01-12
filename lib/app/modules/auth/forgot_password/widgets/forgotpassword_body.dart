import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:member_rkm/app/modules/auth/forgot_password/controller.dart';
import 'package:member_rkm/app/modules/auth/forgot_password/widgets/forgotpassword_email.dart';
import 'package:member_rkm/app/modules/auth/forgot_password/widgets/forgotpassword_form.dart';
import 'package:member_rkm/app/modules/auth/forgot_password/widgets/forgotpassword_reset.dart';
import 'package:member_rkm/app/modules/auth/forgot_password/widgets/forgotpassword_verify.dart';
import 'package:member_rkm/app/modules/auth/forgot_password/widgets/forgotpassword_whatsapp.dart';

class ForgotPasswordBody extends StatelessWidget {
  ForgotPasswordBody({super.key});
  final controller = Get.find<ForgotPasswordController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller.pageController.value,
        onPageChanged: (index) => controller.pageIndex.value = index,
        children: [
          ForgotPasswordForm(),
          ForgotPasswordVerify(),
          controller.chooseVerify.value == 'email'
              ? ForgotPasswordEmail()
              : ForgotPasswordWhatsApp(),
          ForgotPasswordReset(),
        ],
      ),
    );
  }
}
