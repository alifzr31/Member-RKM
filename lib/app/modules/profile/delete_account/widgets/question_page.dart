import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:member_rkm/app/components/base_button.dart';
import 'package:member_rkm/app/components/base_formgrouptextarea.dart';
import 'package:member_rkm/app/components/base_text.dart';
import 'package:member_rkm/app/core/values/colors.dart';
import 'package:member_rkm/app/modules/profile/controller.dart';

class QuestionPage extends StatelessWidget {
  QuestionPage({super.key});
  final controller = Get.find<ProfileController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const BaseText(
              text: 'Apakah anda yakin akan menghapus akun?',
              size: 16,
              color: whiteColor,
              bold: FontWeight.w600,
            ),
            const SizedBox(height: 3),
            const BaseText(
              text:
                  'Bisakah Anda membagikan kepada kami apa yang tidak berfungsi? Kami memperbaiki bug segera setelah kami menemukannya. Jika ada sesuatu yang luput dari perhatian kami, kami akan sangat bersyukur karena menyadarinya dan memperbaikinya.',
              size: 12,
              color: greyTextColor,
            ),
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: Form(
                      key: controller.formKeyQuestion.value,
                      child: BaseFormGroupTextArea(
                        label: '',
                        hint: 'Masukkan alasan anda (Opsional)',
                        controller: controller.reasonController.value,
                        minLines: 10,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: Get.width,
                    child: BaseButton(
                      bgColor: whiteColor,
                      fgColor: blackColor,
                      label: 'Lanjutkan',
                      onPressed: () {},
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
