import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:member_rkm/app/components/base_appbar.dart';
import 'package:member_rkm/app/core/values/colors.dart';
import 'package:member_rkm/app/modules/pin/createchange_pin/widgets/body_changepin.dart';
import 'package:member_rkm/app/modules/pin/createchange_pin/widgets/body_createpin.dart';

class PinPage extends StatelessWidget {
  const PinPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        bgColor: blackColor,
        fgColor: whiteColor,
        title: Get.currentRoute == '/createPin'
            ? 'Buat PIN'
            : Get.currentRoute == '/changePin'
                ? 'Ganti PIN'
                : '',
        preferredSize: const Size.fromHeight(kToolbarHeight),
      ),
      body: Get.currentRoute == '/createPin'
          ? BodyCreatePin()
          : Get.currentRoute == '/changePin'
              ? BodyChangePin()
              : Container(),
    );
  }
}
