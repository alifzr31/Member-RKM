import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:member_rkm/app/components/base_bottomsheet.dart';
import 'package:member_rkm/app/components/base_nodata.dart';
import 'package:member_rkm/app/modules/dashboard/components/store/custom_slidingbox.dart';
import 'package:member_rkm/app/modules/dashboard/controller.dart';
import 'package:member_rkm/app/modules/dashboard/widgets/locationdesc_widget.dart';
import 'package:member_rkm/app/modules/dashboard/widgets/store/backdrop_slidingbox.dart';
import 'package:member_rkm/app/modules/dashboard/widgets/store/body_slidingbox.dart';

class DashboardStore extends StatelessWidget {
  DashboardStore({super.key});
  final controller = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.servicestatus.isFalse || controller.haspermission.isFalse
          ? Padding(
              padding: const EdgeInsets.all(15),
              child: BaseNoData(
                title: controller.servicestatus.isFalse
                    ? 'Akses Lokasi Tidak Aktif'
                    : controller.haspermission.isFalse
                        ? 'Akses Lokasi Tidak Diizinkan'
                        : 'Toko Tidak Ditemukan',
                subtitle: controller.servicestatus.isFalse
                    ? 'Nyalakan akses lokasi perangkat anda untuk melihat toko yang ada di dekat anda'
                    : controller.haspermission.isFalse
                        ? 'Berikan akses lokasi agar dapat melihat toko yang ada di dekat anda'
                        : 'Silahkan lakukan muat ulang data toko',
                labelButton: controller.servicestatus.isFalse
                    ? 'Nyalakan GPS'
                    : controller.haspermission.isFalse
                        ? 'Berikan Izin'
                        : 'Muat Ulang',
                onPressed: () async {
                  controller.servicestatus.value =
                      await Geolocator.isLocationServiceEnabled();
                  final permission = await Geolocator.checkPermission();

                  if (controller.servicestatus.value) {
                    if (permission == LocationPermission.denied) {
                      baseBottomSheet(280, LocationDescWidget());
                    } else if (permission == LocationPermission.deniedForever) {
                      baseBottomSheet(280, LocationDescWidget());
                    } else {
                      controller.fetchLocation();
                    }
                  } else {
                    baseBottomSheet(280, LocationDescWidget());
                  }
                },
              ),
            )
          : controller.locationLoading.value || controller.storeLoading.value
              ? const Center(child: CircularProgressIndicator())
              : CustomSlidingBox(
                  controller: controller.boxController.value,
                  backdropBody: BackDropSlidingBox(),
                  body: BodySlidingBox(),
                ),
    );
  }
}
