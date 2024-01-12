import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:member_rkm/app/components/base_text.dart';
import 'package:member_rkm/app/core/values/colors.dart';
import 'package:member_rkm/app/modules/dashboard/controller.dart';
import 'package:member_rkm/app/modules/dashboard/widgets/account/footer_account.dart';
import 'package:member_rkm/app/modules/dashboard/widgets/account/header_account.dart';
import 'package:member_rkm/app/modules/dashboard/widgets/account/menu_account.dart';

class DashboardAccount extends StatelessWidget {
  DashboardAccount({super.key});
  final controller = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.token.value == null
          ? Column(
            children: [
                Container(
                  height: 80,
                  width: Get.width,
                  color: blackColor,
                  child: const Center(
                    child: BaseText(
                      text: 'Akun',
                      size: 26,
                      bold: FontWeight.bold,
                    ),
                  ),
                ),
                HeaderAccount(),
                Expanded(child: FooterAccount()),

            ],
          )
          : ListView(
              padding: EdgeInsets.zero,
              physics: const ClampingScrollPhysics(),
              children: [
                Container(
                  height: 80,
                  width: Get.width,
                  color: blackColor,
                  child: const Center(
                    child: BaseText(
                      text: 'Akun',
                      size: 26,
                      bold: FontWeight.bold,
                    ),
                  ),
                ),
                HeaderAccount(),
                MenuAccount(),
                FooterAccount(),
              ],
            ),
    );
  }
}
