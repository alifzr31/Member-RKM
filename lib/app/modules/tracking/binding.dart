import 'package:get/get.dart';
import 'package:member_rkm/app/data/providers/tracking_provider.dart';
import 'package:member_rkm/app/modules/tracking/controller.dart';

class TrackingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TrackingProvider());
    Get.lazyPut(() => TrackingController(trackingProvider: Get.find()));
  }
}