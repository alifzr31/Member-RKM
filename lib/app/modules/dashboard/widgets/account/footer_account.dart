import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:member_rkm/app/components/base_button.dart';
import 'package:member_rkm/app/components/base_text.dart';
import 'package:member_rkm/app/core/values/colors.dart';
import 'package:member_rkm/app/core/values/dialogs.dart';
import 'package:member_rkm/app/modules/dashboard/controller.dart';

class FooterAccount extends StatelessWidget {
  FooterAccount({super.key});
  final controller = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
        child: controller.token.value == null
            ? Align(
                alignment: Alignment.bottomCenter,
                child: BaseText(
                  text:
                      '${controller.appName.value} v${controller.currentVersion.value}',
                  size: 12,
                  color: greyTextColor,
                ),
              )
            : Column(
                children: [
                  SizedBox(
                    width: Get.width,
                    child: BaseButton(
                      bgColor: redColor,
                      fgColor: whiteColor,
                      label: 'Log Out',
                      onPressed: () {
                        confirmDialog(
                          context,
                          title: 'Apakah Anda Yakin?',
                          desc: 'Apakah anda yakin ingin log out sekarang?',
                          okPressed: controller.logout,
                        );
                      },
                    ),
                  ),
                  BaseText(
                    text:
                        '${controller.appName.value} v${controller.currentVersion.value}',
                    size: 12,
                    color: greyTextColor,
                  ),
                ],
              ),
      ),
    );
  }
}
