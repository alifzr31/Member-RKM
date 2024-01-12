import 'package:get/get.dart';
import 'package:member_rkm/app/data/providers/dashboard_provider.dart';
import 'package:member_rkm/app/modules/dashboard/controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardProvider>(() => DashboardProvider());
    Get.lazyPut<DashboardController>(() => DashboardController(dashboardProvider: Get.find()));
  }
}