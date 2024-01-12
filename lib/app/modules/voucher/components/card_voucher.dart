import 'package:flutter/material.dart';
import 'package:boxicons/boxicons.dart';
import 'package:get/get.dart';
import 'package:member_rkm/app/components/base_card.dart';
import 'package:member_rkm/app/components/base_text.dart';
import 'package:member_rkm/app/core/values/colors.dart';

class CardVoucher extends StatelessWidget {
  const CardVoucher({
    Key? key,
    required this.prizeDesc,
    required this.serialNumber,
    required this.date,
  }) : super(key: key);

  final String prizeDesc;
  final String serialNumber;
  final String date;

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      color: blackColor,
      margin: const EdgeInsets.only(bottom: 10),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF121A24),
                  Color(0xFF24292F),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Row(
              children: [
                Container(
                  color: whiteColor,
                  child: const Icon(
                    Boxicons.bx_qr,
                    size: 70,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      BaseText(
                        text: prizeDesc,
                        bold: FontWeight.w600,
                      ),
                      Container(
                        width: Get.width,
                        padding: const EdgeInsets.symmetric(vertical: 2),
                        decoration: BoxDecoration(
                          color: whiteColor,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Center(
                          child: BaseText(
                            text: serialNumber,
                            size: 16,
                            bold: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 3,
            ),
            child: Row(
              children: [
                Expanded(
                  child: BaseText(
                    text: date,
                    size: 12,
                    color: greyTextColor,
                  ),
                ),
                GestureDetector(
                  onTap: () => Get.toNamed(
                    '/tracking',
                    arguments: {
                      'prizeDesc': prizeDesc,
                      'serialNumber': serialNumber,
                    },
                  ),
                  child: const Row(
                    children: [
                      BaseText(
                        text: 'Detail Tracking',
                        size: 12,
                        color: orangeColor,
                      ),
                      Icon(
                        Boxicons.bx_chevron_right,
                        size: 15,
                        color: orangeColor,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
