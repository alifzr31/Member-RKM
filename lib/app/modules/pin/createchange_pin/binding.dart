import 'package:get/get.dart';
import 'package:member_rkm/app/data/providers/pin_provider.dart';
import 'package:member_rkm/app/modules/pin/createchange_pin/controller.dart';

class PinBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PinProvider>(() => PinProvider());
    Get.lazyPut<PinController>(() => PinController(pinProvider: Get.find()));
  }
}