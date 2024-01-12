import 'package:boxicons/boxicons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:member_rkm/app/components/base_text.dart';
import 'package:member_rkm/app/core/values/colors.dart';
import 'package:member_rkm/app/modules/dashboard/components/store/custom_googlemap.dart';
import 'package:member_rkm/app/modules/dashboard/controller.dart';

class BackDropSlidingBox extends StatelessWidget {
  BackDropSlidingBox({super.key});
  final controller = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Stack(
        children: [
          controller.store.isEmpty
              ? const Center(child: BaseText(text: 'Toko Tidak Ditemukan'))
              : CustomGoogleMap(
                  lat: controller.lat.value ??
                      controller.selectedLat.value ??
                      double.parse(controller.store.first.lat ?? ''),
                  long: controller.long.value ??
                      controller.selectedLong.value ??
                      double.parse(controller.store.first.long ?? ''),
                  markers: controller.markers,
                  onMapCreated: (mapController) {
                    if (!controller.googleMapController.value.isCompleted) {
                      controller.googleMapController.value
                          .complete(mapController);
                    }
                  },
                ),
          if (controller.lat.value != null && controller.long.value != null)
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                margin: const EdgeInsets.only(bottom: 40, right: 10),
                child: FloatingActionButton(
                  backgroundColor: orangeColor,
                  foregroundColor: whiteColor,
                  elevation: 1,
                  onPressed: controller.myLocation,
                  child: const Icon(Boxicons.bx_current_location),
                ),
              ),
            )
        ],
      ),
    );
  }
}
