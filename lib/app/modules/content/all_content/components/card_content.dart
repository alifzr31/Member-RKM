import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:member_rkm/app/components/base_card.dart';
import 'package:member_rkm/app/components/base_text.dart';
import 'package:member_rkm/app/core/utils/api_url.dart';
import 'package:member_rkm/app/core/values/colors.dart';

class CardContent extends StatelessWidget {
  const CardContent({
    Key? key,
    required this.image,
    required this.label,
    required this.title,
    required this.author,
    required this.date,
    this.labelColor,
    this.labelGradient,
    this.onTap,
  }) : super(key: key);

  final String image;
  final String label;
  final String title;
  final String author;
  final String date;
  final Color? labelColor;
  final Gradient? labelGradient;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 135,
      width: Get.width,
      child: BaseCard(
        color: bgSectionColor,
        margin: const EdgeInsets.only(bottom: 10),
        child: InkWell(
          onTap: onTap,
          child: Row(
            children: [
              Container(
                width: 130,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: Image.network(
                            '${ApiUrl.baseStorageUrl}contents/$image')
                        .image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 5,
                              vertical: 1,
                            ),
                            decoration: BoxDecoration(
                              color: labelColor,
                              gradient: labelGradient,
                              borderRadius: BorderRadius.circular(3),
                            ),
                            child: BaseText(
                              text: label,
                              size: 12,
                              color: whiteColor,
                              bold: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 5),
                          BaseText(
                            text: title,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            bold: FontWeight.bold,
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BaseText(
                            text: 'Author : $author',
                            size: 12,
                            color: greyTextColor,
                          ),
                          BaseText(
                            text: date,
                            size: 12,
                            color: greyTextColor,
                            bold: FontWeight.w500,
                          ),
                        ],
                      ),
                    ],
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
