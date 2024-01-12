import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:member_rkm/app/modules/profile/controller.dart';
import 'package:member_rkm/app/modules/profile/delete_account/widgets/question_page.dart';

class DeleteAccountBody extends StatelessWidget {
  DeleteAccountBody({super.key});
  final controller = Get.find<ProfileController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => PageView(
        controller: controller.pageController.value,
        onPageChanged: (index) => controller.currentPageDeleteAccount.value = index,
        children: [
          QuestionPage(),
          Container(),
        ],
      ),
    );
  }
}