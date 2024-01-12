import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:member_rkm/app/components/base_text.dart';
import 'package:member_rkm/app/core/values/colors.dart';
import 'package:member_rkm/app/modules/tracking/components/tracking_item.dart';
import 'package:member_rkm/app/modules/tracking/controller.dart';

class TrackingTimeline extends StatelessWidget {
  TrackingTimeline({super.key});
  final controller = Get.find<TrackingController>();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          const Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.fromLTRB(15, 0, 15, 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  BaseText(
                    text: 'Status Pengiriman',
                    size: 16,
                    bold: FontWeight.w600,
                  ),
                  BaseText(
                    text: 'Informasi pengiriman hadiah terkini!',
                    color: greyTextColor,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              physics: const ClampingScrollPhysics(),
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
              itemCount: 4,
              itemBuilder: (context, index) {
                return TrackingItem(
                  index: index,
                  length: 4,
                  date: '02 Januari 2024',
                  status: 'Pengiriman',
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
