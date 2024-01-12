import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:member_rkm/app/components/base_text.dart';
import 'package:member_rkm/app/core/values/app_helpers.dart';
import 'package:member_rkm/app/core/values/colors.dart';

class FindAccountBox extends StatelessWidget {
  const FindAccountBox({
    Key? key,
    required this.email,
    required this.phoneNumber,
  }) : super(key: key);

  final String email;
  final String phoneNumber;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      child: Material(
        color: bgSectionColor,
        borderRadius: BorderRadius.circular(10),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const BaseText(
                text: 'Akun Ditemukan',
                bold: FontWeight.w600,
              ),
              const SizedBox(height: 10),
              const BaseText(
                text: 'Email',
                size: 12,
                color: greyTextColor,
              ),
              BaseText(
                text: AppHelpers.maskEmail(email),
                bold: FontWeight.w500,
              ),
              const SizedBox(height: 5),
              const BaseText(
                text: 'No. Telepon',
                size: 12,
                color: greyTextColor,
              ),
              BaseText(
                text: AppHelpers.maskPhoneNumber(phoneNumber),
                bold: FontWeight.w500,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
