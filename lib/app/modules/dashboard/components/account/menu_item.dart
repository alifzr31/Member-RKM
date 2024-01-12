import 'package:flutter/material.dart';
import 'package:member_rkm/app/components/base_text.dart';
import 'package:member_rkm/app/core/values/colors.dart';

class MenuItem extends StatelessWidget {
  const MenuItem({
    Key? key,
    required this.label,
    required this.items,
  }) : super(key: key);

  final String label;
  final List<Widget> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BaseText(
          text: label,
          size: 16,
          color: orangeColor,
          bold: FontWeight.w600,
        ),
        const SizedBox(height: 10),
        Material(
          color: blackColor,
          borderRadius: BorderRadius.circular(10),
          clipBehavior: Clip.antiAlias,
          child: Column(
            children: items,
          ),
        ),
      ],
    );
  }
}
