import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:member_rkm/app/data/providers/point_provider.dart';

class PointController extends GetxController {
  final PointProvider pointProvider;

  PointController({required this.pointProvider});

  final searchPrizeController = TextEditingController().obs;
  final searchPrize = Rx<String?>(null);

  final formKeyCabang = GlobalKey<FormState>().obs;
  final selectCity = Rx<String?>(null);
  final selectCabang = Rx<String?>(null);

  @override
  void onClose() {
    searchPrizeController.value.dispose();
    super.onClose();
  }
}