import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:member_rkm/app/components/base_text.dart';
import 'package:member_rkm/app/core/values/colors.dart';
import 'package:member_rkm/app/modules/tracking/controller.dart';

class TrackingHeader extends StatelessWidget {
  TrackingHeader({super.key});
  final controller = Get.find<TrackingController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  BaseText(
                    text: 'Tracking Keberadaan Hadiah',
                    size: 16,
                    bold: FontWeight.w600,
                  ),
                  BaseText(
                    text:
                        'Lihat informasi tracking hadiah terakhir anda disini!',
                    color: greyTextColor,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            Material(
              color: bgSectionColor,
              borderRadius: BorderRadius.circular(10),
              clipBehavior: Clip.antiAlias,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0xFF121A24),
                            Color(0xFF24292F),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                      ),
                      child: Column(
                        children: [
                          const BaseText(
                            text: 'Nama Hadiah',
                            size: 12,
                            color: greyTextColor,
                            bold: FontWeight.w500,
                          ),
                          BaseText(
                            text: controller.prizeDesc.value ?? '',
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            bold: FontWeight.w600,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          const BaseText(
                            text: 'Kode Voucher',
                            size: 12,
                            color: greyTextColor,
                            bold: FontWeight.w500,
                          ),
                          BaseText(
                            text: controller.serialNumber.value ?? '',
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            bold: FontWeight.w600,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
