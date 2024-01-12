import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:member_rkm/app/components/base_card.dart';
import 'package:member_rkm/app/components/base_text.dart';
import 'package:member_rkm/app/core/values/colors.dart';

class CardStore extends StatelessWidget {
  const CardStore({
    Key? key,
    required this.name,
    required this.address,
    required this.distance,
    this.shape,
    this.onTap,
  }) : super(key: key);

  final String name;
  final String address;
  final String distance;
  final ShapeBorder? shape;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      elevation: 0,
      color: bgSectionColor,
      margin: const EdgeInsets.only(bottom: 10),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(
                          'assets/images/mapicon.svg',
                          width: 16,
                        ),
                        const SizedBox(width: 5),
                        BaseText(
                          text: name,
                          size: 16,
                          bold: FontWeight.w600,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    BaseText(
                      text: address,
                      size: 12,
                      color: greyTextColor,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              BaseText(
                text: '$distance KM',
                bold: FontWeight.w500,
                color: orangeColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
