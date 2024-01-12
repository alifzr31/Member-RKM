import 'package:get/get.dart';
import 'package:member_rkm/app/data/providers/sendemail_provider.dart';
import 'package:member_rkm/app/modules/auth/send_email/controller.dart';

class SendEmailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SendEmailProvider>(() => SendEmailProvider());
    Get.lazyPut<SendEmailController>(() => SendEmailController(sendEmailProvider: Get.find()));
  }
}