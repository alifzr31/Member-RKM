import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:member_rkm/app/components/base_text.dart';
import 'package:member_rkm/app/core/values/colors.dart';
import 'package:member_rkm/app/core/values/gradient_color.dart';
import 'package:member_rkm/app/modules/benefit/components/card_level.dart';
import 'package:member_rkm/app/modules/benefit/controller.dart';

class HeaderBenefit extends StatelessWidget {
  HeaderBenefit({super.key});
  final controller = Get.find<BenefitController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SizedBox(
        height: 210,
        width: Get.width,
        child: Stack(
          children: [
            Container(
              height: 150,
              width: Get.width,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: controller.token.value == null ? whiteColor : null,
                gradient:
                    controller.token.value != null ? null : GradientColor.gold,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const BaseText(
                    text: 'Segera bergabung menjadi anggota member',
                    color: blackColor,
                    bold: FontWeight.w600,
                  ),
                  BaseText(
                    text:
                        'Daftarkan diri anda untuk menjadi membership Triwarna GRATIS',
                    size: 12,
                    color: Colors.grey.shade600,
                  ),
                ],
              ),
            ),
            Positioned(
              top: 90,
              height: 115,
              width: Get.width,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                children: const [
                  CardLevel(
                    loyaltyLevel: 'Silver',
                    barGradient: GradientColor.silver,
                    descChildren: [],
                  ),
                  CardLevel(
                    loyaltyLevel: 'Gold',
                    barGradient: GradientColor.gold,
                    descChildren: [],
                  ),
                  CardLevel(
                    loyaltyLevel: 'Platinum',
                    barGradient: GradientColor.platinum,
                    descChildren: [],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
