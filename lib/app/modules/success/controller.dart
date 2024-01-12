import 'package:get/get.dart';

class SuccessController extends GetxController {
  final title = Rx<String?>(null);
  final subtitle = Rx<String?>(null);

  @override
  void onInit() {
    title.value = Get.arguments['title'];
    subtitle.value = Get.arguments['subtitle'];
    super.onInit();
  }
}