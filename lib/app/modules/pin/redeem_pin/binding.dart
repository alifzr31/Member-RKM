import 'package:get/get.dart';
import 'package:member_rkm/app/data/providers/pin_provider.dart';
import 'package:member_rkm/app/modules/pin/redeem_pin/controller.dart';

class RedeemPinBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PinProvider());
    Get.lazyPut(() => RedeemPinController(pinProvider: Get.find()));
  }
}