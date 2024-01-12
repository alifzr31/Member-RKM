import 'package:boxicons/boxicons.dart';
import 'package:flutter/material.dart';
import 'package:member_rkm/app/core/values/colors.dart';

class BaseSearchField extends StatelessWidget {
  const BaseSearchField({
    Key? key,
    required this.hint,
    this.controller,
    this.suffixIcon,
    this.onChanged,
    this.onTap,
    this.onFieldSubmitted,
  }) : super(key: key);

  final String hint;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final void Function(String)? onChanged;
  final void Function()? onTap;
  final void Function(String)? onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      cursorColor: blackColor,
      style: const TextStyle(color: blackColor),
      onTap: onTap,
      onFieldSubmitted: onFieldSubmitted,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: Colors.grey.shade600),
        prefixIcon: const Icon(Boxicons.bx_search),
        prefixIconColor: Colors.grey.shade600,
        filled: true,
        fillColor: whiteColor,
        contentPadding: const EdgeInsets.symmetric(horizontal: 10),
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
