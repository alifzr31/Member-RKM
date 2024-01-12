import 'package:get/get.dart';
import 'package:member_rkm/app/data/providers/allcontent_provider.dart';
import 'package:member_rkm/app/modules/content/all_content/controller.dart';

class AllContentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AllContentProvider>(() => AllContentProvider());
    Get.lazyPut<AllContentController>(() => AllContentController(allContentProvider: Get.find()));
  }
}