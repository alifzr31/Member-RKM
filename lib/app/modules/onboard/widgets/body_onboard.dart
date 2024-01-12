import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:member_rkm/app/components/base_text.dart';
import 'package:member_rkm/app/modules/onboard/controller.dart';

class BodyOnboard extends StatelessWidget {
  BodyOnboard({super.key});
  final controller = Get.find<OnBoardController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Expanded(
        child: PageView.builder(
          controller: controller.pageController.value,
          onPageChanged: (index) => controller.currentPage.value = index,
          itemCount: controller.titles.length,
          itemBuilder: (context, index) {
            final images = controller.images[index];
            final titles = controller.titles[index];
            final subtitles = controller.subtitles[index];

            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 240,
                      width: Get.width,
                      child: SvgPicture.asset('assets/images/$images'),
                    ),
                    const SizedBox(height: 40),
                    BaseText(
                      text: titles,
                      bold: FontWeight.bold,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    BaseText(
                      text: subtitles,
                      size: 12,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
