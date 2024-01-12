import 'package:flutter/material.dart';
import 'package:member_rkm/app/components/base_appbar.dart';
import 'package:member_rkm/app/core/values/colors.dart';
import 'package:member_rkm/app/modules/dashboard/widgets/dashboard_body.dart';
import 'package:member_rkm/app/modules/dashboard/widgets/dashboard_bottomnav.dart';
import 'package:member_rkm/app/modules/dashboard/widgets/dashboard_fab.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar(
        title: '',
        preferredSize: Size.zero,
        bgColor: blackColor,
      ),
      body: DashboardBody(),
      bottomNavigationBar: DashboardBottomNav(),
      floatingActionButton: DashboardFab(),
    );
  }
}
