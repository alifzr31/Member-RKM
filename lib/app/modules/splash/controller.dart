import 'dart:async';

import 'package:app_version_update/app_version_update.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashController extends GetxController {
  final stackWidget = [
    Center(
      child: SvgPicture.asset(
        'assets/images/logo_splash.svg',
        width: 200,
      ),
    ),
    Positioned(
      top: 0,
      bottom: 54,
      left: 65,
      child: Center(
        child: Lottie.asset(
          'assets/lotties/mini_logo.json',
          width: 50,
          frameRate: FrameRate(144),
        ),
      ),
    ),
  ].obs;

  @override
  void onInit() {
    // checkUpdate();
    navigate();
    super.onInit();
  }

  Future<void> checkUpdate() async {
    await AppVersionUpdate.checkForUpdates(
      playStoreId: 'id.co.rkm.member',
      country: 'id',
    ).then((result) async {
      if (result.canUpdate!) {
        await Future.delayed(const Duration(seconds: 3), () {
          Get.offAndToNamed(
            '/updater',
            arguments: {
              'storeUrl': result.storeUrl,
              'storeVersion': result.storeVersion,
            },
          );
        });
      } else {
        navigate();
      }
    });
  }

  void navigate() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final opened = sharedPreferences.getBool('opened');

    Timer(const Duration(seconds: 3), () {
      if (opened == true || opened != null) {
        Get.offAllNamed('/dashboard');
      } else {
        Get.offAllNamed('/onboard');
      }
    });
  }
}
