import 'package:get/get.dart';
import 'package:member_rkm/app/data/providers/detailcontent_provider.dart';
import 'package:member_rkm/app/modules/content/detail_content/controller.dart';

class DetailContentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailContentProvider>(() => DetailContentProvider());
    Get.lazyPut<DetailContentController>(() => DetailContentController(detailContentProvider: Get.find()));
  }
}