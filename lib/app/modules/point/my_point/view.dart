import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:member_rkm/app/components/base_appbar.dart';
import 'package:member_rkm/app/core/values/colors.dart';
import 'package:member_rkm/app/modules/point/my_point/widgets/list_prize.dart';
import 'package:member_rkm/app/modules/point/my_point/widgets/mypoint_header.dart';

class MyPointPage extends StatelessWidget {
  const MyPointPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar(
        bgColor: blackColor,
        fgColor: whiteColor,
        title: 'Poin',
        preferredSize: Size.fromHeight(kToolbarHeight),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: Get.height * 0.885,
          width: Get.width,
          child: Column(
            children: [
              MyPointHeader(),
              ListPrize(),
            ],
          ),
        ),
      ),
    );
  }
}