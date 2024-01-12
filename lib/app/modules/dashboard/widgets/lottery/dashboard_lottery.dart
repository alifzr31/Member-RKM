import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:member_rkm/app/components/base_text.dart';
import 'package:member_rkm/app/core/values/colors.dart';
import 'package:member_rkm/app/modules/dashboard/controller.dart';
import 'package:member_rkm/app/modules/dashboard/widgets/lottery/body_lottery.dart';

class DashboardLottery extends StatelessWidget {
  DashboardLottery({super.key});
  final controller = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          Container(
            height: 80,
            width: Get.width,
            color: blackColor,
            child: const Center(
              child: BaseText(
                text: 'Undian',
                size: 26,
                bold: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: controller.token.value == null
                ? const Center(
                  child: BaseText(text: 'Anda belum melakukan log in'),
                )
                : BodyLottery(),
          ),
        ],
      ),
    );
  }
}
