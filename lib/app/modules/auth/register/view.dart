import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:member_rkm/app/modules/auth/register/controller.dart';
import 'package:member_rkm/app/modules/auth/register/widgets/register_check.dart';
import 'package:member_rkm/app/modules/auth/register/widgets/register_form.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RegisterBody(),
    );
  }
}

class RegisterBody extends StatelessWidget {
  RegisterBody({super.key});
  final controller = Get.find<RegisterController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => PageView(
        controller: controller.pageController.value,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          RegisterForm(),
          RegisterCheck(),
        ],
      ),
    );
  }
}
