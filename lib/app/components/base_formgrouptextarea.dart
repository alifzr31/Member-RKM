import 'package:flutter/material.dart';
import 'package:member_rkm/app/components/base_text.dart';
import 'package:member_rkm/app/core/values/colors.dart';

class BaseFormGroupTextArea extends StatelessWidget {
  const BaseFormGroupTextArea({
    Key? key,
    this.controller,
    required this.label,
    this.hint,
    this.validator,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.keyboardType,
    this.onTap,
    this.readOnly = false,
    this.autofocus = false,
    this.onChanged,
    this.initialValue,
    this.helper,
    this.minLines,
  }) : super(key: key);

  final TextEditingController? controller;
  final String label;
  final String? hint;
  final String? helper;
  final String? initialValue;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool obscureText;
  final bool readOnly;
  final bool autofocus;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final void Function()? onTap;
  final void Function(String?)? onChanged;
  final int? minLines;

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
        TextFormField(
          controller: controller,
          obscureText: obscureText,
          keyboardType: keyboardType,
          initialValue: initialValue,
          readOnly: readOnly,
          autofocus: autofocus,
          validator: validator,
          onChanged: onChanged,
          onTap: onTap,
          cursorColor: orangeColor,
          minLines: minLines,
          maxLines: null,
          style: const TextStyle(color: whiteColor),
          decoration: InputDecoration(
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
            hintText: hint,
            hintStyle: const TextStyle(color: Color(0xFF777777)),
            helperText: helper,
            helperStyle: const TextStyle(
              color: orangeColor,
              fontStyle: FontStyle.italic,
            ),
            errorStyle: const TextStyle(
              color: redColor,
            ),
            filled: true,
            fillColor: bgSectionColor,
            contentPadding: const EdgeInsets.all(10),
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
