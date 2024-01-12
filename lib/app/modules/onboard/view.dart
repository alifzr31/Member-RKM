import 'package:flutter/material.dart';
import 'package:member_rkm/app/modules/onboard/widgets/body_onboard.dart';
import 'package:member_rkm/app/modules/onboard/widgets/footer_onboard.dart';

class OnBoardPage extends StatelessWidget {
  const OnBoardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          BodyOnboard(),
          FooterOnboard(),
        ],
      ),
    );
  }
}