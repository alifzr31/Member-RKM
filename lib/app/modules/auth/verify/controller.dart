import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:member_rkm/app/core/values/show_loading.dart';
import 'package:member_rkm/app/core/values/snackbars.dart';
import 'package:member_rkm/app/data/providers/verify_provider.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:open_mail_app/open_mail_app.dart';

class VerifyController extends GetxController {
  final VerifyProvider verifyProvider;

  VerifyController({required this.verifyProvider});

  final pageController = PageController().obs;
  final currentPage = 0.obs;
  final type = Rx<String?>(null);
  final email = Rx<String?>(null);
  final phone = Rx<String?>(null);

  final formKey = GlobalKey<FormState>().obs;
  final otpController = TextEditingController().obs;

  @override
  void onInit() {
    // email.value = Get.arguments['email'];
    // phone.value = Get.arguments['phone'];
    email.value = 'alifzakya.r@gmail.com';
    phone.value = '081221112586';
    super.onInit();
  }

  @override
  void onClose() {
    pageController.value.dispose();
    otpController.value.dispose();
    super.onClose();
  }

  void sendVerify() async {
    final formData = dio.FormData.fromMap({
      'type': type.value,
      'value': type.value == 'wa' ? phone.value : email.value,
    });

    showLoading();

    try {
      final response = await verifyProvider.verify(formData);

      if (response.statusCode == 200) {
        Get.back();

        pageController.value.animateToPage(
          1,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOutCubic,
        );
      }
    } on dio.DioException catch (e) {
      Get.back();
      failedSnackbar(
        'Verifikasi Akun Gagal',
        e.response?.data['message'] ??
            'Ups sepertinya terjadi kesalahan. code(${e.response?.statusCode})',
      );
    }
  }

  void verifyWa() async {
    final formData = dio.FormData.fromMap({
      'value': phone.value,
      'otp': otpController.value.text,
    });

    showLoading();

    try {
      final response = await verifyProvider.verifyWa(formData);

      if (response.statusCode == 200) {
        Get.back();
        successSnackbar(
          'Verifikasi Berhasil',
          response.data['message'] ??
              'Silahkan log in menggunakan akun yang sudah di verifikasi',
        );
        Get.offAllNamed('/dashboard');
      }
    } on dio.DioException catch (e) {
      Get.back();
      failedSnackbar(
        'Verifikasi Gagal',
        e.response?.data['message'] ??
            'Ups sepertinya terjadi kesalahan. code:${e.response?.statusCode}',
      );
    }
  }

  void openMailApp() async {
    // final result = await OpenMailApp.openMailApp();
    await launchUrl(
      Uri.parse('https://mail.google.com/'),
      mode: LaunchMode.externalApplication,
    );

    // if (!result.didOpen && !result.canOpen) {
    //   Get.dialog(
    //     const AlertDialog(
    //       title: Text('No Apps'),
    //     ),
    //   );
    // } else if (!result.didOpen && result.canOpen) {
    //   Get.dialog(
    //     MailAppPickerDialog(mailApps: result.options),
    //   );
    // }
  }
}
