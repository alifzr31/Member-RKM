import 'package:flutter/material.dart';
import 'package:flutter_sliding_box/flutter_sliding_box.dart';
import 'package:get/get.dart';
import 'package:member_rkm/app/core/values/colors.dart';

class CustomSlidingBox extends StatelessWidget {
  const CustomSlidingBox({
    Key? key,
    required this.controller,
    this.backdropBody,
    this.body,
  }) : super(key: key);

  final BoxController controller;
  final Widget? backdropBody;
  final Widget? body;

  @override
  Widget build(BuildContext context) {
    return SlidingBox(
      controller: controller,
      collapsed: true,
      minHeight: 240,
      maxHeight: Get.height * 0.5,
      color: baseBgScaffold,
      borderRadius: BorderRadius.circular(15),
      draggableIconBackColor: bgSectionColor,
      draggableIconColor: whiteColor,
      animationCurve: Curves.easeInOutCubic,
      animationDuration: const Duration(milliseconds: 500),
      backdrop: Backdrop(
        body: backdropBody,
      ),
      body: SizedBox(
        height: (Get.height * 0.5) - 30,
        width: Get.width,
        child: body,
      ),
    );
  }
}
