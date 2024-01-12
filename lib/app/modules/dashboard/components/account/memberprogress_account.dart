import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:member_rkm/app/components/base_shimmer.dart';
import 'package:member_rkm/app/components/base_text.dart';
import 'package:member_rkm/app/core/values/app_helpers.dart';
import 'package:member_rkm/app/core/values/colors.dart';

class MemberProgressAccount extends StatelessWidget {
  const MemberProgressAccount({
    Key? key,
    required this.currentTransaction,
    required this.category,
  }) : super(key: key);

  final int currentTransaction;
  final String category;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BaseText(
                text: 'Total Transaksi',
                color: Colors.grey.shade300,
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: category == ''
                      ? BaseShimmer(
                          child: Container(
                            height: 17,
                            width: 150,
                            margin: const EdgeInsets.only(bottom: 6),
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                        )
                      : BaseText(
                          text: AppHelpers.rupiahFormat(currentTransaction),
                          size: 16,
                          bold: FontWeight.w600,
                        ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Align(
            alignment: Alignment.centerRight,
            child: category == ''
                ? BaseShimmer(
                    child: Container(
                      height: 12,
                      width: 250,
                      margin: const EdgeInsets.only(bottom: 5),
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  )
                : category == 'platinum'
                    ? const BaseText(
                        text: 'Selamat 🎉 anda mencapai level member tertinggi',
                        size: 12,
                      )
                    : RichText(
                        text: TextSpan(
                          style: DefaultTextStyle.of(context).style,
                          children: [
                            const TextSpan(
                              text: 'Transaksi ',
                              style: TextStyle(fontSize: 12),
                            ),
                            TextSpan(
                              text: category == 'silver'
                                  ? AppHelpers.rupiahFormat(
                                      50000000 - currentTransaction)
                                  : AppHelpers.rupiahFormat(
                                      500000000 - currentTransaction),
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const TextSpan(
                              text: ' lagi menuju ',
                              style: TextStyle(fontSize: 12),
                            ),
                            TextSpan(
                              text: category == 'silver' ? 'Gold' : 'Platinum',
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
          ),
          category == ''
              ? BaseShimmer(
                  child: Stack(
                    children: [
                      Container(
                        height: 15,
                        width: Get.width,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      currentTransaction <= 50000000
                          ? Container(
                              height: 15,
                              width: currentTransaction *
                                  (((Get.width - 30) / 2) / 50000000),
                              decoration: BoxDecoration(
                                color: blackColor,
                                borderRadius: BorderRadius.circular(5),
                              ),
                            )
                          : Row(
                              children: [
                                Container(
                                  height: 15,
                                  width: 50000000 *
                                      (((Get.width - 30) / 2) / 50000000),
                                  decoration: const BoxDecoration(
                                    color: blackColor,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(5),
                                      bottomLeft: Radius.circular(5),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 15,
                                  width: currentTransaction *
                                      (((Get.width - 30) / 2) / 500000000),
                                  decoration: const BoxDecoration(
                                    color: blackColor,
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(5),
                                      bottomRight: Radius.circular(5),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                    ],
                  ),
                )
              : Stack(
                  children: [
                    Container(
                      height: 15,
                      width: Get.width,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    currentTransaction <= 50000000
                        ? Container(
                            height: 15,
                            width: currentTransaction *
                                (((Get.width - 30) / 2) / 50000000),
                            decoration: BoxDecoration(
                              color: blackColor,
                              borderRadius: BorderRadius.circular(5),
                            ),
                          )
                        : Row(
                            children: [
                              Container(
                                height: 15,
                                width: 50000000 *
                                    (((Get.width - 30) / 2) / 50000000),
                                decoration: const BoxDecoration(
                                  color: blackColor,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(5),
                                    bottomLeft: Radius.circular(5),
                                  ),
                                ),
                              ),
                              Container(
                                height: 15,
                                width: currentTransaction *
                                    (((Get.width - 30) / 2) / 500000000),
                                decoration: const BoxDecoration(
                                  color: blackColor,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(5),
                                    bottomRight: Radius.circular(5),
                                  ),
                                ),
                              ),
                            ],
                          ),
                  ],
                ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  category == ''
                      ? BaseShimmer(
                          child: SvgPicture.asset(
                            'assets/images/silver_medal.svg',
                            width: 30,
                          ),
                        )
                      : SvgPicture.asset(
                          'assets/images/silver_medal.svg',
                          width: category == 'silver' ? 35 : 30,
                        ),
                  if (category != '')
                    const BaseText(
                      text: 'Silver',
                      size: 12,
                      bold: FontWeight.w500,
                    ),
                ],
              ),
              Column(
                children: [
                  category == ''
                      ? BaseShimmer(
                          child: SvgPicture.asset(
                            'assets/images/gold_medal.svg',
                            width: 30,
                          ),
                        )
                      : SvgPicture.asset(
                          category == 'silver'
                              ? 'assets/images/gold_medal_off.svg'
                              : 'assets/images/gold_medal.svg',
                          width: category == 'gold' ? 35 : 30,
                        ),
                  if (category != '')
                    BaseText(
                      text: 'Gold',
                      size: 12,
                      color: category == 'silver'
                          ? Colors.grey.shade300
                          : whiteColor,
                      bold: FontWeight.w500,
                    ),
                ],
              ),
              Column(
                children: [
                  category == ''
                      ? BaseShimmer(
                          child: SvgPicture.asset(
                            'assets/images/platinum_medal.svg',
                            width: 30,
                          ),
                        )
                      : SvgPicture.asset(
                          category != 'platinum'
                              ? 'assets/images/platinum_medal_off.svg'
                              : 'assets/images/platinum_medal.svg',
                          width: category == 'platinum' ? 35 : 30,
                        ),
                  if (category != '')
                    BaseText(
                      text: 'Platinum',
                      size: 12,
                      color: category != 'platinum'
                          ? Colors.grey.shade300
                          : whiteColor,
                      bold: FontWeight.w500,
                    ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
