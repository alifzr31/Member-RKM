import 'package:get/get.dart';
import 'package:member_rkm/app/modules/success/controller.dart';

class SuccessBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SuccessController>(() => SuccessController());
  }
}