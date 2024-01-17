import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:member_rkm/app/modules/profile/controller.dart';
import 'package:member_rkm/app/modules/profile/edit_profile/widgets/account_information.dart';
import 'package:member_rkm/app/modules/profile/edit_profile/widgets/appbar_editprofile.dart';
import 'package:member_rkm/app/modules/profile/edit_profile/widgets/header_editprofile.dart';
import 'package:member_rkm/app/modules/profile/edit_profile/widgets/personal_information.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarEditProfile(
        preferredSize: const Size.fromHeight(kToolbarHeight),
      ),
      body: EditProfileBody(),
    );
  }
}

class EditProfileBody extends StatelessWidget {
  EditProfileBody({super.key});
  final controller = Get.find<ProfileController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Form(
        key: controller.formKeyEditProfile.value,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            HeaderEditProfile(),
            AccountInformation(),
            PersonalInformation(),
          ],
        ),
      ),
    );
  }
}
