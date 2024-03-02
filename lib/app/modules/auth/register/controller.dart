import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:member_rkm/app/core/values/show_loading.dart';
import 'package:member_rkm/app/core/values/snackbars.dart';
import 'package:member_rkm/app/data/providers/register_provider.dart';

class RegisterController extends GetxController {
  final RegisterProvider registerProvider;

  RegisterController({required this.registerProvider});

  final pageController = PageController().obs;

  final formKey = GlobalKey<FormState>().obs;
  final username = Rx<String?>(null);
  final namaController = TextEditingController().obs;
  final emailController = TextEditingController().obs;
  final noTelpController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  final obscurePass = true.obs;
  final passwordConfirmController = TextEditingController().obs;
  final obscurePassConfirm = true.obs;

  @override
  void onClose() {
    pageController.value.dispose();
    namaController.value.dispose();
    emailController.value.dispose();
    noTelpController.value.dispose();
    passwordController.value.dispose();
    passwordConfirmController.value.dispose();
    super.onClose();
  }

  void checkRegister() async {
    showLoading();
    await Future.delayed(const Duration(milliseconds: 1000), () {
      Get.back();
      pageController.value.animateToPage(
        1,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOutCubic,
      );
    });
  }

  void cancelRegister() async {
    showLoading();
    await Future.delayed(const Duration(milliseconds: 1000), () {
      Get.back();
      pageController.value.animateToPage(
        0,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOutCubic,
      );
    });
  }

  void register() async {
    final formData = dio.FormData.fromMap({
      'name': namaController.value.text,
      'email': emailController.value.text,
      'phone_user': noTelpController.value.text,
      'password': passwordController.value.text,
      'password_confirmation': passwordConfirmController.value.text,
    });

    showLoading();

    try {
      final response = await registerProvider.register(formData);

      if (response.statusCode == 200) {
        Get.back();
        successSnackbar(
          'Register Berhasil',
          'Silahkan lakukan verifikasi email terlebih dahulu',
        );
        Get.offAndToNamed(
          '/verify',
          arguments: {
            'email': emailController.value.text,
            'phone': noTelpController.value.text,
          },
        );
      }
    } on dio.DioException catch (e) {
      Get.back();
      if (e.response?.statusCode == 422) {
        if (e.response?.data['email'] != null &&
            e.response?.data['phone_number'] != null) {
          infoSnackbar(
            'Register Gagal',
            'Email dan No. Telepon sudah digunakan',
          );
        } else if (e.response?.data['email'] != null &&
            e.response?.data['phone_number'] == null) {
          infoSnackbar(
            'Register Gagal',
            'Email sudah digunakan',
          );
        } else if (e.response?.data['email'] == null &&
            e.response?.data['phone_number'] != null) {
          infoSnackbar(
            'Register Gagal',
            'No. Telepon sudah digunakan',
          );
        }
      } else {
        failedSnackbar(
          'Register Gagal',
          'Ups sepertinya terjadi kesalahan. code(${e.response?.statusCode})',
        );
      }
    }
  }
}
