import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:member_rkm/app/components/base_shimmer.dart';
import 'package:member_rkm/app/components/base_text.dart';
import 'package:member_rkm/app/core/values/colors.dart';
import 'package:member_rkm/app/core/values/gradient_color.dart';
import 'package:member_rkm/app/modules/dashboard/components/home/header_menu.dart';
import 'package:member_rkm/app/modules/dashboard/components/home/membercard_home.dart';
import 'package:member_rkm/app/modules/dashboard/controller.dart';

class HeaderHome extends StatelessWidget {
  HeaderHome({super.key});
  final controller = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const BaseText(
              text: 'Selamat Datang di RKM!',
              size: 16,
              color: whiteColor,
              bold: FontWeight.w600,
            ),
            const BaseText(
              text: 'Yuk, daftar membership untuk mendapatkan hadiah menarik',
              size: 12,
              color: greyTextColor,
            ),
            const SizedBox(height: 10),
            controller.token.value == null
                ? const MemberCardHomeNoLogin(
                    gradient: GradientColor.noMember,
                  )
                : controller.profile.value == null
                    ? const BaseShimmer(
                        child: MemberCardHomeNoLogin(color: Colors.grey),
                      )
                    : MemberCardHomeLogin(
                        category:
                            controller.profile.value?.category?.toLowerCase() ??
                                '',
                        noMember: controller.profile.value?.code ?? '',
                        email: controller.profile.value?.emailUser ?? '',
                        phoneNumber:
                            controller.profile.value?.phoneUser ?? '',
                        totalPoint: controller.profile.value?.point ?? '',
                        totalVoucher: controller
                                .profile.value?.addOn?.voucherTotal
                                .toString() ??
                            '',
                      ),
            const SizedBox(height: 10),
            const HeaderMenu(),
          ],
        ),
      ),
    );
  }
}
