import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:member_rkm/app/components/base_button.dart';
import 'package:member_rkm/app/components/base_formgrouppin.dart';
import 'package:member_rkm/app/components/base_text.dart';
import 'package:member_rkm/app/core/values/colors.dart';
import 'package:member_rkm/app/modules/auth/verify/controller.dart';

class ReceiveVerifyPage extends StatelessWidget {
  ReceiveVerifyPage({super.key});
  final controller = Get.find<VerifyController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BaseText(
            text: controller.type.value == 'wa'
                ? 'Kode OTP sudah dikirim ke Whatsapp'
                : 'Link verifikasi akun sudah dikirim ke email',
            textAlign: TextAlign.center,
          ),
          BaseText(
            text: controller.type.value == 'wa'
                ? controller.phone.value ?? ''
                : controller.email.value ?? '',
            bold: FontWeight.w600,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 15),
          controller.type.value == 'wa'
              ? Form(
                  key: controller.formKey.value,
                  child: Column(
                    children: [
                      BaseFormGroupPin(
                        label: 'Kode OTP',
                        controller: controller.otpController.value,
                        obscureText: false,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Silahkan masukkan kode OTP';
                          }

                          return null;
                        },
                      ),
                      const SizedBox(height: 15),
                      SizedBox(
                        width: Get.width,
                        child: BaseButton(
                          bgColor: whiteColor,
                          fgColor: blackColor,
                          label: 'Submit',
                          onPressed: () {
                            if (controller.formKey.value.currentState?.validate() ?? false) {
                              controller.verifyWa();
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                )
              : SizedBox(
                  width: Get.width,
                  child: BaseButton(
                    bgColor: whiteColor,
                    fgColor: blackColor,
                    label: 'Buka Email',
                    onPressed: controller.openMailApp,
                  ),
                ),
          const SizedBox(height: 5),
          BaseText(
            text: controller.type.value == 'wa'
                ? 'Pastikan anda menerima whatsapp dari RKM'
                : 'Pastikan anda menerima email dari email@rkm.co.id',
            size: 12,
            color: greyTextColor,
          ),
        ],
      ),
    );
  }
}
