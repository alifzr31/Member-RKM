import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:member_rkm/app/components/base_text.dart';
import 'package:member_rkm/app/core/values/colors.dart';
import 'package:member_rkm/app/modules/dashboard/components/event/event_card.dart';
import 'package:member_rkm/app/modules/dashboard/controller.dart';

class EventBody extends StatelessWidget {
  EventBody({super.key});
  final controller = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Expanded(
        child: Column(
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BaseText(
                      text: 'Hadir di Keseruan Event RKM',
                      size: 16,
                      color: whiteColor,
                      bold: FontWeight.w600,
                    ),
                    BaseText(
                      text: 'Semua event RKM ga kalah seru disini',
                      size: 12,
                      color: greyTextColor,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: controller.storeLoading.value
                  ? ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.fromLTRB(15, 5, 15, 15),
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return EventCardLoading(
                          index: index,
                          dataLength: 5,
                        );
                      },
                    )
                  : RefreshIndicator(
                      onRefresh: () async {
                        controller.storeLoading.value = true;
                        await Future.delayed(const Duration(milliseconds: 2500),
                            () {
                          controller.storeLoading.value = false;
                        });
                      },
                      child: ListView.builder(
                        padding: const EdgeInsets.fromLTRB(15, 5, 15, 15),
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return EventCard(
                            image: 'event_sample.png',
                            title: 'Anniversary Celebration RKM Cirebon',
                            desc: 'Anniversary Celebration RKM Cirebon',
                            index: index,
                            dataLength: 5,
                            onPressed: () {},
                          );
                        },
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
