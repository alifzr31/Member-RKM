import 'package:flutter/material.dart';
import 'package:member_rkm/app/components/base_appbar.dart';
import 'package:member_rkm/app/modules/content/all_content/widgets/allcontent_body.dart';

class AllContentPage extends StatelessWidget {
  const AllContentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar(
        title: 'Event & Promo',
        preferredSize: Size.fromHeight(kToolbarHeight),
      ),
      body: AllContentBody(),
    );
  }
}
