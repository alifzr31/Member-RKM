import 'package:get/get.dart';
import 'package:member_rkm/app/data/providers/dashboard_provider.dart';
import 'package:member_rkm/app/data/providers/point_provider.dart';
import 'package:member_rkm/app/modules/dashboard/controller.dart';
import 'package:member_rkm/app/modules/point/controller.dart';

class PointBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PointProvider());
    Get.lazyPut(() => PointController(pointProvider: Get.find()));

    Get.lazyPut(() => DashboardProvider());
    Get.lazyPut(() => DashboardController(dashboardProvider: Get.find()));
  }
}
