import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoardController extends GetxController {
  final currentPage = 0.obs;
  final pageController = PageController().obs;
  
  final images = [
    'onboard1.svg',
    'onboard2.svg',
    'onboard3.svg',
  ].obs;
  
  final titles = [
    'Beragam produk dan bahan bangunan ',
    'Membership Gratis',
    'Temukan lokasi RKM terdekat Anda',
  ].obs;

  final subtitles = [
    'Jadikan rumah impian Anda terpenuhi dengan barang  kualitas terbaik di toko RKM',
    'Mulai dari Silver, Gold, dan Platinum. Kamu bisa menukarkan point dengan hadiah menarik',
    'Kunjungi RKM terdekat anda dan ambil promo hadiahnya',
  ].obs;

  @override
  void onClose() {
    pageController.value.dispose();
    super.onClose();
  }

  void nextPage() {
    pageController.value.nextPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOutCubic,
    );
  }

  void skipOrLogin() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (currentPage.value == (titles.length - 1)) {
      sharedPreferences.setBool('opened', true);
      Get.offAllNamed('/login');
    } else {
      pageController.value.animateToPage(
        titles.length - 1,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOutCubic,
      );
    }
  }

  void back() {
    pageController.value.animateToPage(
      0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOutCubic,
    );
  }

  void getStarted() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool('opened', true);
    Get.offAllNamed('/dashboard');
  }
}
