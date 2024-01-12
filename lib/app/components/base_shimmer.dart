import 'package:flutter/material.dart';
import 'package:member_rkm/app/core/values/colors.dart';
import 'package:shimmer/shimmer.dart';

class BaseShimmer extends StatelessWidget {
  const BaseShimmer({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: greyTextColor,
      highlightColor: Colors.grey.shade200,
      child: child,
    );
  }
}
