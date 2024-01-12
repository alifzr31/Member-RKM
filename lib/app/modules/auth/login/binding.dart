import 'package:get/get.dart';
import 'package:member_rkm/app/data/providers/login_provider.dart';
import 'package:member_rkm/app/modules/auth/login/controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginProvider>(() => LoginProvider());
    Get.lazyPut<LoginController>(() => LoginController(loginProvider: Get.find()));
  }
}