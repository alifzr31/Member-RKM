import 'package:flutter/material.dart';

class BaseCard extends StatelessWidget {
  const BaseCard({
    Key? key,
    this.color,
    this.elevation,
    this.margin,
    this.child,
    this.shape,
  }) : super(key: key);

  final Color? color;
  final double? elevation;
  final EdgeInsets? margin;
  final Widget? child;
  final ShapeBorder? shape;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation ?? 3,
      color: color,
      surfaceTintColor: color,
      clipBehavior: Clip.antiAlias,
      shape: shape ??
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
      margin: margin ?? const EdgeInsets.all(4),
      child: child,
    );
  }
}
