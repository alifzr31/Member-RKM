import 'package:flutter/material.dart';
import 'package:member_rkm/app/components/base_appbar.dart';
import 'package:member_rkm/app/core/values/colors.dart';
import 'package:member_rkm/app/modules/tracking/widgets/tracking_header.dart';
import 'package:member_rkm/app/modules/tracking/widgets/tracking_timeline.dart';

class TrackingPage extends StatelessWidget {
  const TrackingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar(
        bgColor: blackColor,
        fgColor: whiteColor,
        title: 'Tracking Hadiah',
        preferredSize: Size.fromHeight(kToolbarHeight),
      ),
      body: Column(
        children: [
          TrackingHeader(),
          TrackingTimeline(),
        ],
      ),
    );
  }
}
