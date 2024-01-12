import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:member_rkm/app/core/values/show_loading.dart';
import 'package:member_rkm/app/core/values/snackbars.dart';
import 'package:member_rkm/app/data/providers/login_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  final LoginProvider loginProvider;

  LoginController({required this.loginProvider});

  final formKey = GlobalKey<FormState>().obs;
  final usernameController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  final obscurePass = true.obs;

  @override
  void onClose() {
    usernameController.value.dispose();
    passwordController.value.dispose();
    obscurePass.value = true;
    super.onClose();
  }

  void login() async {
    final formData = dio.FormData.fromMap({
      'username': usernameController.value.text,
      'password': passwordController.value.text,
    });

    showLoading();

    try {
      final response = await loginProvider.login(formData);

      if (response.statusCode == 200) {
        Get.back();

        SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        sharedPreferences.setString('token', response.data['token']);
        sharedPreferences.setString('password', passwordController.value.text);
        Get.offAllNamed('/dashboard');
      }
    } on dio.DioException catch (e) {
      Get.back();
      if (e.response?.statusCode == 401) {
        infoSnackbar(
          'Log In Gagal',
          'Username atau password yang anda masukkan salah',
        );
      } else if (e.response?.statusCode == 403) {
        infoSnackbar(
          'Log In Gagal',
          'Akun anda belum aktif. Silahkan verifikasi akun terlebih dahulu',
        );
        Get.offAndToNamed(
          '/sendEmail',
          arguments: e.response?.data['email'],
        );
      } else {
        failedSnackbar(
          'Log In Gagal',
          'Ups sepertinya terjadi kesalahan. code(${e.response?.statusCode})',
        );
      }
    }
  }
}
