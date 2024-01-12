import 'package:get/get.dart';
import 'package:member_rkm/app/data/providers/register_provider.dart';
import 'package:member_rkm/app/modules/auth/register/controller.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterProvider>(() => RegisterProvider());
    Get.lazyPut<RegisterController>(() => RegisterController(registerProvider: Get.find()));
  }
}