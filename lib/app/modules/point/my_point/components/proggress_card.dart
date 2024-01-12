import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:member_rkm/app/components/base_card.dart';
import 'package:member_rkm/app/components/base_text.dart';
import 'package:member_rkm/app/core/values/app_helpers.dart';
import 'package:member_rkm/app/core/values/colors.dart';
import 'package:member_rkm/app/core/values/gradient_color.dart';

class ProggressCard extends StatelessWidget {
  const ProggressCard({
    Key? key,
    required this.category,
    required this.totalTransaction,
    required this.lastTransaction,
  }) : super(key: key);

  final String category;

  final int totalTransaction;
  final DateTime lastTransaction;

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      color: whiteColor,
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: BaseText(
                    text: category,
                    size: 16,
                    bold: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                  ),
                  decoration: BoxDecoration(
                    gradient: category.toLowerCase() == 'silver'
                        ? GradientColor.silver
                        : category.toLowerCase() == 'gold'
                            ? GradientColor.gold
                            : GradientColor.platinum,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const BaseText(
                    text: 'Level saat ini',
                    size: 12,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Stack(
              children: [
                Container(
                  height: 10,
                  width: Get.width,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                Container(
                  height: 10,
                  width: category.toLowerCase() == 'silver'
                      ? totalTransaction / 10000000 * (Get.width - 84)
                      : category.toLowerCase() == 'gold'
                          ? (totalTransaction - 10000000) /
                              100000000 *
                              (Get.width - 84)
                          : Get.width,
                  decoration: BoxDecoration(
                    color: orangeColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Align(
              alignment: Alignment.centerLeft,
              child: RichText(
                text: TextSpan(
                  style: DefaultTextStyle.of(context).style,
                  children: [
                    TextSpan(
                      text: 'Transaksi Terakhir : ',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade600,
                      ),
                    ),
                    TextSpan(
                      text: AppHelpers.dateFormat(lastTransaction),
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade600,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
