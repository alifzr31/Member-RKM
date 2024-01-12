import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:member_rkm/app/components/base_refresh.dart';
import 'package:member_rkm/app/components/base_text.dart';
import 'package:member_rkm/app/core/values/app_helpers.dart';
import 'package:member_rkm/app/core/values/colors.dart';
import 'package:member_rkm/app/modules/dashboard/components/lottery/card_item.dart';
import 'package:member_rkm/app/modules/dashboard/components/lottery/lotteryvoucher_item.dart';
import 'package:member_rkm/app/modules/dashboard/controller.dart';

class BodyLottery extends StatelessWidget {
  BodyLottery({super.key});
  final controller = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BaseText(
                text:
                    'Kupon undian hadiah ini berlaku sampai 31 Desember ${AppHelpers.yearFormat(DateTime.now())}',
                size: 16,
                color: whiteColor,
                bold: FontWeight.w600,
              ),
              const BaseText(
                text: 'Kupon undian hanya berlaku dalam waktu 1 tahun periode!',
                size: 12,
                color: greyTextColor,
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Expanded(
          child: BaseRefresh(
            onRefresh: () async {
              await Future.delayed(const Duration(milliseconds: 2500));
            },
            child: ListView.builder(
              itemCount: 25,
              itemBuilder: (context, index) {
                return CardItemLottery(
                  total: '10',
                  noStruk: '1234',
                  tanggal: 'tanggal',
                  detailData: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return const LotteryVoucherItem(
                        noUndian: 'RKM123456789',
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
