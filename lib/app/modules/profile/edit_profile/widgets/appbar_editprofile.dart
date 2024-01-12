import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:member_rkm/app/components/base_appbar.dart';
import 'package:member_rkm/app/components/base_text.dart';
import 'package:member_rkm/app/core/values/colors.dart';
import 'package:member_rkm/app/modules/profile/controller.dart';

class AppbarEditProfile extends StatelessWidget implements PreferredSizeWidget {
  AppbarEditProfile({
    Key? key,
    required this.preferredSize,
  }) : super(key: key);

  @override
  final Size preferredSize;

  final controller = Get.find<ProfileController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => BaseAppBar(
        preferredSize: preferredSize,
        bgColor: blackColor,
        fgColor: whiteColor,
        title: 'Ubah Profil',
        action: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: InkResponse(
              onTap: controller.enabledEditAccount.value ||
                      controller.enabledEditPersonal.value ||
                      controller.profileImage.value != null
                  ? () {
                      if (controller.formKeyEditProfile.value.currentState
                              ?.validate() ??
                          false) {
                        controller.errorMarital.value = false;
                        controller.editProfile();
                      } else {
                        controller.errorMarital.value = true;
                      }
                    }
                  : null,
              child: BaseText(
                text: 'Simpan',
                color: controller.enabledEditAccount.value ||
                        controller.enabledEditPersonal.value ||
                        controller.profileImage.value != null
                    ? whiteColor
                    : greyTextColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
