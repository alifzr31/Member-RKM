import 'package:get/get.dart';
import 'package:member_rkm/app/data/providers/resetpin_provider.dart';
import 'package:member_rkm/app/modules/pin/reset_pin/controller.dart';

class ResetPinBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ResetPinProvider());
    Get.lazyPut(() => ResetPinController(resetPinProvider: Get.find()));
  }
}