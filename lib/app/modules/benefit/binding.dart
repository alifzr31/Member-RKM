import 'package:get/get.dart';
import 'package:member_rkm/app/modules/benefit/controller.dart';

class BenefitBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BenefitController>(() => BenefitController());
  }
}