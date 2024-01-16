import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:member_rkm/app/components/base_button.dart';
import 'package:member_rkm/app/components/base_formgrouppin.dart';
import 'package:member_rkm/app/components/base_text.dart';
import 'package:member_rkm/app/core/values/app_helpers.dart';
import 'package:member_rkm/app/core/values/colors.dart';
import 'package:member_rkm/app/modules/pin/forgot_pin/controller.dart';

class ForgotPinVerify extends StatelessWidget {
  ForgotPinVerify({super.key});
  final controller = Get.find<ForgotPinController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SizedBox(
          height: Get.height,
          width: Get.width,
          child: Column(
            children: [
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: InkWell(
                      onTap: () => controller.movePage(0),
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                        child: BaseText(text: 'Kembali'),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const BaseText(
                            text: 'Lupa PIN',
                            size: 20,
                            bold: FontWeight.w600,
                          ),
                          RichText(
                            text: TextSpan(
                              style: DefaultTextStyle.of(context).style,
                              children: controller.chooseVerify.value == 'email'
                                  ? [
                                      const TextSpan(
                                        text:
                                            'Kode OTP sudah dikirim ke email ',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: greyTextColor,
                                        ),
                                      ),
                                      TextSpan(
                                        text: AppHelpers.maskEmail(
                                            controller.email.value ?? ''),
                                        style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ]
                                  : [
                                      const TextSpan(
                                        text:
                                            'Kode OTP sudah dikirim ke whatsapp ',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: greyTextColor,
                                        ),
                                      ),
                                      TextSpan(
                                        text: AppHelpers.maskPhoneNumber(
                                            controller.phoneNumber.value ?? ''),
                                        style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),
                    Form(
                      key: controller.formKey.value,
                      child: BaseFormGroupPin(
                        label: 'Kode OTP',
                        controller: controller.otpController.value,
                        obscureText: false,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Masukkan kode OTP yang anda dapatkan';
                          }

                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 15),
                    SizedBox(
                      width: Get.width,
                      child: BaseButton(
                        bgColor: whiteColor,
                        fgColor: blackColor,
                        label: 'Submit',
                        onPressed: () {
                          if (controller.formKey.value.currentState
                                  ?.validate() ??
                              false) {
                            controller.verifyOtp();
                          }
                        },
                      ),
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        BaseText(
                            text: controller.chooseVerify.value == 'email'
                                ? 'Tidak menerima email? '
                                : 'Tidak menerima pesan? '),
                        GestureDetector(
                          onTap: () {},
                          child: const BaseText(
                            text: 'Kirim Ulang',
                            color: orangeColor,
                            bold: FontWeight.w500,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
