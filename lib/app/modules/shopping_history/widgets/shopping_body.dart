import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:member_rkm/app/components/base_bottomsheet.dart';
import 'package:member_rkm/app/components/base_refresh.dart';
import 'package:member_rkm/app/components/base_shimmer.dart';
import 'package:member_rkm/app/modules/shopping_history/components/shopping_card.dart';
import 'package:member_rkm/app/modules/shopping_history/controller.dart';
import 'package:member_rkm/app/modules/shopping_history/widgets/shoppingdetail_widget.dart';

class ShoppingBody extends StatelessWidget {
  ShoppingBody({super.key});
  final controller = Get.find<ShoppingController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.shoppingLoading.value
          ? ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(15),
              itemCount: 25,
              itemBuilder: (context, index) {
                return SizedBox(
                  height: 130,
                  width: Get.width,
                  child: const BaseShimmer(
                    child: Card(
                      margin: EdgeInsets.only(bottom: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                  ),
                );
              },
            )
          : BaseRefresh(
              onRefresh: controller.refreshShoppingHistory,
              child: ListView.builder(
                padding: const EdgeInsets.all(15),
                itemCount: controller.shoppingHistory.length,
                itemBuilder: (context, index) {
                  final shoppingHistory = controller.shoppingHistory[index];

                  return ShoppingCard(
                    noStruk: shoppingHistory.noStruk ?? '',
                    totalItem: shoppingHistory.totalItem ?? '0',
                    date: shoppingHistory.date ?? DateTime(0000),
                    totalPrice: shoppingHistory.total ?? 0,
                    onTapDetail: () {
                      controller.docnum.value = shoppingHistory.docnum;
                      controller.date.value = shoppingHistory.date;
                      controller.total.value = shoppingHistory.total;
                      baseBottomSheet(
                        365,
                        const ShoppingDetailWidget(),
                      );
                    },
                  );
                },
              ),
            ),
    );
  }
}
