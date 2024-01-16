import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:member_rkm/app/core/values/show_loading.dart';
import 'package:member_rkm/app/data/providers/pin_provider.dart';

class ResetPinController extends GetxController {
  final PinProvider pinProvider;

  ResetPinController({required this.pinProvider});

  final currentPage = 0.obs;
  final pageController = PageController().obs;

  final resetNewPin = ''.obs;
  final resetConfirmPin = ''.obs;
  final errorReset = false.obs;

  @override
  void onClose() {
    pageController.value.dispose();
    super.onClose();
  }

  void enterPin(int number) {
    errorReset.value = false;

    if (currentPage.value == 0) {
      if (resetNewPin.value.length < 6) {
        resetNewPin.value += number.toString();
      }

      if (resetNewPin.value.length == 6) {
        pageController.value.animateToPage(
          1,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOutCubic,
        );
      }
    } else {
      if (resetConfirmPin.value.length < 6) {
        resetConfirmPin.value += number.toString();
      }

      if (resetConfirmPin.value.length == 6) {
        if (resetConfirmPin.value != resetNewPin.value) {
          resetConfirmPin.value = '';
          errorReset.value = true;
        } else {
          errorReset.value = false;
          resetPin();
        }
      }
    }
  }

  void deletePin() {
    if (currentPage.value == 0) {
      if (resetNewPin.value.isNotEmpty) {
        resetNewPin.value =
            resetNewPin.value.substring(0, resetNewPin.value.length - 1);
      }
    } else {
      if (resetConfirmPin.value.isNotEmpty) {
        resetConfirmPin.value = resetConfirmPin.value
            .substring(0, resetConfirmPin.value.length - 1);
      }
    }
  }

  void resetPin() async {
    final formData = dio.FormData.fromMap({
      'new_pin': resetNewPin.value,
      'confirm_pin': resetConfirmPin.value,
    });

    showLoading();

    await Future.delayed(const Duration(milliseconds: 1500), () {
      Get.back();
      print(formData.fields);
      Get.offAndToNamed(
        '/success',
        arguments: {
          'title': 'Reset PIN Berhasil',
          'subtitle': 'PIN anda sudah berhasil di atur ulang',
        },
      );
    });
  }
}
