import 'package:get/get.dart';
import 'package:member_rkm/app/modules/updater/controller.dart';

class UpdaterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UpdaterController>(() => UpdaterController());
  }
}