import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:member_rkm/app/components/base_button.dart';
import 'package:member_rkm/app/components/base_formgroupdropdown.dart';
import 'package:member_rkm/app/components/base_text.dart';
import 'package:member_rkm/app/core/values/dialogs.dart';
import 'package:member_rkm/app/core/values/colors.dart';
import 'package:member_rkm/app/modules/point/controller.dart';

class SelectCabangWidget extends StatelessWidget {
  SelectCabangWidget({super.key});
  final controller = Get.find<PointController>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        controller.selectCity.value = null;
        controller.selectCabang.value = null;
        return true;
      },
      child: Stack(
        children: [
          Positioned(
            right: 0,
            child: IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(Icons.close),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                const BaseText(
                  text: 'Pengiriman/Pengambilan Hadiah\ndi Toko Cabang',
                  size: 16,
                  textAlign: TextAlign.center,
                  bold: FontWeight.w600,
                ),
                const SizedBox(height: 15),
                Expanded(
                  child: Form(
                    key: controller.formKeyCabang.value,
                    child: Column(
                      children: [
                        BaseFormGroupDropdown(
                          label: 'Pilih Kota/Kabupaten',
                          hint: 'Pilih Kota/Kabupaten',
                          items: const [
                            DropdownMenuItem(
                              value: 'text',
                              child: BaseText(text: 'text'),
                            ),
                            DropdownMenuItem(
                              value: 'text1',
                              child: BaseText(text: 'text1'),
                            ),
                          ],
                          onChanged: (value) {
                            controller.selectCity.value = value.toString();
                          },
                          validator: (value) {
                            if (controller.selectCity.value == null) {
                              return 'Silahkan pilih kota/kabupaten';
                            }

                            return null;
                          },
                        ),
                        const SizedBox(height: 15),
                        BaseFormGroupDropdown(
                          label: 'Pilih Toko Cabang',
                          hint: 'Pilih Toko Cabang',
                          items: const [
                            DropdownMenuItem(
                              value: 'text',
                              child: BaseText(text: 'text'),
                            ),
                            DropdownMenuItem(
                              value: 'text1',
                              child: BaseText(text: 'text1'),
                            ),
                          ],
                          onChanged: (value) {
                            controller.selectCabang.value = value.toString();
                          },
                          validator: (value) {
                            if (controller.selectCity.value != null) {
                              if (controller.selectCabang.value == null) {
                                return 'Silahkan pilih toko cabang';
                              }
                            }

                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                SizedBox(
                  width: Get.width,
                  child: BaseButton(
                    bgColor: blackColor,
                    fgColor: whiteColor,
                    label: 'Submit',
                    onPressed: () {
                      if (controller.formKeyCabang.value.currentState
                              ?.validate() ??
                          false) {
                        confirmDialog(
                          context,
                          title: 'Apakah Anda Yakin?',
                          descChildren: const [
                            TextSpan(
                              text: 'Anda akan menukarkan ',
                            ),
                            TextSpan(
                              text: '100 Poin ',
                              style: TextStyle(
                                color: orangeColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            TextSpan(
                              text: 'dengan ',
                            ),
                            TextSpan(
                              text: 'Setrika Cosmos ',
                              style: TextStyle(
                                color: orangeColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            TextSpan(
                              text: 'dari toko cabang ',
                            ),
                            TextSpan(
                              text: 'RKM Ahmad Yani (Kota Bandung)',
                              style: TextStyle(
                                color: orangeColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                          okPressed: () {
                            Get.back();
                            Get.toNamed(
                              '/redeemPin',
                              arguments: {},
                            );
                          },
                        );
                      }
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
