import 'package:flutter/material.dart';
import 'package:member_rkm/app/components/base_text.dart';
import 'package:member_rkm/app/core/values/colors.dart';

class ItemField extends StatelessWidget {
  const ItemField({
    Key? key,
    required this.label,
    required this.value,
    this.valueColor,
  }) : super(key: key);

  final String label;
  final String value;
  final Color? valueColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BaseText(
          text: label,
          color: whiteColor,
          bold: FontWeight.w600,
        ),
        const SizedBox(height: 5),
        BaseText(
          text: value,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          color: valueColor ?? greyTextColor,
          bold: FontWeight.w600,
        ),
      ],
    );
  }
}
