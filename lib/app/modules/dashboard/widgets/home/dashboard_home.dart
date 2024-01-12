import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:member_rkm/app/components/base_refresh.dart';
import 'package:member_rkm/app/core/values/colors.dart';
import 'package:member_rkm/app/modules/dashboard/controller.dart';
import 'package:member_rkm/app/modules/dashboard/widgets/home/content_home.dart';
import 'package:member_rkm/app/modules/dashboard/widgets/home/header_home.dart';
import 'package:member_rkm/app/modules/dashboard/widgets/home/nearest_home.dart';

class DashboardHome extends StatelessWidget {
  DashboardHome({super.key});
  final controller = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return BaseRefresh(
      onRefresh: controller.refreshHome,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            height: 80,
            width: Get.width,
            color: blackColor,
            child: Center(
              child: SvgPicture.asset(
                'assets/images/logo.svg',
                width: 120,
              ),
            ),
          ),
          HeaderHome(),
          ContentHome(),
          NearestHome(),
        ],
      ),
    );
  }
}
