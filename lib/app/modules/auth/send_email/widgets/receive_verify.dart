import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:member_rkm/app/components/base_button.dart';
import 'package:member_rkm/app/components/base_text.dart';
import 'package:member_rkm/app/core/values/colors.dart';
import 'package:member_rkm/app/modules/auth/send_email/controller.dart';

class ReceiveVerifyPage extends StatelessWidget {
  ReceiveVerifyPage({super.key});
  final controller = Get.find<SendEmailController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const BaseText(
            text: 'Link verifikasi akun sudah dikirim ke email',
            textAlign: TextAlign.center,
          ),
          BaseText(
            text: controller.email.value ?? '',
            bold: FontWeight.w600,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 15),
          SizedBox(
            width: Get.width,
            child: BaseButton(
              bgColor: whiteColor,
              fgColor: blackColor,
              label: 'Buka Email',
              onPressed: controller.openMailApp,
            ),
          ),
          const SizedBox(height: 5),
          const BaseText(
            text: 'Pastikan anda menerima email dari email@rkm.co.id',
            size: 12,
            color: greyTextColor,
          ),
        ],
      ),
    );
  }
}
