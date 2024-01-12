import 'package:boxicons/boxicons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:member_rkm/app/core/values/colors.dart';
import 'package:member_rkm/app/modules/dashboard/controller.dart';
import 'package:url_launcher/url_launcher.dart';

class DashboardFab extends StatelessWidget {
  DashboardFab({super.key});
  final controller = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.currentIndex.value == 3 && controller.token.value == null
          ? FloatingActionButton(
              heroTag: 'btnHubungiKami',
              backgroundColor: orangeColor,
              foregroundColor: whiteColor,
              tooltip: 'Hubungi Kami',
              onPressed: () async {
                final url = Uri.parse(
                  'https://api.whatsapp.com/send/?phone=%2B628112308000&text&type=phone_number&app_absent=0',
                );

                await launchUrl(
                  url,
                  mode: LaunchMode.externalApplication,
                );
              },
              child: const Icon(Boxicons.bx_headphone),
            )
          : Container(),
    );
  }
}
