import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:member_rkm/app/components/base_text.dart';
import 'package:member_rkm/app/core/values/colors.dart';

class NearestBox extends StatelessWidget {
  const NearestBox({
    Key? key,
    required this.storeName,
    required this.address,
    required this.distance,
    this.onTap,
  }) : super(key: key);

  final String storeName;
  final String address;
  final String distance;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 170,
      child: Card(
        color: baseBgScaffold,
        elevation: 3,
        surfaceTintColor: baseBgScaffold,
        clipBehavior: Clip.antiAlias,
        margin: const EdgeInsets.only(
          right: 8,
          top: 4,
          bottom: 4,
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
        ),
        child: InkWell(
          onTap: onTap,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BaseText(
                        text: storeName,
                        size: 16,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        color: whiteColor,
                        bold: FontWeight.w600,
                      ),
                      const SizedBox(height: 5),
                      BaseText(
                        text: address,
                        size: 12,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        color: greyTextColor,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 20,
                width: Get.width,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                color: blackColor,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: BaseText(
                    text: '$distance KM',
                    color: orangeColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
