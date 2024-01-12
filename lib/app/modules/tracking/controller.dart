import 'package:get/get.dart';
import 'package:member_rkm/app/data/providers/tracking_provider.dart';

class TrackingController extends GetxController {
  final TrackingProvider trackingProvider;

  TrackingController({required this.trackingProvider});

  final prizeDesc = Rx<String?>(null);
  final serialNumber = Rx<String?>(null);

  @override
  void onInit() {
    prizeDesc.value = Get.arguments['prizeDesc'];
    serialNumber.value = Get.arguments['serialNumber'];
    super.onInit();
  }

  @override
  void onClose() {
    prizeDesc.value = null;
    serialNumber.value = null;
    super.onClose();
  }
}
