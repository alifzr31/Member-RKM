import 'package:flutter/material.dart';
import 'package:member_rkm/app/components/base_appbar.dart';
import 'package:member_rkm/app/core/values/colors.dart';
import 'package:member_rkm/app/modules/pin/reset_pin/widgets/resetpin_body.dart';

class ResetPinPage extends StatelessWidget {
  const ResetPinPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const  BaseAppBar(
        bgColor: blackColor,
        fgColor: whiteColor,
        title: 'Reset PIN',
        preferredSize: Size.fromHeight(kToolbarHeight),
      ),
      body: ResetPinBody(),
    );
  }
}
