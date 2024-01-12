import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:member_rkm/app/components/base_appbar.dart';
import 'package:member_rkm/app/core/values/colors.dart';
import 'package:member_rkm/app/modules/content/detail_content/widgets/detailcontent_body.dart';

class DetailContentPage extends StatelessWidget {
  const DetailContentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        bgColor: blackColor,
        fgColor: whiteColor,
        title: Get.arguments['category'],
        preferredSize: const Size.fromHeight(kToolbarHeight),
      ),
      body: DetailContentBody(),
    );
  }
}
