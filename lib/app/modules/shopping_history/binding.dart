import 'package:get/get.dart';
import 'package:member_rkm/app/data/providers/shopping_provider.dart';
import 'package:member_rkm/app/modules/shopping_history/controller.dart';

class ShoppingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ShoppingProvider());
    Get.lazyPut(() => ShoppingController(shoppingProvider: Get.find()));
  }
}