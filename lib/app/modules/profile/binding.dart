import 'package:get/get.dart';
import 'package:member_rkm/app/data/providers/dashboard_provider.dart';
import 'package:member_rkm/app/data/providers/profile_provider.dart';
import 'package:member_rkm/app/modules/dashboard/controller.dart';
import 'package:member_rkm/app/modules/profile/controller.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileProvider>(() => ProfileProvider());
    Get.lazyPut<ProfileController>(() => ProfileController(profileProvider: Get.find()));

    Get.lazyPut<DashboardProvider>(() => DashboardProvider());
    Get.lazyPut<DashboardController>(() => DashboardController(dashboardProvider: Get.find()));
  }
}