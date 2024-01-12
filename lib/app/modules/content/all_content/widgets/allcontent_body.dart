import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:member_rkm/app/components/base_text.dart';
import 'package:member_rkm/app/core/values/colors.dart';
import 'package:member_rkm/app/modules/content/all_content/controller.dart';
import 'package:member_rkm/app/modules/content/all_content/widgets/event_tab.dart';
import 'package:member_rkm/app/modules/content/all_content/widgets/promo_tab.dart';

class AllContentBody extends StatelessWidget {
  AllContentBody({super.key});
  final controller = Get.find<AllContentController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => DefaultTabController(
        length: 2,
        initialIndex: controller.currentTab.value,
        child: Column(
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.fromLTRB(15, 15, 15, 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BaseText(
                      text: 'Dapatkan Event & promo menarik disini',
                      size: 16,
                      bold: FontWeight.w600,
                    ),
                    BaseText(
                      text: 'Lihat Event dan promo pada banner disini!',
                      size: 12,
                      color: greyTextColor,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  TabBar(
                    onTap: (index) => controller.currentTab.value = index,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicatorColor: orangeColor,
                    tabs: [
                      Tab(
                        child: BaseText(
                          text: 'Event',
                          color: controller.currentTab.value == 0
                              ? whiteColor
                              : greyTextColor,
                          bold: controller.currentTab.value == 0
                              ? FontWeight.w600
                              : FontWeight.w500,
                        ),
                      ),
                      Tab(
                        child: BaseText(
                          text: 'Promo',
                          color: controller.currentTab.value == 1
                              ? whiteColor
                              : greyTextColor,
                          bold: controller.currentTab.value == 1
                              ? FontWeight.w600
                              : FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        EventTab(),
                        PromoTab(),
                      ],
                    ),
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
