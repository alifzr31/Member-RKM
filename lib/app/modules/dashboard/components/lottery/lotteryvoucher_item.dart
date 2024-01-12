import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:member_rkm/app/components/base_text.dart';
import 'package:member_rkm/app/core/values/colors.dart';

class LotteryVoucherItem extends StatelessWidget {
  const LotteryVoucherItem({
    Key? key,
    required this.noUndian,
  }) : super(key: key);

  final String noUndian;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 8),
      color: softOrangeColor,
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: orangeColor),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            SvgPicture.asset(
              'assets/images/kupon.svg',
              width: 40,
            ),
            Expanded(
              child: Center(
                child: BaseText(
                  text: noUndian,
                  color: orangeColor,
                  size: 16,
                  bold: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
