import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:member_rkm/app/components/base_button.dart';
import 'package:member_rkm/app/components/base_card.dart';
import 'package:member_rkm/app/components/base_shimmer.dart';
import 'package:member_rkm/app/components/base_text.dart';
import 'package:member_rkm/app/core/values/app_helpers.dart';
import 'package:member_rkm/app/core/values/colors.dart';

class PrizeCard extends StatelessWidget {
  const PrizeCard({
    Key? key,
    required this.prizePoint,
    required this.prizeImage,
    required this.prizeDesc,
    this.onPressed,
  }) : super(key: key);

  final int prizePoint;
  final String prizeImage;
  final String prizeDesc;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      elevation: 0,
      margin: EdgeInsets.zero,
      color: whiteColor,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                decoration: BoxDecoration(
                  color: orangeColor,
                  borderRadius: BorderRadius.circular(3),
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 1,
                  horizontal: 5,
                ),
                child: BaseText(
                  text: '${AppHelpers.thousandFormat(prizePoint)} Poin',
                  color: Colors.white,
                  bold: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 3),
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: Image.network(
                      prizeImage,
                      loadingBuilder: (BuildContext context, Widget child,
                          ImageChunkEvent? loadingProgress) {
                        return loadingProgress == null
                            ? child
                            : BaseShimmer(
                                child: Container(
                                  height: 80,
                                  width: Get.width / 2,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade300,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                              );
                      },
                    ),
                  ),
                  const SizedBox(height: 5),
                  BaseText(
                    text: prizeDesc,
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    size: 13,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 5),
            SizedBox(
              height: 35,
              width: Get.width,
              child: BaseButton(
                bgColor: blackColor,
                fgColor: Colors.white,
                label: 'Tukar Poin',
                onPressed: onPressed,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
