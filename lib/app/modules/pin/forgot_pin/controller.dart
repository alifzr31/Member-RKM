import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:member_rkm/app/core/values/show_loading.dart';
import 'package:member_rkm/app/data/providers/forgotpin_provider.dart';
import 'package:member_rkm/app/modules/dashboard/controller.dart';

class ForgotPinController extends GetxController {
  final ForgotPinProvider forgotPinProvider;

  ForgotPinController({required this.forgotPinProvider});

  final currentPage = 0.obs;
  final pageController = PageController().obs;

  final chooseVerify = Rx<String?>(null);
  final email = Rx<String?>(null);
  final phoneNumber = Rx<String?>(null);

  final formKey = GlobalKey<FormState>().obs;
  final otpController = TextEditingController().obs;

  @override
  void onInit() {
    final userController = Get.find<DashboardController>();
    email.value = userController.profile.value?.emailUser;
    phoneNumber.value = userController.profile.value?.phoneUser;
    super.onInit();
  }

  @override
  void onClose() {
    pageController.value.dispose();
    otpController.value.dispose();
    super.onClose();
  }

  Future<void> movePage(int page) async {
    pageController.value.animateToPage(
      page,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOutCubic,
    );
  }

  void sendEmail() async {
    final formData = dio.FormData.fromMap({
      'email': email.value,
    });
    
    showLoading();

    await Future.delayed(const Duration(milliseconds: 1500), () {
      Get.back();
      print(formData.fields);
      movePage(1);
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
      movePage(1);
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
      Get.offAndToNamed('/resetPin');
    });
  }
}
