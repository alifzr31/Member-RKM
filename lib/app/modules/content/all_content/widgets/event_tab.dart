import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:member_rkm/app/components/base_nodata.dart';
import 'package:member_rkm/app/components/base_refresh.dart';
import 'package:member_rkm/app/core/values/app_helpers.dart';
import 'package:member_rkm/app/core/values/gradient_color.dart';
import 'package:member_rkm/app/modules/content/all_content/components/card_content.dart';
import 'package:member_rkm/app/modules/content/all_content/controller.dart';

class EventTab extends StatelessWidget {
  EventTab({super.key});
  final controller = Get.find<AllContentController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.eventLoading.value
          ? const Center(child: CircularProgressIndicator())
          : controller.event.isEmpty
              ? BaseNoData(
                  title: 'Event Kosong',
                  subtitle: 'Pastikan selalu pantau event yang diadakan oleh RKM!',
                  labelButton: 'Refreh Event',
                  onPressed: () {
                    controller.eventLoading.value = true;
                    controller.fetchEvent();
                  },
                )
              : BaseRefresh(
                  onRefresh: controller.refreshEvent,
                  child: ListView.builder(
                    padding: const EdgeInsets.all(15),
                    itemCount: controller.event.length,
                    itemBuilder: (context, index) {
                      final event = controller.event[index];
                      final date = AppHelpers.dayDateFormat(
                          event.createdAt ?? DateTime(0000));

                      return CardContent(
                        image: event.featuredImage ?? '',
                        label: event.category.toString().capitalize ?? '',
                        title: event.title ?? '',
                        author: event.authorId ?? '',
                        date: date,
                        labelGradient: GradientColor.gold,
                        onTap: () {
                          Get.toNamed(
                            '/detailContent',
                            arguments: {
                              'title': event.title,
                              'slug': event.slug,
                              'date': date,
                              'category': 'Event',
                            },
                          );
                        },
                      );
                    },
                  ),
                ),
    );
  }
}
