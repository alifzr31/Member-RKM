import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:member_rkm/app/core/values/show_loading.dart';
import 'package:member_rkm/app/data/providers/pin_provider.dart';

class RedeemPinController extends GetxController {
  final PinProvider pinProvider;

  RedeemPinController({required this.pinProvider});

  final enteredPin = ''.obs;
  final errorPin = false.obs;

  void enterPin(int number, BuildContext context) {
    errorPin.value = false;

    if (enteredPin.value.length < 6) {
      enteredPin.value += number.toString();
    }

    if (enteredPin.value.length == 6) {
      if (enteredPin.value != '123456') {
        errorPin.value = true;
        enteredPin.value = '';
      } else {
        errorPin.value = false;
        redeemPoint(context);
      }
    }
  }

  void deletePin() {
    if (enteredPin.value.isNotEmpty) {
      enteredPin.value =
          enteredPin.value.substring(0, enteredPin.value.length - 1);
    }
  }

  void redeemPoint(BuildContext context) async {
    final formData = dio.FormData.fromMap({});

    print(formData);

    showLoading();

    await Future.delayed(const Duration(milliseconds: 1500), () {
      Get.back();
      Get.offAndToNamed(
        '/success',
        arguments: {
          'title': 'Redeem Poin Berhasil',
          'subtitle': 'Selamat, anda berhasil menukarkan 100 poin dengan Setrika Cosmos dari toko cabang RKM Ahmad Yani (Kota Bandung)',
        },
      );
    });
  }
}
