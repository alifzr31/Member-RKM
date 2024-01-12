import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:member_rkm/app/modules/dashboard/controller.dart';
import 'package:member_rkm/app/modules/dashboard/widgets/account/dashboard_account.dart';
import 'package:member_rkm/app/modules/dashboard/widgets/home/dashboard_home.dart';
import 'package:member_rkm/app/modules/dashboard/widgets/lottery/dashboard_lottery.dart';
import 'package:member_rkm/app/modules/dashboard/widgets/store/dashboard_store.dart';

class DashboardBody extends StatelessWidget {
  DashboardBody({super.key});
  final controller = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => IndexedStack(
        index: controller.currentIndex.value,
        children: [
          DashboardHome(),
          DashboardLottery(),
          DashboardStore(),
          DashboardAccount(),
        ],
      ),
    );
  }
}
