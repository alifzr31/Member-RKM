import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:member_rkm/app/core/values/colors.dart';
import 'package:member_rkm/app/core/values/confirm_dialog.dart';
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
      successDialog(
        context,
        title: 'Tukar Poin Berhasil',
        descChildren: const [
          TextSpan(
            text: 'Selamat, anda berhasil menukarkan ',
          ),
          TextSpan(
            text: '100 Poin ',
            style: TextStyle(
              color: orangeColor,
              fontWeight: FontWeight.w600,
            ),
          ),
          TextSpan(
            text: 'dengan ',
          ),
          TextSpan(
            text: 'Setrika Cosmos ',
            style: TextStyle(
              color: orangeColor,
              fontWeight: FontWeight.w600,
            ),
          ),
          TextSpan(
            text: 'dari toko cabang ',
          ),
          TextSpan(
            text: 'RKM Ahmad Yani (Kota Bandung)',
            style: TextStyle(
              color: orangeColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
        okPressed: () {
          Get.back();
          Get.offAllNamed('/dashboard');
        },
      );
    });
  }
}
