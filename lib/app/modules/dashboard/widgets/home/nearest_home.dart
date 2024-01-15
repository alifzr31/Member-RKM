import 'package:boxicons/boxicons.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:member_rkm/app/components/base_bottomsheet.dart';
import 'package:member_rkm/app/components/base_shimmer.dart';
import 'package:member_rkm/app/components/base_text.dart';
import 'package:member_rkm/app/core/values/app_helpers.dart';
import 'package:member_rkm/app/modules/dashboard/components/home/nearest_box.dart';
import 'package:member_rkm/app/modules/dashboard/controller.dart';
import 'package:member_rkm/app/core/values/colors.dart';
import 'package:member_rkm/app/modules/dashboard/widgets/locationdesc_widget.dart';

class NearestHome extends StatelessWidget {
  NearestHome({super.key});
  final controller = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        height: 190,
        width: Get.width,
        margin: const EdgeInsets.symmetric(vertical: 15),
        padding: const EdgeInsets.all(15),
        color: bgSectionColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BaseText(
                        text: 'Cari Toko Terdekat',
                        size: 16,
                        color: whiteColor,
                        bold: FontWeight.w600,
                      ),
                      BaseText(
                        text: 'Temukan toko RKM di dekat lokasi anda',
                        size: 12,
                        color: greyTextColor,
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () => controller.currentIndex.value = 2,
                  child: const BaseText(
                    text: 'Lihat Semua',
                    color: orangeColor,
                    bold: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Expanded(
              child: controller.servicestatus.isFalse ||
                      controller.haspermission.isFalse
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Boxicons.bxs_map,
                            size: 40,
                          ),
                          const SizedBox(height: 5),
                          TextButton.icon(
                            onPressed: () async {
                              controller.servicestatus.value =
                                  await Geolocator.isLocationServiceEnabled();
                              final permission =
                                  await Geolocator.checkPermission();

                              if (controller.servicestatus.value) {
                                if (permission == LocationPermission.denied) {
                                  baseBottomSheet(280, LocationDescWidget());
                                } else if (permission ==
                                    LocationPermission.deniedForever) {
                                  baseBottomSheet(280, LocationDescWidget());
                                } else {
                                  controller.fetchLocation();
                                }
                              } else {
                                baseBottomSheet(280, LocationDescWidget());
                              }
                            },
                            icon: const Icon(Boxicons.bx_refresh),
                            label: BaseText(
                              text: controller.servicestatus.isFalse
                                  ? 'Nyalakan GPS'
                                  : controller.haspermission.isFalse
                                      ? 'Berikan Izin'
                                      : 'Muat Ulang',
                            ),
                          ),
                        ],
                      ),
                    )
                  : controller.storeLoading.value
                      ? ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return const BaseShimmer(
                              child: NearestBox(
                                storeName: '',
                                address: '',
                                distance: '',
                              ),
                            );
                          },
                        )
                      : ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.store.length > 2
                              ? controller.store.sublist(0, 3).length
                              : controller.store.length,
                          itemBuilder: (context, index) {
                            final store = controller.store.length > 2
                                ? controller.store.sublist(0, 3)[index]
                                : controller.store[index];
                            final distance = AppHelpers.decimalTwoDigits(
                                store.distance ?? '0');

                            return NearestBox(
                              storeName: store.name ?? '',
                              address: store.address ?? '',
                              distance: distance,
                              onTap: () {
                                controller.currentIndex.value = 2;
                                controller.boxController.value.closeBox();
                                controller.selectedLat.value =
                                    double.parse(store.lat ?? '');
                                controller.selectedLong.value =
                                    double.parse(store.long ?? '');
                                controller.moveStore();
                              },
                            );
                          },
                        ),
            ),
          ],
        ),
      ),
    );
  }
}
