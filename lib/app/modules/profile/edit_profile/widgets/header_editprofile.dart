import 'dart:io';

import 'package:boxicons/boxicons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:member_rkm/app/components/base_text.dart';
import 'package:member_rkm/app/core/utils/api_url.dart';
import 'package:member_rkm/app/core/values/colors.dart';
import 'package:member_rkm/app/modules/dashboard/controller.dart';
import 'package:member_rkm/app/modules/profile/controller.dart';

class HeaderEditProfile extends StatelessWidget {
  HeaderEditProfile({super.key});
  final controller = Get.find<ProfileController>();
  final userController = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SizedBox(
        height: 160,
        width: Get.width,
        child: Column(
          children: [
            if (userController.profile.value?.phoneUser == null)
              Container(
                width: Get.width,
                color: Colors.blue.shade100,
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
                child: Center(
                  child: BaseText(
                    text:
                        'Pastikan No. telepon sudah benar karena hanya bisa di isi 1 kali',
                    size: 13,
                    textAlign: TextAlign.center,
                    color: Colors.blue.shade800,
                    bold: FontWeight.w500,
                  ),
                ),
              ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      CircleAvatar(
                        radius: 35,
                        backgroundImage: controller.profileImage.value != null
                            ? Image.file(File(
                                    controller.profileImage.value?.path ?? ''))
                                .image
                            : Image.network(
                                    '${ApiUrl.baseStorageUrl}${userController.profile.value?.image}')
                                .image,
                      ),
                      InkResponse(
                        onTap: () async {
                          final ImagePicker picker = ImagePicker();
                          controller.profileImage.value =
                              await picker.pickImage(
                            source: ImageSource.gallery,
                            imageQuality: 60,
                          );
                        },
                        child: CircleAvatar(
                          radius: 35,
                          backgroundColor: Colors.black.withOpacity(0.3),
                          child: const Icon(
                            Boxicons.bx_camera,
                            color: whiteColor,
                            size: 30,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const BaseText(
                    text: 'Ubah Foto',
                    bold: FontWeight.w500,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
