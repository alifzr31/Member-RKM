import 'package:boxicons/boxicons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:member_rkm/app/components/base_searchfield.dart';
import 'package:member_rkm/app/components/base_text.dart';
import 'package:member_rkm/app/core/values/app_helpers.dart';
import 'package:member_rkm/app/modules/dashboard/components/store/card_store.dart';
import 'package:member_rkm/app/modules/dashboard/controller.dart';

class BodySlidingBox extends StatelessWidget {
  BodySlidingBox({super.key});
  final controller = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const BaseText(
                  text: 'Lokasi RKM Terdekat',
                  size: 16,
                  bold: FontWeight.w600,
                ),
                const SizedBox(height: 5),
                BaseSearchField(
                  hint: 'Cari Toko',
                  controller: controller.findStoreController.value,
                  onChanged: (value) {
                    controller.findStore.value = value;
                    controller.listFindStore.value = controller.store
                        .where((e) =>
                            e.name.toString().toLowerCase().contains(
                                controller.findStore.value?.toLowerCase() ??
                                    '') ||
                            e.address.toString().toLowerCase().contains(
                                controller.findStore.value?.toLowerCase() ??
                                    ''))
                        .toList();
                  },
                  onTap: () {
                    controller.boxController.value.showBox();
                  },
                  onFieldSubmitted: (value) {
                    controller.boxController.value.closeBox();
                  },
                  suffixIcon: controller.findStore.value == null ||
                          controller.findStore.value == ''
                      ? null
                      : IconButton(
                          onPressed: () {
                            controller.findStoreController.value.text = '';
                            controller.findStore.value = null;
                          },
                          icon: Icon(
                            Boxicons.bx_x,
                            color: Colors.grey.shade600,
                          ),
                        ),
                ),
              ],
            ),
          ),
          Expanded(
            child: controller.storeLoading.value
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                    physics: const ClampingScrollPhysics(),
                    padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
                    itemCount: controller.findStore.value == null
                        ? controller.store.length
                        : controller.listFindStore.length,
                    itemBuilder: (context, index) {
                      final store = controller.findStore.value == null
                          ? controller.store[index]
                          : controller.listFindStore[index];
                      final distance =
                          AppHelpers.decimalTwoDigits(store.distance ?? '0');

                      return CardStore(
                        name: store.name ?? '',
                        address: store.address ?? '',
                        distance: distance,
                        onTap: () {
                          controller.selectedLat.value =
                              double.parse(store.lat ?? '');
                          controller.selectedLong.value =
                              double.parse(store.long ?? '');
                          controller.indexStore.value = index;
                          controller.moveStore();
                        },
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
