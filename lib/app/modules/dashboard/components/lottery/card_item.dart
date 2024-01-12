import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:member_rkm/app/components/base_text.dart';
import 'package:member_rkm/app/core/values/colors.dart';

class CardItemLottery extends StatelessWidget {
  const CardItemLottery({
    Key? key,
    required this.total,
    required this.noStruk,
    required this.tanggal,
    required this.detailData,
  }) : super(key: key);

  final String total;
  final String noStruk;
  final String tanggal;
  final Widget detailData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 0, 15, 10),
      child: ExpansionTileCard(
        baseColor: bgSectionColor,
        expandedColor: const Color(0xFF2A323D),
        borderRadius: BorderRadius.circular(10),
        contentPadding: const EdgeInsets.symmetric(horizontal: 15),
        elevation: 3,
        leading: CircleAvatar(
          backgroundColor: orangeColor,
          foregroundColor: whiteColor,
          child: BaseText(
            text: 'x$total',
            size: 15,
            bold: FontWeight.w600,
          ),
        ),
        title: Text(
          noStruk,
          style: const TextStyle(
            color: whiteColor,
            letterSpacing: 2,
            fontWeight: FontWeight.w500,
          ),
        ),
        subtitle: BaseText(
          text: tanggal,
          color: greyTextColor,
        ),
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Divider(color: greyTextColor),
          ),
          const SizedBox(height: 10),
          Container(
            height: 200,
            width: Get.width,
            margin: const EdgeInsets.only(bottom: 10),
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: detailData,
          ),
        ],
      ),
    );
  }
}
