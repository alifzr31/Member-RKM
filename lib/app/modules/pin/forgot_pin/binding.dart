import 'package:get/get.dart';
import 'package:member_rkm/app/data/providers/dashboard_provider.dart';
import 'package:member_rkm/app/data/providers/forgotpin_provider.dart';
import 'package:member_rkm/app/modules/dashboard/controller.dart';
import 'package:member_rkm/app/modules/pin/forgot_pin/controller.dart';

class ForgotPinBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ForgotPinProvider());
    Get.lazyPut(() => ForgotPinController(forgotPinProvider: Get.find()));

    Get.lazyPut(() => DashboardProvider());
    Get.lazyPut(() => DashboardController(dashboardProvider: Get.find()));
  }
}