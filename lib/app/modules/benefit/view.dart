import 'package:flutter/material.dart';
import 'package:member_rkm/app/components/base_appbar.dart';
import 'package:member_rkm/app/core/values/colors.dart';
import 'package:member_rkm/app/modules/benefit/widgets/body_benefit.dart';
import 'package:member_rkm/app/modules/benefit/widgets/header_benefit.dart';

class BenefitPage extends StatelessWidget {
  const BenefitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar(
        bgColor: blackColor,
        fgColor: whiteColor,
        title: 'Benefit Member',
        preferredSize: Size.fromHeight(kToolbarHeight),
      ),
      body: Column(
        children: [
          HeaderBenefit(),
          BodyBenefit(),
        ],
      ),
    );
  }
}
