import 'package:get/get.dart';
import 'package:member_rkm/app/data/providers/forgotpassword_provider.dart';
import 'package:member_rkm/app/modules/auth/forgot_password/controller.dart';

class ForgotPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ForgotPasswordProvider());
    Get.lazyPut(() => ForgotPasswordController(forgotPasswordProvider: Get.find()));
  }
}