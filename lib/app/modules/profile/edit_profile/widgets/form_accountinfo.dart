import 'package:boxicons/boxicons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:member_rkm/app/components/base_formgroupfield.dart';
import 'package:member_rkm/app/core/values/app_helpers.dart';
import 'package:member_rkm/app/core/values/colors.dart';
import 'package:member_rkm/app/modules/dashboard/controller.dart';
import 'package:member_rkm/app/modules/profile/controller.dart';
import 'package:member_rkm/app/modules/profile/edit_profile/components/item_field.dart';

class FormAccountInfoView extends StatelessWidget {
  FormAccountInfoView({super.key});
  final controller = Get.find<ProfileController>();
  final userController = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        width: Get.width,
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ItemField(
              label: 'Username',
              value: userController.profile.value?.username ?? '',
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ItemField(
                  label: 'Email',
                  value: controller.showEmail.value
                      ? userController.profile.value?.emailUser ?? ''
                      : AppHelpers.maskEmail(
                          userController.profile.value?.emailUser ?? ''),
                ),
                IconButton(
                  onPressed: () =>
                      controller.showEmail.value = !controller.showEmail.value,
                  icon: const Icon(
                    Boxicons.bxs_show,
                    color: orangeColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            controller.enabledEditAccount.value
                ? BaseFormGroupField(
                    label: 'No. Telepon',
                    hint: 'No. Telepon',
                    keyboardType: TextInputType.phone,
                    controller: controller.noTelpController.value,
                    validator: (value) {
                      if (value!.length < 11) {
                        return 'Jumlah no. telepon minimal 11 digit';
                      }

                      return null;
                    },
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ItemField(
                        label: 'No. Telepon',
                        value: userController.profile.value?.phoneUser == null
                            ? '-'
                            : controller.showPhoneNumber.value
                                ? userController.profile.value?.phoneUser ??
                                    ''
                                : AppHelpers.maskPhoneNumber(
                                    userController.profile.value?.phoneUser ??
                                        ''),
                      ),
                      if (userController.profile.value?.phoneUser != null)
                        IconButton(
                          onPressed: () => controller.showPhoneNumber.value =
                              !controller.showPhoneNumber.value,
                          icon: const Icon(
                            Boxicons.bxs_show,
                            color: orangeColor,
                          ),
                        ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
