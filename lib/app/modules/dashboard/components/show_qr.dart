import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:member_rkm/app/components/base_bottomsheet.dart';
import 'package:member_rkm/app/components/base_text.dart';
import 'package:member_rkm/app/core/utils/api_url.dart';
import 'package:member_rkm/app/core/values/app_helpers.dart';
import 'package:member_rkm/app/core/values/colors.dart';
import 'package:screen_brightness/screen_brightness.dart';

void showQR(String noMember) async {
  await setBrightness(1);
  baseBottomSheet(
    280,
    WillPopScope(
      onWillPop: () async {
        await resetBrightness();
        return true;
      },
      child: Stack(
        children: [
          Positioned(
            right: 0,
            child: IconButton(
              padding: EdgeInsets.zero,
              onPressed: () async {
                await resetBrightness();
                Get.back();
              },
              icon: const Icon(Icons.close),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  const BaseText(
                    text: 'Barcode Member Saya',
                    size: 16,
                  ),
                  SelectableText(
                    AppHelpers.addSpaces(noMember),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'OCR-A',
                      letterSpacing: 2,
                    ),
                  ),
                  Expanded(
                    child: SvgPicture.network(
                      '${ApiUrl.baseStorageUrl}${StorageUrl.qr}/$noMember.svg',
                    ),
                  ),
                  const BaseText(
                    text: 'Tunjukan kode QR di atas saat berbelanja di\nTriwarna',
                    textAlign: TextAlign.center,
                    bold: FontWeight.w500,
                    color: greyTextColor,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Future<void> setBrightness(double brightness) async {
  try {
    await ScreenBrightness().setScreenBrightness(brightness);
  } catch (e) {
    rethrow;
  }
}

Future<void> resetBrightness() async {
  try {
    await ScreenBrightness().resetScreenBrightness();
  } catch (e) {
    rethrow;
  }
}
