import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:member_rkm/app/components/base_card.dart';
import 'package:member_rkm/app/components/base_shimmer.dart';
import 'package:member_rkm/app/components/base_text.dart';
import 'package:member_rkm/app/core/values/colors.dart';

class PointVoucherBox extends StatelessWidget {
  const PointVoucherBox({
    Key? key,
    required this.totalPoint,
    required this.totalVoucher,
    this.margin,
  }) : super(key: key);

  final String totalPoint;
  final String totalVoucher;
  final EdgeInsets? margin;

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      color: whiteColor,
      margin: margin,
      child: Row(
        children: [
          Expanded(
            child: InkWell(
              onTap: () {
                Get.toNamed('/point');
              },
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/images/point.svg',
                      width: 30,
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          const BaseText(
                            text: 'Poin Anda',
                            size: 12,
                            color: Colors.black,
                            bold: FontWeight.w500,
                          ),
                          totalPoint == ''
                              ? BaseShimmer(
                                  child: Container(
                                    height: 15,
                                    width: 70,
                                    margin: const EdgeInsets.only(top: 5),
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(3),
                                    ),
                                  ),
                                )
                              : BaseText(
                                  text: totalPoint,
                                  color: Colors.black,
                                  bold: FontWeight.w600,
                                ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            height: 40,
            width: 1,
            color: Colors.grey.shade300,
          ),
          Expanded(
            child: InkWell(
              onTap: () {
                Get.toNamed('/voucher');
              },
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          const BaseText(
                            text: 'Voucher',
                            size: 12,
                            color: Colors.black,
                            bold: FontWeight.w500,
                          ),
                          totalVoucher == ''
                              ? BaseShimmer(
                                  child: Container(
                                    height: 15,
                                    width: 70,
                                    margin: const EdgeInsets.only(top: 5),
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(3),
                                    ),
                                  ),
                                )
                              : BaseText(
                                  text: totalVoucher,
                                  color: Colors.black,
                                  bold: FontWeight.w600,
                                ),
                        ],
                      ),
                    ),
                    SvgPicture.asset(
                      'assets/images/kupon.svg',
                      width: 40,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
