import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:member_rkm/app/components/base_text.dart';
import 'package:member_rkm/app/core/values/colors.dart';
import 'package:member_rkm/app/modules/benefit/controller.dart';

class BodyBenefit extends StatelessWidget {
  BodyBenefit({super.key});
  final controller = Get.find<BenefitController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => DefaultTabController(
        length: 3,
        initialIndex: controller.currentTab.value,
        child: Expanded(
          child: Column(
            children: [
              TabBar(
                onTap: (index) => controller.currentTab.value = index,
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorColor: orangeColor,
                tabs: [
                  Tab(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/images/silver_medal.svg',
                          width: 20,
                        ),
                        const SizedBox(width: 5),
                        BaseText(
                          text: 'Silver',
                          color: controller.currentTab.value == 0
                              ? whiteColor
                              : greyTextColor,
                          bold: controller.currentTab.value == 0
                              ? FontWeight.w600
                              : FontWeight.w500,
                        ),
                      ],
                    ),
                  ),
                  Tab(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/images/gold_medal.svg',
                          width: 20,
                        ),
                        const SizedBox(width: 5),
                        BaseText(
                          text: 'Gold',
                          color: controller.currentTab.value == 1
                              ? whiteColor
                              : greyTextColor,
                          bold: controller.currentTab.value == 1
                              ? FontWeight.w600
                              : FontWeight.w500,
                        ),
                      ],
                    ),
                  ),
                  Tab(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/images/platinum_medal.svg',
                          width: 20,
                        ),
                        const SizedBox(width: 5),
                        BaseText(
                          text: 'Platinum',
                          color: controller.currentTab.value == 2
                              ? whiteColor
                              : greyTextColor,
                          bold: controller.currentTab.value == 2
                              ? FontWeight.w600
                              : FontWeight.w500,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(
                  physics: const NeverScrollableScrollPhysics(),
                  children: List.generate(
                    controller.tabViewItem.length,
                    (index) => controller.tabViewItem[index],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
