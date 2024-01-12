import 'package:flutter/material.dart';
import 'package:member_rkm/app/components/base_appbar.dart';
import 'package:member_rkm/app/core/values/colors.dart';
import 'package:member_rkm/app/modules/point/history_point/widgets/historypoint_header.dart';
import 'package:member_rkm/app/modules/point/history_point/widgets/list_history.dart';

class HistoryPointPage extends StatelessWidget {
  const HistoryPointPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar(
        bgColor: blackColor,
        fgColor: whiteColor,
        title: 'Riwayat Poin',
        preferredSize: Size.fromHeight(kToolbarHeight),
      ),
      body: Column(
        children: [
          const HistoryPointHeader(),
          ListHistory(),
        ],
      ),
    );
  }
}
