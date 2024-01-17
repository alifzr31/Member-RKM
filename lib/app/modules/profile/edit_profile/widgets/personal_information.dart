import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:member_rkm/app/components/base_text.dart';
import 'package:member_rkm/app/core/values/colors.dart';
import 'package:member_rkm/app/modules/profile/controller.dart';
import 'package:member_rkm/app/modules/profile/edit_profile/widgets/form_personalinfo.dart';

class PersonalInformation extends StatelessWidget {
  PersonalInformation({super.key});
  final controller = Get.find<ProfileController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
                    text: 'Informasi Pribadi',
                    bold: FontWeight.w600,
                  ),
                  InkResponse(
                    onTap: () => controller.enabledEditPersonal.value =
                        !controller.enabledEditPersonal.value,
                    child: BaseText(
                      text: controller.enabledEditPersonal.value
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
          controller.enabledEditPersonal.value
              ? FormPersonalInfoEdit()
              : FormPersonalInfoView(),
        ],
      ),
    );
  }
}
