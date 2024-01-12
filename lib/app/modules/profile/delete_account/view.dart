import 'package:flutter/material.dart';
import 'package:member_rkm/app/components/base_appbar.dart';
import 'package:member_rkm/app/core/values/colors.dart';
import 'package:member_rkm/app/modules/profile/delete_account/widgets/deleteaccount_body.dart';

class DeleteAccountPage extends StatelessWidget {
  const DeleteAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar(
        bgColor: blackColor,
        fgColor: whiteColor,
        title: 'Hapus Akun',
        preferredSize: Size.fromHeight(kToolbarHeight),
      ),
      body: DeleteAccountBody(),
    );
  }
}
