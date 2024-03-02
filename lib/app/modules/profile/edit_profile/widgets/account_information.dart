import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:member_rkm/app/components/base_text.dart';
import 'package:member_rkm/app/core/values/colors.dart';
import 'package:member_rkm/app/modules/dashboard/controller.dart';
import 'package:member_rkm/app/modules/profile/controller.dart';
import 'package:member_rkm/app/modules/profile/edit_profile/widgets/form_accountinfo.dart';

class AccountInformation extends StatelessWidget {
  AccountInformation({super.key});
  final controller = Get.find<ProfileController>();
  final userController = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          Material(
            color: bgSectionColor,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const BaseText(
                    text: 'Informasi Akun',
                    bold: FontWeight.w600,
                  ),
                  if (userController.profile.value?.phoneUser == null)
                    InkResponse(
                      onTap: () => controller.enabledEditAccount.value =
                          !controller.enabledEditAccount.value,
                      child: BaseText(
                        text: controller.enabledEditAccount.value
                            ? 'Selesai'
                            : 'Ubah',
                        color: orangeColor,
                        bold: FontWeight.w500,
                      ),
                    ),
                ],
              ),
            ),
          ),
          FormAccountInfoView(),
        ],
      ),
    );
  }
}
