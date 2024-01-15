import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:member_rkm/app/core/values/show_loading.dart';
import 'package:member_rkm/app/data/providers/forgotpassword_provider.dart';

class ForgotPasswordController extends GetxController {
  final ForgotPasswordProvider forgotPasswordProvider;

  ForgotPasswordController({required this.forgotPasswordProvider});

  final pageIndex = 0.obs;
  final pageController = PageController().obs;

  final formKeyEmail = GlobalKey<FormState>().obs;
  final usernameController = TextEditingController().obs;

  final email = Rx<String?>(null);
  final phoneNumber = Rx<String?>(null);
  final chooseVerify = Rx<String?>(null);

  final formKeyOtp = GlobalKey<FormState>().obs;
  final otpController = TextEditingController().obs;

  final formKeyReset = GlobalKey<FormState>().obs;
  final newPasswordController = TextEditingController().obs;
  final obscureNewPass = true.obs;
  final confirmPasswordController = TextEditingController().obs;
  final obscureConfirmPass = true.obs;

  @override
  void onClose() {
    pageController.value.dispose();
    usernameController.value.dispose();
    otpController.value.dispose();
    newPasswordController.value.dispose();
    confirmPasswordController.value.dispose();
    super.onClose();
  }

  Future<void> movePage(int pageIndex) async {
    pageController.value.animateToPage(
      pageIndex,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOutCubic,
    );
  }

  void findAccount() async {
    final formData = dio.FormData.fromMap({
      'username': usernameController.value.text,
    });

    showLoading();

    await Future.delayed(const Duration(milliseconds: 1500), () {
      Get.back();
      print(formData.fields);
      email.value = 'alifzakya.r@gmail.com';
      phoneNumber.value = '081221112586';
      movePage(1);
    });
  }

  void chooseVerifyForgotPassword() {
    if (chooseVerify.value == 'email') {
      sendEmail();
    } else {
      sendWhatsapp();
    }
  }

  void sendEmail() async {
    final formData = dio.FormData.fromMap({
      'email': email.value,
    });

    showLoading();

    await Future.delayed(const Duration(milliseconds: 1500), () {
      Get.back();
      print(formData.fields);
      movePage(2);
    });
  }

  void sendWhatsapp() async {
    final formData = dio.FormData.fromMap({
      'phone_number': phoneNumber.value,
    });

    showLoading();

    await Future.delayed(const Duration(milliseconds: 1500), () {
      Get.back();
      print(formData.fields);
      movePage(2);
    });
  }

  void verifyOtp() async {
    final formData = dio.FormData.fromMap({
      'otp': otpController.value.text,
    });

    showLoading();

    await Future.delayed(const Duration(milliseconds: 1500), () {
      Get.back();
      print(formData.fields);
      movePage(3);
    });
  }

  void resetPassword() async {
    final formData = dio.FormData.fromMap({
      'new_password': newPasswordController.value.text,
      'confirm_password': confirmPasswordController.value.text,
    });

    showLoading();

    await Future.delayed(const Duration(milliseconds: 1500), () {
      Get.back();
      print(formData.fields);
      Get.toNamed(
        '/success',
        arguments: {
          'title': 'Reset Password Berhasil',
          'subtitle': 'Silahkan lakukan log in dengan password baru anda'
        },
      );
      // movePage(3);
    });
  }
}
