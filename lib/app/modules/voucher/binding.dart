import 'package:get/get.dart';
import 'package:member_rkm/app/data/providers/voucher_provider.dart';
import 'package:member_rkm/app/modules/voucher/controller.dart';

class VoucherBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => VoucherProvider());
    Get.lazyPut(() => VoucherController(voucherProvider: Get.find()));
  }
}