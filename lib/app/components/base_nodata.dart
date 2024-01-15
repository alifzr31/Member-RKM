import 'package:boxicons/boxicons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:member_rkm/app/components/base_text.dart';
import 'package:member_rkm/app/core/values/colors.dart';

class BaseNoData extends StatelessWidget {
  const BaseNoData({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.labelButton,
    this.onPressed,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final String labelButton;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/images/logo.svg',
            width: 160,
          ),
          const SizedBox(height: 20),
          BaseText(
            text: title,
            size: 16,
            bold: FontWeight.w600,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 3),
          BaseText(
            text: subtitle,
            color: greyTextColor,
            textAlign: TextAlign.center,
          ),
          TextButton.icon(
            style: ButtonStyle(
              elevation: const MaterialStatePropertyAll(0),
              padding: const MaterialStatePropertyAll(
                  EdgeInsets.symmetric(horizontal: 5)),
              shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5))),
              iconColor: const MaterialStatePropertyAll(orangeColor),
              foregroundColor: const MaterialStatePropertyAll(orangeColor),
            ),
            onPressed: onPressed,
            icon: const Icon(Boxicons.bx_refresh),
            label: BaseText(
              text: labelButton,
              bold: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
