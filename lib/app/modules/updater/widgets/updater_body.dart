import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:member_rkm/app/components/base_button.dart';
import 'package:member_rkm/app/components/base_text.dart';
import 'package:member_rkm/app/core/values/colors.dart';
import 'package:member_rkm/app/modules/updater/controller.dart';

class UpdaterBody extends StatelessWidget {
  UpdaterBody({super.key});
  final controller = Get.find<UpdaterController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/images/logo.svg',
                      width: 250,
                    ),
                    const SizedBox(height: 20),
                    const BaseText(
                      text: 'Update Tersedia!',
                      size: 18,
                      textAlign: TextAlign.center,
                      bold: FontWeight.w600,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        BaseText(
                          text:
                              '${controller.currentVersion.value} build${controller.buildNumber.value}',
                          color: greyTextColor,
                          bold: FontWeight.w500,
                        ),
                        const Icon(
                          Icons.arrow_right_alt,
                          color: whiteColor,
                        ),
                        BaseText(
                          text: controller.storeVersion.value ?? '',
                          color: Colors.green,
                          bold: FontWeight.w500,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: BaseOutlineButton(
                      borderColor: whiteColor,
                      fgColor: whiteColor,
                      label: 'Mungkin Nanti',
                      onPressed: controller.navigate,
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: BaseButton(
                      bgColor: whiteColor,
                      fgColor: blackColor,
                      label: 'Update Sekarang',
                      onPressed: controller.updateApps,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
