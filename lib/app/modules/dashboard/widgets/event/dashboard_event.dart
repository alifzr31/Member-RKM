import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:member_rkm/app/components/base_text.dart';
import 'package:member_rkm/app/core/values/colors.dart';
import 'package:member_rkm/app/modules/dashboard/widgets/event/event_body.dart';

class DashboardEvent extends StatelessWidget {
  const DashboardEvent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 80,
          width: Get.width,
          color: blackColor,
          child: const Center(
            child: BaseText(
              text: 'Event',
              size: 26,
              bold: FontWeight.bold,
            ),
          ),
        ),
        EventBody(),
      ],
    );
  }
}
