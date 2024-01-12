import 'package:boxicons/boxicons.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:member_rkm/app/core/values/colors.dart';
import 'package:member_rkm/app/modules/dashboard/controller.dart';

class DashboardBottomNav extends StatelessWidget {
  DashboardBottomNav({super.key});
  final controller = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => FlashyTabBar(
        selectedIndex: controller.currentIndex.value,
        onItemSelected: (index) => controller.currentIndex.value = index,
        backgroundColor: blackColor,
        showElevation: false,
        animationDuration: const Duration(milliseconds: 300),
        height: 55,
        iconSize: 25,
        items: [
          FlashyTabBarItem(
            activeColor: orangeColor,
            inactiveColor: const Color(0xFF979797),
            icon: const Icon(Boxicons.bxs_home),
            title: const Text('Beranda'),
          ),
          FlashyTabBarItem(
            activeColor: orangeColor,
            inactiveColor: const Color(0xFF979797),
            icon: const Icon(Boxicons.bxs_gift),
            title: const Text('Undian'),
          ),
          FlashyTabBarItem(
            activeColor: orangeColor,
            inactiveColor: const Color(0xFF979797),
            icon: const Icon(Boxicons.bxs_map),
            title: const Text('Toko'),
          ),
          FlashyTabBarItem(
            activeColor: orangeColor,
            inactiveColor: const Color(0xFF979797),
            icon: const Icon(Boxicons.bxs_user),
            title: const Text('Akun'),
          ),
        ],
      ),
    );
  }
}
