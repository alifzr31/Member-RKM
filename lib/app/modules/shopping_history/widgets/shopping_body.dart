import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:member_rkm/app/modules/shopping_history/components/shopping_card.dart';
import 'package:member_rkm/app/modules/shopping_history/controller.dart';

class ShoppingBody extends StatelessWidget {
  ShoppingBody({super.key});
  final controller = Get.find<ShoppingController>();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(15),
      itemCount: 10,
      itemBuilder: (context, index) {
        return ShoppingCard(
          noStruk: 'RKM23232323',
          totalItem: '4',
          date: DateTime.now(),
          totalPrice: 1360500,
        );
      },
    );
  }
}
