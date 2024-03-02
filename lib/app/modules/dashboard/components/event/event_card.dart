import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:member_rkm/app/components/base_button.dart';
import 'package:member_rkm/app/components/base_shimmer.dart';
import 'package:member_rkm/app/components/base_text.dart';
import 'package:member_rkm/app/core/values/colors.dart';

class EventCard extends StatelessWidget {
  const EventCard({
    super.key,
    required this.image,
    required this.title,
    required this.desc,
    this.onPressed,
    this.index,
    this.dataLength,
  });

  final String image;
  final String title;
  final String desc;
  final void Function()? onPressed;
  final int? index;
  final int? dataLength;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: bgSectionColor,
      surfaceTintColor: bgSectionColor,
      margin: EdgeInsets.only(bottom: index == (dataLength! - 1) ? 0 : 10),
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 150,
            width: Get.width,
            child: Image.asset(
              'assets/images/$image',
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BaseText(
                    text: title,
                    color: whiteColor,
                    bold: FontWeight.w500,
                  ),
                  BaseText(
                    text: desc,
                    color: greyTextColor,
                    size: 12,
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: Get.width,
                    child: BaseButton(
                      bgColor: blackColor,
                      fgColor: whiteColor,
                      label: 'Lihat Info Event',
                      onPressed: onPressed,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class EventCardLoading extends StatelessWidget {
  const EventCardLoading({
    super.key,
    this.index,
    this.dataLength,
  });

  final int? index;
  final int? dataLength;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: bgSectionColor,
      surfaceTintColor: bgSectionColor,
      margin: EdgeInsets.only(bottom: index == (dataLength! - 1) ? 0 : 10),
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          BaseShimmer(
            child: Container(
              height: 150,
              width: Get.width,
              color: Colors.grey,
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BaseShimmer(
                    child: Container(
                      height: 15,
                      width: 220,
                      margin: const EdgeInsets.only(bottom: 5),
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(3),
                      ),
                    ),
                  ),
                  BaseShimmer(
                    child: Container(
                      height: 13,
                      width: Get.width,
                      margin: const EdgeInsets.only(bottom: 4),
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(3),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  BaseShimmer(
                    child: SizedBox(
                      width: Get.width,
                      child: BaseButton(
                        bgColor: blackColor,
                        fgColor: whiteColor,
                        label: '',
                        onPressed: () {},
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
