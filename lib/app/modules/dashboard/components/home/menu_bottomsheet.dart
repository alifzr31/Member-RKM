import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:member_rkm/app/components/base_text.dart';
import 'package:member_rkm/app/core/values/colors.dart';

class MenuBottomSheet extends StatelessWidget {
  const MenuBottomSheet({
    Key? key,
    required this.image,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  final String image;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          right: 0,
          child: IconButton(
            padding: EdgeInsets.zero,
            onPressed: () => Get.back(),
            icon: const Icon(Icons.close),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                image,
                width: 60,
              ),
              const SizedBox(height: 5),
              BaseText(
                text: title,
                bold: FontWeight.w500,
                color: whiteColor,
              ),
              const SizedBox(height: 10),
              BaseText(
                text: subtitle,
                textAlign: TextAlign.center,
                color: greyTextColor,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
