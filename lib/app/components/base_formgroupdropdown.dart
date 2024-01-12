import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:member_rkm/app/components/base_text.dart';
import 'package:member_rkm/app/core/values/colors.dart';

class BaseFormGroupDropdown extends StatelessWidget {
  const BaseFormGroupDropdown({
    Key? key,
    required this.label,
    required this.hint,
    required this.items,
    required this.onChanged,
    this.value,
    this.validator,
  }) : super(key: key);

  final String label;
  final String hint;
  final List<DropdownMenuItem<Object>>? items;
  final void Function(Object?)? onChanged;
  final Object? value;
  final String? Function(Object?)? validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: BaseText(
            text: label,
            bold: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 5),
        DropdownButtonFormField2(
          isExpanded: true,
          hint: BaseText(
            text: hint,
            color: const Color(0xFF777777),
          ),
          value: value,
          items: items,
          validator: validator,
          onChanged: onChanged,
          dropdownMaxHeight: 200,
          dropdownDecoration: BoxDecoration(
            color: bgSectionColor,
            borderRadius: BorderRadius.circular(10),
          ),
          dropdownElevation: 1,
          buttonWidth: Get.width,
          itemPadding: const EdgeInsets.symmetric(horizontal: 10),
          style: const TextStyle(color: whiteColor),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
            errorStyle: const TextStyle(
              color: redColor,
            ),
            filled: true,
            fillColor: bgSectionColor,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ],
    );
  }
}
