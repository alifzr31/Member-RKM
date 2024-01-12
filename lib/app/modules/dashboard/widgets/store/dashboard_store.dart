import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:member_rkm/app/modules/dashboard/components/store/custom_slidingbox.dart';
import 'package:member_rkm/app/modules/dashboard/controller.dart';
import 'package:member_rkm/app/modules/dashboard/widgets/store/backdrop_slidingbox.dart';
import 'package:member_rkm/app/modules/dashboard/widgets/store/body_slidingbox.dart';

class DashboardStore extends StatelessWidget {
  DashboardStore({super.key});
  final controller = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.locationLoading.value || controller.storeLoading.value
          ? const Center(child: CircularProgressIndicator())
          : CustomSlidingBox(
              controller: controller.boxController.value,
              backdropBody: BackDropSlidingBox(),
              body: BodySlidingBox(),
            ),
    );
  }
}
