import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:member_rkm/app/components/base_text.dart';
import 'package:member_rkm/app/core/values/colors.dart';
import 'package:member_rkm/app/modules/dashboard/controller.dart';
import 'package:member_rkm/app/modules/point/controller.dart';
import 'package:member_rkm/app/modules/point/my_point/components/pointinfo_box.dart';

class MyPointHeader extends StatelessWidget {
  MyPointHeader({super.key});
  final controller = Get.find<PointController>();
  final userController = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const BaseText(
            text: 'Tukar poin anda dengan hadiah menarik',
            color: whiteColor,
            size: 16,
            bold: FontWeight.w600,
          ),
          const BaseText(
            text: 'Minimal penukaran 50 poin!',
            color: greyTextColor,
            size: 12,
          ),
          const SizedBox(height: 15),
          PointInfoBox(
            totalPoint: int.parse(userController.profile.value?.point ?? ''),
            totalTransaction: userController.profile.value?.totalSpending ?? 0,
            category: userController.profile.value?.category ?? '',
            lastTransaction: DateTime.now(),
          ),
        ],
      ),
    );
  }
}
