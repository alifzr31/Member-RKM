import 'package:flutter/material.dart';
import 'package:member_rkm/app/components/base_appbar.dart';
import 'package:member_rkm/app/core/values/colors.dart';
import 'package:member_rkm/app/modules/shopping_history/widgets/shopping_body.dart';

class ShoppingPage extends StatelessWidget {
  const ShoppingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar(
        bgColor: blackColor,
        fgColor: whiteColor,
        title: 'Riwayat Belanja',
        preferredSize: Size.fromHeight(kToolbarHeight),
      ),
      body: ShoppingBody(),
    );
  }
}
