import 'package:get/get.dart';
import 'package:member_rkm/app/data/providers/pin_provider.dart';
import 'package:member_rkm/app/modules/pin/reset_pin/controller.dart';

class ResetPinBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PinProvider());
    Get.lazyPut(() => ResetPinController(pinProvider: Get.find()));
  }
}