import 'package:boxicons/boxicons.dart';
import 'package:flutter/material.dart';
import 'package:member_rkm/app/components/base_text.dart';
import 'package:member_rkm/app/core/values/colors.dart';

class HistoryPointHeader extends StatelessWidget {
  const HistoryPointHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(15),
      child: Row(
        children: [
          CircleAvatar(
            foregroundColor: orangeColor,
            child: Center(
              child: Icon(
                Boxicons.bx_history,
                size: 30,
              ),
            ),
          ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BaseText(
                text: 'Poin yang telah ditukarkan',
                size: 16,
                bold: FontWeight.w600,
              ),
              BaseText(
                text: 'List riwayat penukaran poin terakhir anda disini!',
                size: 12,
                color: greyTextColor,
              ),
            ],
          )
        ],
      ),
    );
  }
}
