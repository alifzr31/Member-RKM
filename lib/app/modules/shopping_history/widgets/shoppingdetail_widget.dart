import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:member_rkm/app/components/base_shimmer.dart';
import 'package:member_rkm/app/components/base_text.dart';
import 'package:member_rkm/app/core/values/app_helpers.dart';
import 'package:member_rkm/app/core/values/colors.dart';
import 'package:member_rkm/app/modules/shopping_history/controller.dart';

class ShoppingDetailWidget extends StatefulWidget {
  const ShoppingDetailWidget({super.key});

  @override
  State<ShoppingDetailWidget> createState() => _ShoppingDetailWidgetState();
}

class _ShoppingDetailWidgetState extends State<ShoppingDetailWidget> {
  final controller = Get.find<ShoppingController>();

  @override
  void initState() {
    controller.fetchDetailShoppingHistory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Stack(
        children: [
          Positioned(
            right: 0,
            child: IconButton(
              padding: EdgeInsets.zero,
              onPressed: () => Get.back(),
              icon: const Icon(Icons.close),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/images/shopping_fill.svg',
                  width: 40,
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const BaseText(
                      text: 'Detail Belanja',
                      bold: FontWeight.w500,
                    ),
                    BaseText(
                      text: AppHelpers.dateFormat(
                          controller.date.value ?? DateTime(0000)),
                      size: 12,
                      color: greyTextColor,
                    ),
                  ],
                ),
                const Divider(),
                Expanded(
                  child: Column(
                    children: [
                      Expanded(
                        child: controller.detailShoppingLoading.value
                            ? ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: 25,
                                itemBuilder: (context, index) {
                                  return Container(
                                    margin: const EdgeInsets.only(bottom: 10),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: BaseShimmer(
                                            child: Container(
                                              height: 15,
                                              decoration: BoxDecoration(
                                                color: Colors.grey,
                                                borderRadius: BorderRadius.circular(3),
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        BaseShimmer(
                                          child: Container(
                                            height: 15,
                                            width: 100,
                                            decoration: BoxDecoration(
                                              color: Colors.grey,
                                              borderRadius: BorderRadius.circular(3),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              )
                            : ListView.builder(
                                physics: const ClampingScrollPhysics(),
                                itemCount:
                                    controller.detailShoppingHistory.length,
                                itemBuilder: (context, index) {
                                  final detailShoppingHistory =
                                      controller.detailShoppingHistory[index];

                                  return Container(
                                    margin: const EdgeInsets.only(bottom: 5),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: BaseText(
                                            text: detailShoppingHistory
                                                    .dscription ??
                                                '',
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        BaseText(
                                          text:
                                              '${AppHelpers.rupiahFormat(detailShoppingHistory.harga ?? 0)} (x${detailShoppingHistory.qty})',
                                          bold: FontWeight.w500,
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                      ),
                      const SizedBox(height: 10),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const BaseText(
                              text: 'Total Harga',
                              size: 12,
                              color: greyTextColor,
                            ),
                            BaseText(
                              text: AppHelpers.rupiahFormat(
                                  controller.total.value ?? 0),
                              bold: FontWeight.w600,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                const BaseText(
                  text:
                      'Berbagai macam hadiah menarik untuk setiap pembelian produk di RKM',
                  size: 12,
                  textAlign: TextAlign.center,
                  color: greyTextColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
