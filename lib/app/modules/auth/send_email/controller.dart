import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:member_rkm/app/core/values/show_loading.dart';
import 'package:member_rkm/app/core/values/snackbars.dart';
import 'package:member_rkm/app/data/providers/sendemail_provider.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:open_mail_app/open_mail_app.dart';

class SendEmailController extends GetxController {
  final SendEmailProvider sendEmailProvider;

  SendEmailController({required this.sendEmailProvider});

  final pageController = PageController().obs;
  final email = Rx<String?>(null);

  @override
  void onInit() {
    email.value = Get.arguments;
    super.onInit();
  }

  @override
  void onClose() {
    pageController.value.dispose();
    super.onClose();
  }

  void sendEmail() async {
    final formData = dio.FormData.fromMap({
      'email': email.value,
    });

    showLoading();

    try {
      final response = await sendEmailProvider.sendEmail(formData);

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
        'Ups sepertinya terjadi kesalahan. code(${e.response?.statusCode})',
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
