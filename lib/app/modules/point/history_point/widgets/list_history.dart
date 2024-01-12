import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:member_rkm/app/components/base_listtile.dart';
import 'package:member_rkm/app/components/base_text.dart';
import 'package:member_rkm/app/core/values/colors.dart';
import 'package:member_rkm/app/modules/point/controller.dart';

class ListHistory extends StatelessWidget {
  ListHistory({super.key});
  final controller = Get.find<PointController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: Get.width,
          color: bgSectionColor,
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 5,
          ),
          child: const BaseText(
            text: 'Januari 2024',
            size: 16,
            bold: FontWeight.bold,
          ),
        ),
        BaseListTileRichText(
          leading: SvgPicture.asset(
            'assets/images/point.svg',
            width: 30,
          ),
          richTitle: const [
            TextSpan(text: 'Poin berhasil ditukarkan dengan '),
            TextSpan(
              text: 'Setrika Cosmos',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ],
          subtitle: '02 Januari 2024',
          trailing: const BaseText(
            text: '-100 Poin',
            size: 16,
            bold: FontWeight.w600,
            color: Colors.red,
          ),
        ),
        BaseListTileRichText(
          leading: SvgPicture.asset(
            'assets/images/point.svg',
            width: 30,
          ),
          richTitle: const [
            TextSpan(text: 'Poin berhasil ditambahkan dari '),
            TextSpan(
              text: 'TRI12345',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ],
          subtitle: '02 Januari 2024',
          trailing: const BaseText(
            text: '+100 Poin',
            size: 16,
            bold: FontWeight.w600,
            color: Colors.green,
          ),
        ),
      ],
    );
  }
}
