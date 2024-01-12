import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:member_rkm/app/modules/auth/send_email/controller.dart';
import 'package:member_rkm/app/modules/auth/send_email/widgets/receive_verify.dart';
import 'package:member_rkm/app/modules/auth/send_email/widgets/send_verify.dart';

class SendEmailPage extends StatelessWidget {
  const SendEmailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Stack(
            children: [
              Positioned(
                top: 80,
                left: 0,
                right: 0,
                child: SvgPicture.asset('assets/images/logo.svg', width: 180),
              ),
              SendEmailPageView(),
            ],
          ),
        ),
      ),
    );
  }
}

class SendEmailPageView extends StatelessWidget {
  SendEmailPageView({super.key});
  final controller = Get.find<SendEmailController>();

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: controller.pageController.value,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        SendVerifyPage(),
        ReceiveVerifyPage(),
      ],
    );
  }
}
