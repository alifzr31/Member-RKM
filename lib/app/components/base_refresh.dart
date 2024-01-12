import 'package:flutter/material.dart';
import 'package:member_rkm/app/core/values/colors.dart';

class BaseRefresh extends StatelessWidget {
  const BaseRefresh({
    Key? key,
    required this.onRefresh,
    required this.child,
  }) : super(key: key);

  final Future<void> Function() onRefresh;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      backgroundColor: blackColor,
      color: orangeColor,
      onRefresh: onRefresh,
      child: child,
    );
  }
}