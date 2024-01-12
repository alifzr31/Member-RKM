import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:member_rkm/app/modules/voucher/components/card_voucher.dart';
import 'package:member_rkm/app/modules/voucher/controller.dart';

class ListVoucher extends StatelessWidget {
  ListVoucher({super.key});
  final controller = Get.find<VoucherController>();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
        itemCount: 10,
        itemBuilder: (context, index) {
          return const CardVoucher(
            prizeDesc: 'Kirin Electro ION/KEI 320N - 150',
            serialNumber: '12345678',
            date: '02 Januari 2024',
          );
        },
      ),
    );
  }
}
