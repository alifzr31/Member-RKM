import 'package:get/get.dart';
import 'package:member_rkm/app/modules/onboard/controller.dart';

class OnBoardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OnBoardController>(() => OnBoardController());
  }
}
