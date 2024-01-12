import 'package:boxicons/boxicons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:member_rkm/app/components/base_text.dart';
import 'package:member_rkm/app/core/values/app_helpers.dart';
import 'package:member_rkm/app/core/values/colors.dart';
import 'package:member_rkm/app/modules/point/my_point/components/proggress_card.dart';

class PointInfoBox extends StatelessWidget {
  const PointInfoBox({
    Key? key,
    required this.totalPoint,
    required this.totalTransaction,
    required this.category,
    required this.lastTransaction,
  }) : super(key: key);

  final int totalPoint;
  final int totalTransaction;
  final String category;
  final DateTime lastTransaction;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 260,
      width: Get.width,
      child: Material(
        color: bgSectionColor,
        borderRadius: BorderRadius.circular(10),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/images/point.svg',
                    width: 25,
                  ),
                  const SizedBox(width: 5),
                  Container(
                    height: 23,
                    width: 90,
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      color: orangeColor,
                      borderRadius: BorderRadius.circular(2),
                    ),
                    child: Center(
                      child: RichText(
                        text: TextSpan(
                          style: DefaultTextStyle.of(context).style,
                          children: [
                            TextSpan(
                              text: '${AppHelpers.thousandFormat(totalPoint)} ',
                              style: const  TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const TextSpan(
                              text: 'Poin',
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const BaseText(
                text: 'Total Transaksi',
                size: 12,
              ),
              BaseText(
                text: AppHelpers.rupiahFormat(totalTransaction),
                bold: FontWeight.w600,
              ),
              const SizedBox(height: 15),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ProggressCard(
                      category: category.capitalize ?? '',
                      totalTransaction: totalTransaction,
                      lastTransaction: lastTransaction,
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () => Get.toNamed('/pointHistory'),
                          borderRadius: BorderRadius.circular(3),
                          child: const Padding(
                            padding: EdgeInsets.all(5),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 13,
                                  foregroundColor: orangeColor,
                                  child: Icon(
                                    Boxicons.bx_history,
                                    size: 20,
                                  ),
                                ),
                                SizedBox(width: 3),
                                BaseText(text: 'Riwayat Poin'),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          borderRadius: BorderRadius.circular(3),
                          child: const Padding(
                            padding: EdgeInsets.all(5),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 13,
                                  foregroundColor: orangeColor,
                                  child: Icon(
                                    Boxicons.bx_help_circle,
                                    size: 20,
                                  ),
                                ),
                                SizedBox(width: 3),
                                BaseText(text: 'Tentang Poin'),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
