import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:member_rkm/app/components/base_card.dart';
import 'package:member_rkm/app/components/base_text.dart';
import 'package:member_rkm/app/core/values/app_helpers.dart';
import 'package:member_rkm/app/core/values/colors.dart';

class ShoppingCard extends StatelessWidget {
  const ShoppingCard({
    Key? key,
    required this.noStruk,
    required this.totalItem,
    required this.date,
    required this.totalPrice,
    this.onTapDetail,
  }) : super(key: key);

  final String noStruk;
  final String totalItem;
  final DateTime date;
  final int totalPrice;
  final void Function()? onTapDetail;

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      color: bgSectionColor,
      margin: const EdgeInsets.only(bottom: 10),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  'assets/images/shopping_fill.svg',
                  width: 30,
                ),
                const SizedBox(width: 5),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BaseText(
                        text: noStruk,
                        bold: FontWeight.w600,
                      ),
                      BaseText(
                        text: '$totalItem Barang',
                        size: 12,
                        color: greyTextColor,
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: onTapDetail,
                  child: const BaseText(
                    text: 'Lihat Detail',
                    size: 12,
                    color: orangeColor,
                    bold: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                BaseText(
                  text: AppHelpers.dateFormat(date),
                  color: greyTextColor,
                  size: 12,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const BaseText(
                        text: 'Total Harga',
                        size: 12,
                        color: greyTextColor,
                      ),
                      BaseText(
                        text: AppHelpers.rupiahFormat(totalPrice),
                        bold: FontWeight.w600,
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
