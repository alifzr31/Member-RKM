import 'package:flutter/material.dart';
import 'package:member_rkm/app/components/base_appbar.dart';
import 'package:member_rkm/app/core/values/colors.dart';
import 'package:member_rkm/app/modules/pin/redeem_pin/widgets/redeempin_body.dart';

class RedeemPinPage extends StatelessWidget {
  const RedeemPinPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar(
        bgColor: blackColor,
        fgColor: whiteColor,
        title: 'Tukar Poin',
        preferredSize: Size.fromHeight(kToolbarHeight),
      ),
      body: RedeemPinBody(),
    );
  }
}
