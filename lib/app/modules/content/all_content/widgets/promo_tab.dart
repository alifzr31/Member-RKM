import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:member_rkm/app/components/base_nodata.dart';
import 'package:member_rkm/app/components/base_refresh.dart';
import 'package:member_rkm/app/core/values/app_helpers.dart';
import 'package:member_rkm/app/core/values/colors.dart';
import 'package:member_rkm/app/modules/content/all_content/components/card_content.dart';
import 'package:member_rkm/app/modules/content/all_content/controller.dart';

class PromoTab extends StatelessWidget {
  PromoTab({super.key});
  final controller = Get.find<AllContentController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.promoLoading.value
          ? const Center(child: CircularProgressIndicator())
          : controller.promo.isEmpty
              ? BaseNoData(
                  title: 'Promo Kosong',
                  subtitle:
                      'Pastikan selalu pantau promo yang diadakan oleh RKM!',
                  labelButton: 'Refreh Promo',
                  onPressed: () {
                    controller.promoLoading.value = true;
                    controller.fetchPromo();
                  },
                )
              : BaseRefresh(
                  onRefresh: controller.refreshPromo,
                  child: ListView.builder(
                    padding: const EdgeInsets.all(15),
                    itemCount: controller.promo.length,
                    itemBuilder: (context, index) {
                      final promo = controller.promo[index];
                      final date = AppHelpers.dayDateFormat(
                          promo.createdAt ?? DateTime(0000));

                      return CardContent(
                        image: promo.featuredImage ?? '',
                        label: promo.category.toString().capitalize ?? '',
                        title: promo.title ?? '',
                        author: promo.authorId ?? '',
                        date: date,
                        labelColor: orangeColor,
                        onTap: () {
                          Get.toNamed(
                            '/detailContent',
                            arguments: {
                              'title': promo.title,
                              'slug': promo.slug,
                              'date': date,
                              'category': 'Promo',
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
