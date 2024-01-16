import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:member_rkm/app/core/values/show_loading.dart';
import 'package:member_rkm/app/core/values/snackbars.dart';
import 'package:member_rkm/app/data/providers/pin_provider.dart';

class PinController extends GetxController {
  final PinProvider pinProvider;

  PinController({required this.pinProvider});

  final currentPage = 0.obs;
  final pageController = PageController().obs;

  final createNewPin = ''.obs;
  final createConfirmPin = ''.obs;
  final errorCreate = false.obs;

  final changeCurrentPin = ''.obs;
  final errorCheckPin = false.obs;
  final changeNewPin = ''.obs;
  final errorChangeNewPin = false.obs;
  final changeConfirmPin = ''.obs;
  final errorChange = false.obs;

  final enteredPin = ''.obs;

  @override
  void onClose() {
    pageController.value.dispose();
    super.onClose();
  }

  void enterPin(int number) {
    if (Get.currentRoute == '/createPin') {
      errorCreate.value = false;
      if (currentPage.value == 0) {
        if (createNewPin.value.length < 6) {
          createNewPin.value += number.toString();
        }

        if (createNewPin.value.length == 6) {
          pageController.value.animateToPage(
            1,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOutCubic,
          );
        }
      } else {
        if (createConfirmPin.value.length < 6) {
          createConfirmPin.value += number.toString();
        }

        if (createConfirmPin.value.length == 6) {
          if (createConfirmPin.value != createNewPin.value) {
            createConfirmPin.value = '';
            errorCreate.value = true;
          } else {
            errorCreate.value = false;
            createPin();
          }
        }
      }
    } else if (Get.currentRoute == '/changePin') {
      errorCheckPin.value = false;
      errorChange.value = false;
      if (currentPage.value == 0) {
        if (changeCurrentPin.value.length < 6) {
          changeCurrentPin.value += number.toString();
        }

        if (changeCurrentPin.value.length == 6) {
          checkPin();
        }
      } else if (currentPage.value == 1) {
        errorChangeNewPin.value = false;
        if (changeNewPin.value.length < 6) {
          changeNewPin.value += number.toString();
        }

        if (changeNewPin.value.length == 6) {
          if (changeNewPin.value == changeCurrentPin.value) {
            changeNewPin.value = '';
            errorChangeNewPin.value = true;
          } else {
            pageController.value.animateToPage(
              2,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOutCubic,
            );
          }
        }
      } else {
        if (changeConfirmPin.value.length < 6) {
          changeConfirmPin.value += number.toString();
        }

        if (changeConfirmPin.value.length == 6) {
          if (changeConfirmPin.value != changeNewPin.value) {
            changeConfirmPin.value = '';
            errorChange.value = true;
          } else {
            errorChange.value = false;
            changePin();
          }
        }
      }
    } else {
      if (enteredPin.value.length < 6) {
        enteredPin.value += number.toString();
      }

      if (enteredPin.value.length == 6) {
        if (enteredPin.value == '123456') {
          if (kDebugMode) {
            print('Success');
          }
        } else {
          enteredPin.value = '';
        }
      }
    }
  }

  void deletePin() {
    if (Get.currentRoute == '/createPin') {
      if (currentPage.value == 0) {
        if (createNewPin.value.isNotEmpty) {
          createNewPin.value =
              createNewPin.value.substring(0, createNewPin.value.length - 1);
        }
      } else {
        if (createConfirmPin.value.isNotEmpty) {
          createConfirmPin.value = createConfirmPin.value
              .substring(0, createConfirmPin.value.length - 1);
        }
      }
    } else if (Get.currentRoute == '/changePin') {
      if (currentPage.value == 0) {
        if (changeCurrentPin.value.isNotEmpty) {
          changeCurrentPin.value = changeCurrentPin.value
              .substring(0, changeCurrentPin.value.length - 1);
        }
      } else if (currentPage.value == 1) {
        if (changeNewPin.value.isNotEmpty) {
          changeNewPin.value =
              changeNewPin.value.substring(0, changeNewPin.value.length - 1);
        }
      } else {
        if (changeConfirmPin.value.isNotEmpty) {
          changeConfirmPin.value = changeConfirmPin.value
              .substring(0, changeConfirmPin.value.length - 1);
        }
      }
    } else {
      if (enteredPin.value.isNotEmpty) {
        enteredPin.value =
            enteredPin.value.substring(0, enteredPin.value.length - 1);
      }
    }
  }

  void createPin() async {
    final formData = dio.FormData.fromMap({
      '_method': 'PUT',
      'pin': createNewPin.value,
      'pin_confirmation': createConfirmPin.value,
    });

    showLoading();

    try {
      final response = await pinProvider.updatePin(formData);

      if (response.statusCode == 200) {
        Get.back();

        Get.offAndToNamed(
          '/success',
          arguments: {
            'title': 'Buat PIN Berhasil',
            'subtitle': 'PIN anda berhasil dibuat dan sudah bisa digunakan',
          },
        );
      }
    } on dio.DioException catch (e) {
      Get.back();
      failedSnackbar(
        'Buat PIN Gagal',
        'Ups sepertinya terjadi kesalahan. code(${e.response?.statusCode})',
      );
    }
  }

  void checkPin() async {
    final formData = dio.FormData.fromMap({
      'old_pin': changeCurrentPin.value,
    });

    showLoading();

    try {
      final response = await pinProvider.checkPin(formData);

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

      if (e.response?.statusCode == 422) {
        errorCheckPin.value = true;
        changeCurrentPin.value = '';
      } else {
        failedSnackbar(
          'Ganti PIN Gagal',
          'Ups sepertinya terjadi kesalahan. code(${e.response?.statusCode})',
        );
      }
    }
  }

  void changePin() async {
    final formData = dio.FormData.fromMap({
      '_method': 'PUT',
      'new_pin': changeNewPin.value,
      'new_pin_confirmation': changeConfirmPin.value,
    });

    showLoading();

    try {
      final response = await pinProvider.updatePin(formData);

      if (response.statusCode == 200) {
        Get.back();

        Get.offAndToNamed(
          '/success',
          arguments: {
            'title': 'Ganti PIN Berhasil',
            'subtitle': 'PIN anda berhasil diganti',
          },
        );
      }
    } on dio.DioException catch (e) {
      Get.back();
      failedSnackbar(
        'Ganti PIN Gagal',
        'Ups sepertinya terjadi kesalahan. code(${e.response?.statusCode})',
      );
    }
  }
}
